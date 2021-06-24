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


CREATE TRIGGER machineDeleted ON arcade.arcadeMachine
INSTEAD of DELETE
AS
		DECLARE @machine_serial int;
		SELECT @machine_serial = serial_no from deleted;

	begin tran
		update arcade.rents set machine_no=0 where machine_no=@machine_serial;
		update arcade.Maintained set machine_no=0 where machine_no=@machine_serial;
		update arcade.played set machine_no=0 where machine_no=@machine_serial;
		
		delete from arcade.arcadeMachine where serial_no=@machine_serial;
	commit
GO


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


Create trigger tryToPlay on arcade.played
after Insert
as
	DECLARE @player INT;
	DECLARE @code int;
	DECLARE @points INT;

	Select @player = client, @code = machine_no, @points = points_recv from inserted;
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
		update arcade.client set credits-=@cost where @player=client_no;
		update arcade.client set points+=@points where @player=client_no;
	commit tran
	end
go


CREATE TRIGGER scheduleDeleted ON arcade.Schedule
INSTEAD OF DELETE
AS
	DECLARE @code INT;
	SELECT @code = schedule_code FROM DELETED;

	IF (SELECT COUNT(*) FROM arcade.Employee WHERE schedule=@code) > 0
	BEGIN
		PRINT 'There are still employees using this schedule!'
		RETURN
	END

	BEGIN TRAN

	DELETE FROM arcade.ScheduleFunctions WHERE schedule_code = @code;
	DELETE FROM arcade.ScheduleWeekDays WHERE schedule_code = @code;
	DELETE FROM arcade.Schedule WHERE schedule_code = @code;

	COMMIT TRAN
GO

