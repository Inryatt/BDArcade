
/*
INSERT INTO arcade.Supplier ([NIF],[email],[phone_no],[sup_address],[sup_name]) VALUES ('128323702','sdasd@miac.com','949401351','5794 Lacus. Street','Cum Sociis Ltd');
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(128419737,'Cubilia Curae; Industries'                 ,'128323702'                           ,04029,01002);

--Erro -> ainda há maquinas a serem alugadas!
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(128419737,'128323702',401.04,'2021/07/25');
--Rent já expirou - pode ser apagado
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(128419737,'128323702',401.04,'2021/03/25');



delete from arcade.Supplier where NIF=128323702

delete from arcade.Rents where machine_no=128419737

select * from arcade.ArcadeMachine
select * from arcade.Supplier;
select * from arcade.Rents;

*/
CREATE TRIGGER supplierDeleted ON arcade.Supplier
INSTEAD OF DELETE
AS
	DECLARE @sup_nif CHAR(9);
	DECLARE @sup_machines TABLE(machine INT, dur DATE);
	SELECT @sup_nif = NIF FROM DELETED;

	IF @sup_nif = '000000000'
		RETURN

	INSERT INTO @sup_machines SELECT machine_no, rent_duration
							  FROM	 arcade.Rents WHERE supplier=@sup_nif;
	
	IF (SELECT count(*) FROM @sup_machines WHERE datediff(day, dur, getdate()) < 0) = 0
		BEGIN
			BEGIN TRAN
				UPDATE arcade.Rents SET machine_no = 0 WHERE machine_no IN (SELECT machine FROM @sup_machines);
				UPDATE arcade.Rents SET supplier = '000000000' WHERE supplier=@sup_nif;
				DELETE FROM arcade.ArcadeMachine WHERE serial_no IN (SELECT machine FROM @sup_machines);
				DELETE FROM arcade.Supplier WHERE NIF = @sup_nif;
			IF @@ROWCOUNT = 1
				COMMIT TRAN
			ELSE
				ROLLBACK TRAN
		END	
	ELSE
		PRINT 'There are still machines from this supplier being rented!'
GO

/*

select * from arcade.employee

delete from arcade.employee where emp_no=12004


select * from arcade.Redeemed
select * from arcade.Employee where emp_no = 12999
*/

GO
CREATE TRIGGER employeeDeleted ON arcade.Employee
INSTEAD of DELETE
AS
		DECLARE @emp_id int;
		SELECT @emp_id = emp_no from deleted;
	begin tran
		update arcade.Maintained set employee=12999 where employee=@emp_id;
		update arcade.Redeemed set emp_no=12999 where emp_no=@emp_id;
		update arcade.ToppedUp set employee=12999 where employee=@emp_id;
		
		delete from arcade.employee where emp_no=@emp_id;
	commit
		--delete employee
GO




GO
CREATE TRIGGER clientDeleted ON arcade.Client
INSTEAD of DELETE
AS
	
		DECLARE @cli_no int;
		SELECT @cli_no = client_no from deleted;
	begin tran
		update arcade.played set client=12999 where client=@cli_no;
		update arcade.redeemed set client_no=12999 where client_no=@cli_no;
		update arcade.ToppedUp set client=12999 where client=@cli_no;
		
		delete from arcade.client where client_no=@cli_no;
	commit
GO

GO
CREATE TRIGGER machineDeleted ON arcade.arcadeMachine
INSTEAD of DELETE
AS
		DECLARE @machine_serial int;
		SELECT @machine_serial = serial_no from deleted;
	begin tran
		update arcade.rents set machine_no=0 where machine_no=@machine_serial;
		update arcade.Maintained set machine_no=0 where machine_no=@mahcine_serial;
		update arcade.played set machine_no=0 where machine_no=@machine_serial;
		
		delete from arcade.arcadeMachine where serial_no=@machine_serial;
	commit
GO


/*

select * from arcade.prize

select * from arcade.client

select * from arcade.client where client_no=6000
--works
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2021-02-25 08:16:35',06000,12009,07001);

 select * from arcade.prize where pri_id=7001

select * from arcade.client


 --doesnt work

 --stock
 INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(40,'2021-02-25 08:16:35',06000,12009,07001);


 --credits

  INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(1,'2021-02-25 08:16:35',06027,12009,07001);

   select * from arcade.prize where pri_id=7001

select * from arcade.client where client_no=6000 or client_no=6027*/

CREATE TRIGGER prizeRedeemed ON arcade.Redeemed
AFTER INSERT
AS
	DECLARE @cli_no INT;
	DECLARE @cli_points INT;
	DECLARE @prize_id INT;
	DECLARE @prize_stock INT;
	DECLARE @prize_cost INT;
	DECLARE @quant INT;

	

	SELECT @cli_no = client_no, @prize_id = pri_id, @quant = quantity FROM INSERTED;

	SELECT @cli_points = points FROM arcade.Client WHERE client_no=@cli_no;
	SELECT @prize_stock = no_available, @prize_cost = pri_price FROM arcade.Prize WHERE pri_id=@prize_id;

	IF @cli_points < @prize_cost*@quant OR @prize_stock < @quant
		BEGIN
			PRINT 'Not enough points, or not enough stock'
			ROLLBACK TRAN
			RETURN
		END
	ELSE
		BEGIN
			BEGIN TRAN 
			UPDATE arcade.Client SET points = @cli_points - @quant*@prize_cost WHERE client_no=@cli_no;
			UPDATE arcade.Prize SET no_available = @prize_stock - @quant WHERE pri_id=@prize_id;
			COMMIT TRAN
		END

GO


CREATE TRIGGER gameDeleted ON arcade.Game
AFTER DELETE
AS
	DECLARE @game INT;
	DECLARE @pub INT;

	SELECT @game = game_id, @pub = publisher_id FROM DELETED;

	IF (SELECT count(*) FROM arcade.Game WHERE publisher_id=@pub) = 0
		DELETE FROM arcade.Publisher WHERE pub_id=@pub;
GO

/*

select serial_no,credit_cost from arcade.arcadeMachine join arcade.Game on code=game_id where serial_no=118546459

select * from arcade.game

select * from arcade.client where client_no=6009
select * from arcade.client where client_no=6000

INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-07-01 20:04:01','00:26:22',48,6000,118546459);


INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-07-01 20:04:01','00:26:22',48,6009,118546459);
select * from arcade.client where client_no=6009
select * from arcade.client where client_no=6000
*/

go
Create trigger tryToPlay on arcade.played
after Insert
as
	DECLARE @player INT;
	DECLARE @code int;

	Select @player = client, @code = machine_no from inserted
	DECLARE @cost INT;

	select @cost = credit_cost from (select serial_no,credit_cost from arcade.arcadeMachine join arcade.Game on code=game_id)as r where @code= serial_no;

	if (select credits from arcade.client where client_no=@player)<@cost
	begin
		print 'This client does not have enough credits to play.'
		ROLLBACK tran
		return
	end
	ELSE
	begin
	begin tran
		
		declare @player_creds int;
		select @player_creds = credits from arcade.client where @player=client_no;
		update arcade.client set credits=@player_creds-@cost where @player=client_no;
	commit tran
	end
go

