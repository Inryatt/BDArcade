select * from arcade.Employee
GO

/*
RETURN CODES:
	0: SUCCESS
	1: BAD PK
	2: BAD FK
	3: IS DUPLICATE
	4: INVALID DATA
	5: ???
*/


-- Machine games, supplier, and store location
CREATE PROCEDURE arcade.machine_list
AS
	select	serial_no, manufacturer, sup_name, game_name, store_location
	from	arcade.ArcadeMachine as M join arcade.Supplier as S on M.NIF=S.NIF
			join arcade.Game as G on M.code=G.game_id
			join arcade.Store as St on M.store_id=St.store_id
GO

-- Schedule times, tasks, and week days (this seems kinda bad)
CREATE PROCEDURE arcade.get_schedule
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

	select	task
	from	arcade.ScheduleFunctions
	where	schedule_code=@code;

	select	week_day
	from	arcade.ScheduleWeekDays
	where	schedule_code=@code;
GO

-- Get Machines from Supplier
CREATE PROCEDURE arcade.supplier_machines @supplier CHAR(9) = null
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
CREATE PROCEDURE arcade.game_machines @game INT = null
AS
	IF @game is null
	BEGIN
		PRINT 'Please enter game code!'
		RETURN 1
	END

	select serial_no from arcade.ArcadeMachine where code=@game;
GO

-- Game list with publisher names
CREATE PROCEDURE arcade.game_list
AS
	select  game_id, game_name, publisher_id, pub_name, point_value, credit_cost, no_players
	from	arcade.Game join arcade.Publisher on publisher_id=pub_id
GO

-- List of games from given publisher
CREATE PROCEDURE arcade.publisher_games @pub INT = null
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
CREATE PROCEDURE arcade.playtime_stats
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

	/*
	SELECT  @avg_time = cast(cast(avg(cast(CAST(play as datetime) as float)) as datetime) as time),
			@total_time = cast(cast(sum(cast(CAST(play as datetime) as float)) as datetime) as time)
			from @tmp;
	*/


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



/*
DECLARE @avg_time CHAR(9), @total_time CHAR(10);
EXEC arcade.playtime_stats @end_date = '2021-01-01', @avg_time = @avg_time OUTPUT, @total_time = @total_time OUTPUT
print @avg_time;
print @total_time;
*/

/*
DROP PROCEDURE arcade.machine_list;
DROP PROCEDURE arcade.get_schedule;
DROP PROCEDURE arcade.supplier_machines;
DROP PROCEDURE arcade.game_machines;
DROP PROCEDURE arcade.game_list;
DROP PROCEDURE arcade.publisher_games;
*/

/*
DECLARE @start time, @end time;
EXEC arcade.get_schedule_test 8001, @start OUTPUT, @end OUTPUT;
print @start;
print @end;*/

Go
CREATE PROCEDURE arcade.get_schedule_test
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

	/*select	task
	from	arcade.ScheduleFunctions
	where	schedule_code=@code;

	select	week_day
	from	arcade.ScheduleWeekDays
	where	schedule_code=@code;
	*/
GO


CREATE PROCEDURE arcade.alterClient
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

	IF @cli_name is not null
		BEGIN
			ALTER arcade.Client SET cli_name = @cli_name WHERE client_no=@cli_no;
		END
	IF @points is not null
		BEGIN
			ALTER arcade.Client SET points = @points WHERE client_no=@cli_no;
		END
	IF @credits is not null
		BEGIN
			ALTER arcade.Client SET credits = @credits WHERE client_no=@cli_no;
		END
	COMMIT TRAN
GO


create procedure arcade.deleteClient
	@cli_no int null,
as
	delete from arcade.client where client_no=@cli_no; --The trigger will take care of any complications that may arise
go


create procedure arcade.insertClient
	@cli_no int = null,
	@cli_name varchar(30) =null,
	@points int = null,
	@credits int = null
as
	
	BEGIN TRY
			insert into table arcade.Client 
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


CREATE PROCEDURE arcade.new_machine
	@serial_no int = null,
	@manufacturer varchar(50) = null,
	@supplier char(9) = null,
	@game int = null,
	@store int = null
AS
	IF @serial_no is null OR @supplier is null OR @game is null OR @store is null
	BEGIN
		PRINT 'Please enter all required parameters! (serial number, supplier NIF, game ID and store ID)'
		RETURN 1
	END
	
	IF @supplier not like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	BEGIN
		PRINT 'Invalid NIF format!'
		RETURN 4
	END

	IF @manufacturer is not null AND @manufacturer like '%--%'
	BEGIN
		PRINT 'Nuh uh! No injections please.'
		RETURN 4
	END


	BEGIN TRY
		INSERT  INTO arcade.ArcadeMachine (serial_no, manufacturer, NIF, code, store_id)
				VALUES (@serial_no, @manufacturer, @supplier, @game, @store)
	END TRY
	BEGIN CATCH
		DECLARE @err INT
		SELECT @err = ERROR_NUMBER()
		
		IF @err=547
		BEGIN
			PRINT 'Invalid supplier, game, or store does not exist!'
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


CREATE PROCEDURE arcade.insertSchedule
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

CREATE PROCEDURE arcade.addScheduleTask
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

CREATE PROCEDURE arcade.addScheduleWeekDay
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
		INSERT INTO arcade.ScheduleWeekDays VALUES (@code, @weekday);
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


create procedure arcade.topUp
	@value int = null
	@client  int = null
as
	@current_val int;
	select @current_val = credits from arcade.clients where @client=client_no
	
	alter table arcade.Client alter column credits values(@current_val+@value)
go

create procedure arcade.saleHistory
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




create procedure arcade.getChanges
	@user int = null
as

	select * from(
		select '+'+cast(credits as varchar(10)) as change, time_stamp from arcade.toppedup where client=@user
	union
	select '-'+cast(credit_cost as varchar(10)) as change,time_stamp
		from arcade.played join 
		(select credit_cost,serial_no from arcade.arcadeMachine join arcade.game on code=game_id) as machineInfo on machine_no=serial_no where client=@user order by time_stamp
	)

go

/*


declare @days int =3;
declare @machine int =128170507
select * from arcade.arcadeMachine

exec  arcade.extendRent @machine_id = 128170507, @days=3 --extends in 3 days

select * from arcade.rents where machine_no= 128170507


*/


create procedure arcade.extendRent
	@machine_id int = null,
	@days int = null ,
	@months int = null,
	@years int = null
as

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
go


CREATE PROCEDURE arcade.redeemPrize
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

/* 
	exec arcade.getEmployees 1001
*/
create procedure arcade.getEmployees
	@store int = null
as
	select * from arcade.employee where @store=store

go


/*
declare @code int = 8001
exec arcade.getTask @code
*/

create procedure arcade.getTask
	@code int = null
as
	select task from arcade.ScheduleFunctions where @code=schedule_code

go

create procedure arcade.getPublisher
as
	select concat(pub_id,' ',pub_name) as pub from arcade.publisher 

go