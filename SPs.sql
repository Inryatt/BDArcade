/*
RETURN CODES:
	0: SUCCESS
	1: BAD PK
	2: BAD FK
	3: IS DUPLICATE
	4: INVALID DATA
	5: ???
*/


-- Get Machines from Supplier
CREATE OR ALTER PROCEDURE arcade.supplier_machines @supplier CHAR(9) = null
AS
	IF @supplier is null
	BEGIN
		PRINT 'Please enter supplier NIF!'
		RETURN 1
	END

	IF @supplier not like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	BEGIN
		-- no sql injections pls
		PRINT 'Invalid NIF format!'
		RETURN
	END

	select serial_no from arcade.ArcadeMachine where NIF=@supplier;
GO

-- Get machines with given game
CREATE OR ALTER PROCEDURE arcade.game_machines @game INT = null
AS
	IF @game is null
	BEGIN
		PRINT 'Please enter game code!'
		RETURN 1
	END

	select serial_no from arcade.ArcadeMachine where code=@game;
GO

-- Game list with publisher names
CREATE OR ALTER PROCEDURE arcade.game_list
AS
	select  game_id, game_name, publisher_id, pub_name, point_value, credit_cost, no_players
	from	arcade.Game join arcade.Publisher on publisher_id=pub_id
GO

-- List of games from given publisher
CREATE OR ALTER PROCEDURE arcade.publisher_games @pub INT = null
AS
	IF @pub is null
	BEGIN
		PRINT 'Please enter a publisher id!'
		RETURN 1
	END

	select game_id from arcade.Game where publisher_id=@pub;
GO

-- total and average playtime, from start_date to end_date (dates optional)
-- client and game are optional as well
CREATE OR ALTER PROCEDURE arcade.playtime_stats
	@client INT = null,
	@game INT = null,
	@start_date DATE = null,
	@end_date DATE = null,
	@avg_time CHAR(9) OUTPUT,
	@total_time CHAR(10) OUTPUT
AS
	IF @start_date is null
	BEGIN
		SELECT @start_date = cast('0001-01-01' as DATE);
	END
	IF @end_date is null
	BEGIN
		SELECT @end_date = cast('9999-12-31' as DATE);
	END

	DECLARE @tmp TABLE(play TIME, cli_id INT, game_id INT);
	INSERT INTO @tmp select playtime, client, code
					 from arcade.Played join arcade.ArcadeMachine on machine_no=serial_no
					 where datediff(day, @start_date, time_stamp)>=0 AND datediff(day, time_stamp, @end_date)>=0;

	IF @client is not null
	BEGIN
		DELETE FROM @tmp WHERE cli_id!=@client;
	END
	IF @game is not null
	BEGIN
		DELETE FROM @tmp WHERE game_id!=@game;
	END


	DECLARE @curr_play TIME;
	DECLARE @play_count INT = 0;
	DECLARE @play_time INT = 0;

	DECLARE Cur CURSOR FAST_FORWARD FOR SELECT play FROM @tmp;
	OPEN Cur;

	FETCH Cur INTO @curr_play;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @play_count += 1;
		SELECT @play_time += DATEDIFF(second, '00:00:00', @curr_play);
		FETCH Cur INTO @curr_play;
	END

	CLOSE Cur;
	DEALLOCATE Cur;

	DECLARE @play_avg INT;
	SELECT @play_avg = @play_time / @play_count;

	DECLARE @dd INT;
	DECLARE @hms VARCHAR(10);

	SELECT @dd = @play_time / 86400;              						--Days
    SELECT @hms = CONVERT(VARCHAR, DATEADD(ss, @play_time, 0), 108);    --Hours, Minutes, Seconds
	SELECT @total_time =  STUFF(@hms, 1, 2, @dd * 24 + CAST(LEFT(@hms, 2) AS INT))

	SELECT @dd = @play_avg / 86400;              						--Days
    SELECT @hms = CONVERT(VARCHAR, DATEADD(ss, @play_avg, 0), 108);     --Hours, Minutes, Seconds
	SELECT @avg_time = STUFF(@hms, 1, 2, @dd * 24 + CAST(LEFT(@hms, 2) AS INT))
GO


Go
CREATE OR ALTER PROCEDURE arcade.get_schedule
	@code int = null,
	@starttime time OUTPUT,
	@endtime time OUTPUT
AS
	IF @code is null
	BEGIN
		PRINT 'Please enter schedule code!'
		RETURN 1
	END

	select	@starttime = start_time, @endtime = end_time
	from	arcade.Schedule
	where	schedule_code=@code;

GO



CREATE OR ALTER PROCEDURE arcade.topUp
	@value int = null,
	@client int = null
as
	IF @client is null OR @value is null
	BEGIN
		PRINT 'Please enter client and value!'
		RETURN 1
	END

	IF @value < 1
	BEGIN
		PRINT 'Value must be greater than 0!'
		RETURN 4
	END

	UPDATE arcade.Client SET credits += @value WHERE client_no=@client
go

CREATE OR ALTER PROCEDURE arcade.saleHistory
	@emp int = null
as

	select * from(
		select op_id,'Redeemed' as Task, emp_no as employee, time_stamp from arcade.Redeemed
		union
		select op_id,'Maintained' as Task,  employee, time_stamp from arcade.Maintained
		union
		select op_id,'Topped Up' as Task, employee, time_stamp from arcade.toppedup
	) as biglist where biglist.employee=@emp
go


CREATE OR ALTER PROCEDURE arcade.getChanges
	@user int = null
as
	select '+'+cast(credits as varchar(10)) as change, time_stamp from arcade.toppedup where client=@user
	union
	select '-'+cast(credit_cost as varchar(10)) as change,time_stamp
		from arcade.played join 
			(select credit_cost,serial_no from arcade.arcadeMachine join arcade.game on code=game_id) as machineInfo
			on machine_no=serial_no
		where client=@user
		order by time_stamp
go


CREATE OR ALTER PROCEDURE arcade.extendRent
	@machine_id int = null,
	@days int = null ,
	@months int = null,
	@years int = null
as
	BEGIN TRAN
	declare @date date
	select @date = rent_duration from arcade.rents where machine_no=@machine_id;
	if @days is not null
		begin
			update arcade.rents  set rent_duration = dateadd(day,@days,@date) where machine_no=@machine_id;
		end
	if @months is not null
		begin
			update arcade.rents set rent_duration = dateadd(month,@days,@date) where  machine_no=@machine_id;
		end
	if @years is not null
		begin
			update arcade.rents set rent_duration= dateadd(year,@days,@date) where machine_no=@machine_id;
		end
	COMMIT TRAN
GO


CREATE OR ALTER PROCEDURE arcade.redeemPrize
	@client int = null,
	@prize int = null,
	@employee int = null,
	@quantity int = 1
AS
	IF @client is null OR @prize is null OR @employee is null
	BEGIN
		PRINT 'Please provide client, prize, and employee!'
		RETURN 1
	END

	IF @quantity < 1
	BEGIN
		PRINT 'Invalid quantity!'
		RETURN 4
	END

	BEGIN TRY
		INSERT INTO arcade.Redeemed VALUES(@quantity, getdate(), @client, @employee, @prize);
	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()
		
		IF @err=547
		BEGIN
			PRINT 'Invalid client, prize, and/or employee!'
			RETURN 2
		END
		ELSE BEGIN
			PRINT 'Something went wrong!'
			RETURN 5
		END	
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.addGameToMachine
	@machine int = null,
	@game int = null
as
	IF @machine is null OR @game is null
	BEGIN
		PRINT 'Please enter machine and game!'
		RETURN 1
	END

	UPDATE arcade.arcadeMachine SET code = @game WHERE serial_no=@machine
go

CREATE OR ALTER PROCEDURE arcade.removeGameFromMachine
	@machine int = null
as

	UPDATE arcade.arcadeMachine SET code = null WHERE serial_no=@machine
go


-- GETS

create or alter procedure arcade.getEmployees
    @store int = null
as
    select * from arcade.employee where @store=store
go


CREATE OR ALTER PROCEDURE arcade.getEmployeeList
AS
	SELECT CONCAT(emp_no, ' ', emp_name) as employee FROM arcade.Employee WHERE NIF!='000000000'
GO


CREATE OR ALTER PROCEDURE arcade.getClientList
AS
	SELECT CONCAT(client_no, ' ', cli_name) as client FROM arcade.Client WHERE client_no!=6999
GO


create or alter procedure arcade.getTask
	@code int = null
as
	select task from arcade.ScheduleFunctions where @code=schedule_code

go


create or alter procedure arcade.getPublisher
as
	select concat(pub_id,' ',pub_name) as pub from arcade.publisher 

go


create or alter procedure arcade.getAllMachines
as
	select *  from arcade.arcadeMachine 

go


create or alter procedure arcade.getSupplier
as
	select * from arcade.supplier

go

create or alter procedure arcade.getGameID
	@name varchar(50) = null
AS
	select game_id from arcade.game where game_name=@name
go

	
CREATE OR ALTER PROCEDURE arcade.machine_list
AS
	select	serial_no, manufacturer, sup_name, game_name, store_location,St.store_id,game_id,code
	from	arcade.ArcadeMachine as M join arcade.Supplier as S on M.NIF=S.NIF
			join arcade.Game as G on M.code=G.game_id
			join arcade.Store as St on M.store_id=St.store_id
Go


CREATE OR ALTER PROCEDURE arcade.getMachineWithNoGame
as
	select * from arcade.ArcadeMachine where code is null
go


CREATE OR ALTER PROCEDURE arcade.getAllLogs
	@emp int = null
as
	select * from(
	select op_id,'Redeemed' as Task, emp_no as employee, time_stamp from arcade.Redeemed
	union
	select op_id,'Maintained' as Task,  employee, time_stamp from arcade.Maintained
	union
	select op_id,'Topped Up' as Task, employee, time_stamp from arcade.toppedup
	) as biglist where biglist.employee=@emp
go


create procedure arcade.getRedeemed
as
	select * from arcade.redeemed
go

create procedure arcade.getPlayed
as
	select * from arcade.played
go

create procedure arcade.getTopped
as
	select * from arcade.toppedUp
go


create procedure arcade.getMaintained
as
	select * from arcade.Maintained
go


-- INSERTS

create or alter procedure arcade.insertClient
	@cli_no int = null,
	@cli_name varchar(30) =null,
	@points int = null,
	@credits int = null
as
	
	BEGIN TRY
			insert into arcade.Client 
					values(@cli_no,@cli_name,@points,@credits);	

	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()
		
		IF @err=547
		BEGIN
			PRINT 'Missing value! (or something is null)'
			RETURN 2
		END
		ELSE
		IF @err=2627
		BEGIN
			PRINT 'Client ID entered already exists!'
			RETURN 3
		END
		ELSE BEGIN
			PRINT 'Something went wrong!'
			RETURN 5
		END		
	END CATCH
go


CREATE OR ALTER PROCEDURE arcade.insertMachine
	@serial_no int = null,
	@manufacturer varchar(50) = null,
	@supplier char(9) = null,
	@game int = null,
	@store int = null,
	@rent_cost money = null,
	@rent_end_date date = null
AS
	IF @serial_no is null OR @supplier is null OR @game is null OR @store is null OR @rent_cost is null OR @rent_end_date is null
	BEGIN
		PRINT 'Please enter all required parameters! (serial number, supplier NIF, game ID, store ID, rent cost, rent end date)'
		RETURN 1
	END
	
	IF @supplier not like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	BEGIN
		PRINT 'Invalid NIF format!'
		RETURN 4
	END

	IF DATEDIFF(DAY, GETDATE(), @rent_end_date) < 0
	BEGIN
		PRINT 'Rent end date cannot be in the past!'
		RETURN 4
	END

	IF @manufacturer is not null AND @manufacturer like '%--%'
	BEGIN
		PRINT 'Nuh uh! No injections please.'
		RETURN 4
	END

	BEGIN TRAN
	BEGIN TRY
		INSERT  INTO arcade.ArcadeMachine (serial_no, manufacturer, NIF, code, store_id)
				VALUES (@serial_no, @manufacturer, @supplier, @game, @store)
		INSERT  INTO arcade.Rents
				VALUES (@serial_no, @supplier, @rent_cost, @rent_end_date)
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()
		
		IF @err=547
		BEGIN
			PRINT 'Supplier, game, or store does not exist!'
			RETURN 2
		END
		ELSE IF @err=2627
		BEGIN
			PRINT 'Serial number entered already exists!'
			RETURN 3
		END
		ELSE
		BEGIN
			PRINT 'Something went wrong!'
			RETURN 5
		END

		ROLLBACK TRAN
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.insertSchedule
	@code INT = null,
	@start_time TIME = '08:00:00',
	@end_time TIME = '17:00:00'
AS
	IF @code is null
	BEGIN
		PRINT 'Please enter schedule code!'
		RETURN 1
	END

	BEGIN TRY
		INSERT INTO arcade.Schedule VALUES (@code, @start_time, @end_time);
	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()
		
		IF @err=339
		BEGIN
			PRINT 'Missing value! (or something is null)'
			RETURN 3
		END
		ELSE
		IF @err=2627
		BEGIN
			PRINT 'Schedule code entered already exists!'
			RETURN 3
		END
		ELSE BEGIN
			PRINT 'Something went wrong!'
			RETURN 5
		END		
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.addScheduleTask
	@code INT = null,
	@task VARCHAR(30) = null
AS
	IF @code is null
	BEGIN
		PRINT 'Please enter schedule code!'
		RETURN 1
	END

	IF @task is null
	BEGIN
		PRINT 'Please enter task!'
		RETURN 1
	END

	BEGIN TRY
		INSERT INTO arcade.ScheduleWeekDays VALUES (@code, @task);
	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()
		
		IF @err=547
		BEGIN
			PRINT 'There is no schedule with given code!'
			RETURN 2
		END
		ELSE
		IF @err=2627
		BEGIN
			RETURN
		END
		ELSE BEGIN
			PRINT 'Something went wrong!'
			RETURN 5
		END	
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.addScheduleWeekDay
	@code INT = null,
	@week_day VARCHAR(10) = null
AS
	IF @code is null
	BEGIN
		PRINT 'Please enter schedule code!'
		RETURN 1
	END

	IF @week_day is null
	BEGIN
		PRINT 'Please enter weekday!'
		RETURN 1
	END

	BEGIN TRY
		INSERT INTO arcade.ScheduleWeekDays VALUES (@code, @week_day);
	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()
		
		IF @err=547
		BEGIN
			PRINT 'There is no schedule with given code!'
			RETURN 2
		END
		ELSE
		IF @err=2627
		BEGIN
			RETURN
		END
		ELSE BEGIN
			PRINT 'Something went wrong!'
			RETURN 5
		END	
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.insertEmployee
	@emp_no INT = null,
	@name VARCHAR(40) = null,
	@address VARCHAR(50) = null,
	@email VARCHAR(50) = null,
	@salary MONEY = null,
	@phone_no VARCHAR(20) = null,
	@nif CHAR(9) = null,
	@schedule INT = null,
	@store INT = null
AS
	IF @emp_no is null OR @name is null OR @nif is null OR @schedule is null OR @store is null
	BEGIN
		PRINT 'Please enter all required parameters! (employee number, name, NIF, schedule, and store ID)'
		RETURN 1
	END
	
	IF @nif not like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	BEGIN
		PRINT 'Invalid NIF format!'
		RETURN 4
	END


	BEGIN TRY
		INSERT  INTO arcade.Employee
				VALUES (@emp_no, @name, @address, @email, @salary, @phone_no, @nif, @schedule, @store)
	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()
		
		IF @err=547
		BEGIN
			PRINT 'Schedule or store does not exist!'
			RETURN 2
		END
		ELSE IF @err=2627
		BEGIN
			PRINT 'Employee Number entered already exists!'
			RETURN 3
		END
		ELSE
		BEGIN
			PRINT 'Something went wrong!'
			RETURN 5
		END		
	END CATCH
GO

CREATE OR ALTER PROCEDURE arcade.insertGame
	@id INT = null,
	@name VARCHAR(50) = null,
	@publisher INT = null,
	@point_value INT = null,
	@credit_cost INT = 1,
	@no_players INT = 2
AS
	IF @id is null OR @name is null OR @publisher is null OR @point_value is null
	BEGIN
		PRINT 'Please enter all required parameters! (game id, name, NIF, schedule, and store ID)'
		RETURN 1
	END

	BEGIN TRY
		INSERT  INTO arcade.Game
				VALUES (@id, @name, @publisher, @point_value, @credit_cost, @no_players)
	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()
		
		IF @err=547
		BEGIN
			PRINT 'Publisher does not exist!'
			RETURN 2
		END
		ELSE IF @err=2627
		BEGIN
			PRINT 'Game ID entered already exists!'
			RETURN 3
		END
		ELSE
		BEGIN
			PRINT 'Something went wrong!'
			RETURN 5
		END		
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.insertPublisher
	@id INT = null,
	@name VARCHAR(30) = null,
	@location VARCHAR(100) = null,
	@indie BIT = 0
AS
	IF @id is null OR @name is null
	BEGIN
		PRINT 'Please enter all required parameters! (publisher ID and name)'
		RETURN 1
	END

	BEGIN TRY
		INSERT  INTO arcade.Publisher
				VALUES (@id, @name, @location, @indie)
	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()

		IF @err=2627
		BEGIN
			PRINT 'Publisher ID entered already exists!'
			RETURN 3
		END
		ELSE
		BEGIN
			PRINT 'Something went wrong!'
			RETURN 5
		END		
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.insertSupplier
	@nif CHAR(9) = null,
	@email VARCHAR(50) = null,
	@phone_no VARCHAR(15) = null,
	@address VARCHAR(50) = null,
	@name VARCHAR(50) = null
AS
	IF @nif is null OR @phone_no is null
	BEGIN
		PRINT 'Please enter all required parameters! (supplier NIF and phone number)'
		RETURN 1
	END

	IF @nif not like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	BEGIN
		PRINT 'Invalid NIF format!'
		RETURN 4
	END

	BEGIN TRY
		INSERT  INTO arcade.Supplier
				VALUES (@nif, @email, @phone_no, @address, @name)
	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()
		
		IF @err=2627
		BEGIN
			PRINT 'Supplier NIF entered already exists!'
			RETURN 3
		END
		ELSE
		BEGIN
			PRINT 'Something went wrong!'
			RETURN 5
		END		
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.registerPlay
	@client INT = null,
	@machine INT = null,
	@points_recv INT = null,
	@playtime TIME = null
AS
	IF @client is null OR @machine is null OR @points_recv is null OR @playtime is null
	BEGIN
		PRINT 'Please enter all required parameters! (client no, machine serial no, points received, playtime)'
		RETURN 1
	END

	BEGIN TRY
		INSERT  INTO arcade.Played
				VALUES (GETDATE(),@playtime, @points_recv, @client, @machine)
	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()
		
		IF @err=547
		BEGIN
			PRINT 'Client or machine does not exist!'
			RETURN 2
		END
		ELSE
		BEGIN
			PRINT 'Something went wrong!'
			RETURN 5
		END		
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.registerPlay
	@client INT = null,
	@machine INT = null,
	@points_recv INT = null,
	@playtime TIME = null
AS
	IF @client is null OR @machine is null OR @points_recv is null OR @playtime is null
	BEGIN
		PRINT 'Please enter all required parameters! (client no, machine serial no, points received, playtime)'
		RETURN 1
	END

	BEGIN TRY
		INSERT  INTO arcade.Played
				VALUES (GETDATE(),@playtime, @points_recv, @client, @machine)
	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()
		
		IF @err=547
		BEGIN
			PRINT 'Client or machine does not exist!'
			RETURN 2
		END
		ELSE
		BEGIN
			PRINT 'Something went wrong!'
			RETURN 5
		END		
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.registerMaintenance
	@employee INT = null,
	@machine INT = null
AS
	IF @employee is null OR @machine is null
	BEGIN
		PRINT 'Please enter all required parameters! (employee no, machine serial no)'
		RETURN 1
	END

	BEGIN TRY
		INSERT  INTO arcade.Maintained
				VALUES (@employee, @machine, GETDATE())
	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()
		
		IF @err=547
		BEGIN
			PRINT 'Employee or machine does not exist!'
			RETURN 2
		END
		ELSE
		BEGIN
			PRINT 'Something went wrong!'
			RETURN 5
		END		
	END CATCH
GO


-- DELETES

CREATE OR ALTER PROCEDURE arcade.deleteClient
	@cli_no int null
as
	delete from arcade.client where client_no=@cli_no; --The trigger will take care of any complications that may arise
go


CREATE OR ALTER PROCEDURE arcade.deleteMachine @serial_no INT = null
AS
	IF @serial_no is null
	BEGIN
		PRINT 'Please provide machine serial no.!'
		RETURN 1
	END

	BEGIN TRY
		DELETE FROM arcade.ArcadeMachine WHERE serial_no=@serial_no
	END TRY
	BEGIN CATCH
		PRINT 'An error occurred when trying to delete machine! Operation Cancelled.'
	END CATCH
GO

CREATE OR ALTER PROCEDURE arcade.deleteMachine @serial_no INT = null
AS
	IF @serial_no is null
	BEGIN
		PRINT 'Please provide machine serial no.!'
		RETURN 1
	END

	BEGIN TRY
		DELETE FROM arcade.ArcadeMachine WHERE serial_no=@serial_no
	END TRY
	BEGIN CATCH
		PRINT 'An error occurred when trying to delete machine! Operation Cancelled.'
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.deleteGame @game_id INT = null
AS
	IF @game_id is null
	BEGIN
		PRINT 'Please provide game ID!'
		RETURN 1
	END

	BEGIN TRY
		DELETE FROM arcade.Game WHERE game_id=@game_id
	END TRY
	BEGIN CATCH
		PRINT 'An error occurred when trying to delete game! Operation Cancelled.'
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.deleteSupplier @supplierNIF CHAR(9) = null
AS
	IF @supplierNIF is null
	BEGIN
		PRINT 'Please provide supplier NIF!'
		RETURN 1
	END

	BEGIN TRY
		DELETE FROM arcade.Supplier WHERE NIF=@supplierNIF
	END TRY
	BEGIN CATCH
		PRINT 'An error occurred when trying to delete supplier! Operation Cancelled.'
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.deleteSchedule @code INT = null
AS
	IF @code is null
	BEGIN
		PRINT 'Please provide schedule code!'
		RETURN 1
	END

	BEGIN TRY
		DELETE FROM arcade.Schedule WHERE schedule_code=@code
	END TRY
	BEGIN CATCH
		PRINT 'An error occurred when trying to delete schedule! Operation Cancelled.'
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.deleteScheduleFunction @code INT = null, @task VARCHAR(30) = null
AS
	IF @code is null OR @task is null
	BEGIN
		PRINT 'Please provide schedule code and task!'
		RETURN 1
	END

	BEGIN TRY
		DELETE FROM arcade.ScheduleFunctions WHERE schedule_code=@code AND task=@task
	END TRY
	BEGIN CATCH
		PRINT 'An error occurred when trying to delete task! Operation Cancelled.'
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.deleteScheduleDay @code INT = null, @week_day VARCHAR(10) = null
AS
	IF @code is null OR @week_day is null
	BEGIN
		PRINT 'Please provide schedule code and day!'
		RETURN 1
	END

	BEGIN TRY
		DELETE FROM arcade.ScheduleWeekDays WHERE schedule_code=@code AND week_day=@week_day
	END TRY
	BEGIN CATCH
		PRINT 'An error occurred when trying to delete day! Operation Cancelled.'
	END CATCH
GO


-- ALTERS

CREATE OR ALTER PROCEDURE arcade.alterClient
	@cli_no INT = null,
	@cli_name VARCHAR(30) = null,
	@points INT = null,
	@credits INT = null
AS
	IF @cli_no is null
	BEGIN
		PRINT 'No client specified!'
		RETURN 1
	END

	IF @cli_name like '%--%'
	BEGIN
		PRINT 'Nuh uh! No injections please.'
		RETURN 4
	END

	BEGIN TRAN
	BEGIN TRY
		IF @cli_name is not null
			BEGIN
				UPDATE arcade.Client SET cli_name = @cli_name WHERE client_no=@cli_no;
			END
		IF @points is not null
			BEGIN
				UPDATE arcade.Client SET points = @points WHERE client_no=@cli_no;
			END
		IF @credits is not null
			BEGIN
				UPDATE arcade.Client SET credits = @credits WHERE client_no=@cli_no;
			END
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		PRINT 'An error occured while updating client! Canceling Operation.'
		ROLLBACK TRAN
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.alterEmployee
	@emp_no INT = null,
	@name VARCHAR(40) = null,
	@address VARCHAR(50) = null,
	@email VARCHAR(50) = null,
	@salary MONEY = null,
	@phone_no VARCHAR(20) = null,
	@schedule INT = null,
	@store INT = null
AS
	IF @emp_no is null
	BEGIN
		PRINT 'No employee specified!'
		RETURN 1
	END

	IF @name like '%--%' OR @address like '%--%' OR @email like '%--%' OR @phone_no like '%--%'
	BEGIN
		PRINT 'Nuh uh! No injections please.'
		RETURN 4
	END

	BEGIN TRAN

	BEGIN TRY
		IF @name is not null
			BEGIN
				UPDATE arcade.Employee SET emp_name = @name WHERE emp_no=@emp_no;
			END
		IF @address is not null
			BEGIN
				UPDATE arcade.Employee SET emp_address = @address WHERE emp_no=@emp_no;
			END
		IF @email is not null
			BEGIN
				UPDATE arcade.Employee SET email = @email WHERE emp_no=@emp_no;
			END
		IF @salary is not null
			BEGIN
				UPDATE arcade.Employee SET salary = @salary WHERE emp_no=@emp_no;
			END
		IF @phone_no is not null
			BEGIN
				UPDATE arcade.Employee SET phone_no = @phone_no WHERE emp_no=@emp_no;
			END
		IF @schedule is not null
			BEGIN
				UPDATE arcade.Employee SET schedule = @schedule WHERE emp_no=@emp_no;
			END
		IF @store is not null
			BEGIN
				UPDATE arcade.Employee SET store = @store WHERE emp_no=@emp_no;
			END
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		PRINT 'An error occured while updating employee! Canceling Operation.'
		ROLLBACK TRAN
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.alterGame
	@game_id INT = null,
	@name VARCHAR(50) = null,
	@point_value INT = null,
	@credit_cost INT = null,
	@no_players INT = null
AS
	IF @game_id is null
	BEGIN
		PRINT 'No game specified!'
		RETURN 1
	END

	IF @name like '%--%'
	BEGIN
		PRINT 'Nuh uh! No injections please.'
		RETURN 4
	END

	BEGIN TRAN
	BEGIN TRY
		IF @name is not null
			BEGIN
				UPDATE arcade.Game SET game_name = @name WHERE game_id=@game_id;
			END
		IF @point_value is not null
			BEGIN
				UPDATE arcade.Game SET point_value = @point_value WHERE game_id=@game_id;
			END
		IF @credit_cost is not null
			BEGIN
				UPDATE arcade.Game SET credit_cost = @credit_cost WHERE game_id=@game_id;
			END
		IF @no_players is not null
			BEGIN
				UPDATE arcade.Game SET no_players = @no_players WHERE game_id=@game_id;
			END
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		PRINT 'An error occured while updating client! Canceling Operation.'
		ROLLBACK TRAN
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.alterPublisher
	@publisher_id INT = null,
	@name VARCHAR(30) = null,
	@location INT = null,
	@is_indie INT = null
AS
	IF @publisher_id is null
	BEGIN
		PRINT 'No publisher specified!'
		RETURN 1
	END

	IF @name like '%--%' OR @location like '%--%'
	BEGIN
		PRINT 'Nuh uh! No injections please.'
		RETURN 4
	END

	BEGIN TRAN
	BEGIN TRY
		IF @name is not null
			BEGIN
				UPDATE arcade.Publisher SET pub_name = @name WHERE pub_id=@publisher_id;
			END
		IF @location is not null
			IF @location='' OR @location='null'
				SELECT @location=null
			BEGIN
				UPDATE arcade.Publisher SET pub_location = @location WHERE pub_id=@publisher_id;
			END
		IF @is_indie is not null
			BEGIN
				UPDATE arcade.Publisher SET is_indie = @is_indie WHERE pub_id=@publisher_id;
			END
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		PRINT 'An error occured while updating publisher! Canceling Operation.'
		ROLLBACK TRAN
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.alterSupplier
	@nif CHAR(9) = null,
	@name VARCHAR(50) = null,
	@email VARCHAR(50) = null,
	@phone_no VARCHAR(15) = null,
	@address VARCHAR (50) = null
AS
	IF @nif is null
	BEGIN
		PRINT 'No supplier NIF specified!'
		RETURN 1
	END

	IF @name like '%--%' OR @email like '%--%' OR @phone_no like '%--%' OR @address like '%--%'
	BEGIN
		PRINT 'Nuh uh! No injections please.'
		RETURN 4
	END

	BEGIN TRAN
	BEGIN TRY
		IF @name is not null
			BEGIN
				UPDATE arcade.Supplier SET sup_name = @name WHERE NIF=@nif;
			END
		IF @email is not null
			BEGIN
				UPDATE arcade.Supplier SET email = @email WHERE NIF=@nif;
			END
		IF @phone_no is not null
			BEGIN
				UPDATE arcade.Supplier SET phone_no = @phone_no WHERE NIF=@nif;
			END
		IF @address is not null
			BEGIN
				UPDATE arcade.Supplier SET sup_address = @address WHERE NIF=@nif;
			END
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		PRINT 'An error occured while updating supplier! Canceling Operation.'
		ROLLBACK TRAN
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.alterMachine
	@serial_no INT = null,
	@game INT = null,
	@store INT = null
AS
	IF @serial_no is null
	BEGIN
		PRINT 'No machine serial no. specified!'
		RETURN 1
	END

	BEGIN TRAN
	BEGIN TRY
		IF @game is not null
			BEGIN
				UPDATE arcade.ArcadeMachine SET code = @game WHERE serial_no=@serial_no;
			END
		IF @store is not null
			BEGIN
				UPDATE arcade.ArcadeMachine SET store_id = @store WHERE serial_no=@serial_no;
			END
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		PRINT 'An error occured while updating machine! Canceling Operation.'
		ROLLBACK TRAN
	END CATCH
GO


CREATE OR ALTER PROCEDURE arcade.alterScheduleTimes
	@code INT = null,
	@start_time TIME = null,
	@end_time TIME = null
AS
	IF @code is null
	BEGIN
		PRINT 'No schedule specified!'
		RETURN 1
	END

	BEGIN TRAN
	BEGIN TRY
		IF @start_time is not null
			BEGIN
				UPDATE arcade.Schedule SET start_time = @start_time WHERE schedule_code=@code;
			END
		IF @end_time is not null
			BEGIN
				UPDATE arcade.Schedule SET end_time = @end_time WHERE schedule_code=@code;
			END
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		PRINT 'An error occured while updating schedule! Canceling Operation.'
		ROLLBACK TRAN
	END CATCH

GO
