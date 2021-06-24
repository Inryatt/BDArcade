-- arcade.ArcadeMachine
CREATE NONCLUSTERED INDEX IndMachineSupplierNIF ON arcade.ArcadeMachine(NIF);
CREATE NONCLUSTERED INDEX IndMachineManufacturer ON arcade.ArcadeMachine(manufacturer);

-- arcade.Client
CREATE NONCLUSTERED INDEX IndClientName ON arcade.Client(cli_name);

-- arcade.Employee
CREATE NONCLUSTERED INDEX IndEmployeeName ON arcade.Employee(emp_name);
CREATE NONCLUSTERED INDEX IndEmployeeAddress ON arcade.Employee(emp_address);
CREATE NONCLUSTERED INDEX IndEmployeeEmail ON arcade.Employee(email);
CREATE NONCLUSTERED INDEX IndEmployeePhone ON arcade.Employee(phone_no);

-- arcade.Supplier
CREATE NONCLUSTERED INDEX IndSupplierName ON arcade.Supplier(sup_name);
CREATE NONCLUSTERED INDEX IndSupplierAddress ON arcade.Supplier(sup_address);
CREATE NONCLUSTERED INDEX IndSupplierEmail ON arcade.Supplier(email);
CREATE NONCLUSTERED INDEX IndSupplierPhone ON arcade.Supplier(phone_no);

-- arcade.Publisher
CREATE NONCLUSTERED INDEX IndPublisherName ON arcade.Publisher(pub_name);
CREATE NONCLUSTERED INDEX IndPublisherLocation ON arcade.Publisher(pub_location);

-- arcade.Game
CREATE NONCLUSTERED INDEX IndGameName ON arcade.Game(game_name);
