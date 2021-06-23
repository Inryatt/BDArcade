-- arcade.ArcadeMachine

CREATE CLUSTERED INDEX IndSerialNo ON arcade.ArcadeMachine(serial_no);
CREATE INDEX IndMachineSupplierNIF ON arcade.ArcadeMachine(NIF);

-- arcade.Client

CREATE CLUSTERED INDEX IndClientNo ON arcade.Client(client_no);

-- arcade.Employee

CREATE CLUSTERED INDEX IndEmployeeNo ON arcade.Employee(emp_no);

-- arcade.Supplier

CREATE CLUSTERED INDEX IndSupplierNIF ON arcade.Supplier(NIF);

-- arcade.Game

CREATE CLUSTERED INDEX IndGameId ON arcade.Game(game_id);

-- arcade.Played

CREATE CLUSTERED INDEX IndPlayedId ON arcade.Played(id);

-- arcade.Redeemed

CREATE CLUSTERED INDEX IndRedeemedId ON arcade.Redeemed(op_id);

-- arcade.Maintained

CREATE CLUSTERED INDEX IndMaintainedId ON arcade.Maintained(maint_id);

-- arcade.ToppedUp

CREATE CLUSTERED INDEX IndToppedUpId ON arcade.ToppedUp(op_id);
