-- a)
CREATE PROC Remove_Employee @emp_ssn INT = null
AS
    IF @emp_ssn is null
    BEGIN
        PRINT 'Please enter employee ssn'
        RETURN
    END

    DELETE FROM TABLE dep WHERE Essn=@emp_ssn;
    DELETE FROM TABLE WORKS_ON WHERE Essn=@emp_ssn;
    UPDATE DEPARTMENT
        SET Mgr_ssn=null
        WHERE Mgr_ssn=@emp_ssn;
    
    DELETE FROM TABLE EMPLOYEE WHERE Ssn=@emp_ssn
GO

-- b)

create proc Get_Manager @ssn varchar(9) output, @years int output)
AS
    select * from employee join department on employee.ssn=department.Mgr_ssn;

    select @managers = * from employee join department on employee.ssn=department.Mgr_ssn ;
    
    select @ssn = ssn,@years = max(YearsAsManager) from (select ssn, datediff(YEAR,Mgr_start_date,getdate()) as YearsAsManager from @managers) group by ssn;

    --return --not sure is needed?
GO

-- c)
CREATE TRIGGER Manager_Check ON DEPARTMENT
AFTER INSERT, UPDATE
AS
    DECLARE @mgr as INT
    SELECT @mgr = Mgr_ssn from inserted;

    DECLARE @num_deps as INT
    SELECT @num_deps = count(Mgr_ssn) from DEPARTMENT where Mgr_ssn=@mgr;

    IF @num_deps > 1
    BEGIN
        RAISERROR ('Employee already manages a department!');
        ROLLBACK TRAN;
    END
GO

-- d)
/* Crie um trigger que não permita que determinado 
funcionário tenha um vencimento superior ao vencimento
 do gestor do seu departamento. Nestes casos,
  o trigger deve ajustar o salário do funcionário
   para um valor igual ao salário do gestor menos uma unidade. */
create TRIGGER Salary_Check on employee 
after insert,UPDATE
as
    declare @mgr_sal as int    
    select @mgr_sal = manager.salary from (select ssn,dno,salary from employee join department where Mgr_ssn=Ssn) as manager where inserted.Dno=manager.Dno
    
    if inserted.salary > @mgr_sal
        update employee set salary=@mgr_sal-1 where employee.ssn=inserted.ssn
    end
go


-- e)
CREATE FUNCTION Employee_Projects (@emp_ssn INT = null) RETURNS @proj TABLE (Proj_Name VARCHAR(50) = null, Proj_Location VARCHAR(50) = null)
AS
    BEGIN
    IF @emp_ssn is null
    BEGIN
        RETURN
    END

        INSERT @proj SELECT Pname, Plocation
                     FROM EMPLOYEE JOIN WORKS_ON ON Ssn=Essn JOIN PROJECT ON Pno=Pnumber
                     WHERE Ssn=@emp_ssn
        RETURN
    END
GO

-- f)

create function Above_Average_Earners ( @dno int ) 
returns TABLE
as
    declare @avg_sal as int
    select @avg_sal = avg(salary) from (select * from employee where dno=@dno) as emp 
    
    return(
       select * from ( select * from employee where dno=@dno) where salary>@avg_sal
    )
go

-- g)
CREATE FUNCTION Department_Projects (@dep INT = null)
RETURNS @table TABLE (pname VARCHAR(50), pnumber INT, plocation VARCHAR(50), dnum INT, budget MONEY, totalBudget MONEY)
AS
    BEGIN
        IF @dep is null
        BEGIN
            RETURN;
        END;

        DECLARE CUR CURSOR FAST_FORWARD
        FOR SELECT Pname, Pnumber, Plocation, Dnum
            FROM PROJECT JOIN DEPARTMENT ON Dnum=Dnumber
            WHERE Dnum=@dep;
        
        OPEN CUR;

        FETCH CUR INTO @pname, @pnumber, @plocation, @dnum;
        DECLARE @budget as MONEY;
        DECLARE @total_budget as MONEY;
        SELECT @budget = 0, @total_budget = 0;
        
        WHILE @@FETCH_STATUS = 0
        BEGIN
            SELECT @budget = sum(Salary*40) FROM WORKS_ON JOIN EMPLOYEE ON Essn=Ssn WHERE Pno=@pnumber;
            SELECT @total_budget += @budget;

            INSERT @table @pname, @pnumber, @plocation, @dnum, @budget, @total_budget;

            FETCH CUR INTO @pname, @pnumber, @plocation, @dnum;
        END;

        CLOSE CUR;
        DEALLOCATE CUR;
        RETURN;
    END
GO


-- h)
create TRIGGER copy_deleted_1 on department
after DELETE
as

    IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME ='department_deleted'))
        insert into department_deleted values deleted

    else
        create table department_deleted(
            dname varchar(50), 
            Dnumber int primary key,
            Mgr_ssn varchar(9),
            Mgr_start_date date
            )
        insert into department_deleted values (deleted.Dname,deleted.Dnumber,deleted.Mgr_ssn,deleted.Mgr_start_date;

    end
go

create TRIGGER copy_deleted_2 on department
instead of DELETE
as

    IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA ='???' AND TABLE_NAME ='department_deleted'))
        insert into department_deleted values deleted
        delete from department where deleted.Dnumber=department.Dnumber

    else
        create table department_deleted(
            dname varchar(50), 
            Dnumber int primary key,
            Mgr_ssn varchar(9),
            Mgr_start_date date
            )
        insert into department_deleted values (deleted.Dname,deleted.Dnumber,deleted.Mgr_ssn,deleted.Mgr_start_date);
        delete from department where deleted.Dnumber=department.Dnumber
    end
go

/*
CONCLUSÕES:
    Utilizar um trigger instead of permite-nos ter maior controlo sobre a operação efetuada, e salvar os dados antes destes serem apagados, ou
    efetuar outras operações antes de os apagar. No entanto, temos-de efectuar o delete dentro do trigger, o que adiciona mais operações
    ao processo e aumenta (ligeiramente) o tempo de execução. 
        -Em volumes muito elevados de operações, este atraso pode tornar-se significativo.

    No entanto, usar um after coloca menos peso na bd, sendo a operação de delete executada logo e depois copiados os dados para a nova tabela, em vez de
    intercetar a operação de delete, copiar os dados, e executar nova operação de delete.
*/


-- i)
/*
Relativamente aos stored procedure e UDFs, enumere as suas mais valias e as característicasque as distingue. 
Dê exemplos de situações em que se deve utiliza cada uma destas ferramentas
*/

/*
RESPOSTA:
Tanto as Stored Procedures e as UDFs têm as mesmas mais valias, como serem compilados apenas quando criados/alterados, oferecendo assim uma melhor performance face a batches de comandos, por exemplo.
No entanto, têm algumas propriedades diferentes.
UDFs têm de retornar um valor (enquanto que tal é opcional nas Stored Procedures), e aceitam apenas input parameters.

Stored Procedures são usualmente usadas para interagir de forma segura com a BD -- se o único modo de alterar e aceder a dados de uma BD for através de Stored Procedures pré-definidas, há muito menor
probabilidade de acontecerem acidentes, em vez de código sql arbitrário.

No entanto, UDFs como podem ser usadas a meio de outros comandos SQL (por exemplo, num WHERE, pode-se definir uma UDF para ir buscar certos elementos (apenas números pares, p/ex)), enquanto que Stored Procedures 
não, e também não se pode fazer joins com o output de uma Stored Procedure.

SP podem alterar as tabelas da base de dados, enquanto que UDFs não. Outra diferença é que UDFs não podem ser usadas para exception handling (p.e., usar TRY CATCH e levantar erros).

Assim, UDFs são usadas para ir buscar dados/filtrar dados, para serem utilizados noutro comando SQL, enquanto que Stored Procedures são utilizados para executar operações pré-definidas numa base de dados, 
de modo seguro e eficiente.

Exemplos:

-Selecionar tuplos que tenham um atributo numérico par - UDF
-Alterar os tuplos que tenham um atributo numérico par para ímpar - Stored Procedure

-Encontrar qual o employee com maior ssn da tabela e eliminá-lo - Stored Procedure
-Encontrar qual o employee com maior ssn para passar a uma outra query que aumente o seu salário - UDF

-Usar uma SP para inserir um novo tuplo numa tabela, e automaticamente atualizar outras tabelas dependentes.
-Substituir o comportamento normal de uma operação, como o DELETE - Trigger
-Garantir a consistência e integridade de dados após a modificação de uma tabela - Trigger

-Fornecer um conjunto de operações ao utilizador como única maneira de interagir com uma base de dados - Stored Procedure
-Reduzir a quantidade de código duplicado quando se tem várias queries a ir procurar um conjunto de dados super específico que origina uma comando de SELECT muito extenso - UDF

*/
