CREATE TABLE arcade.Store (
    store_id        INT         PRIMARY KEY,
    store_location  VARCHAR(50) NOT NULL
);


CREATE TABLE arcade.Supplier (
    NIF             CHAR(9)    CHECK(NIF NOT LIKE '%[^0-9]%') PRIMARY KEY /*check(NIF is numeric)*/,
    email           VARCHAR(30) check( email LIKE '%@%.%' ),  /*check email format*/
    phone_no        VARCHAR(15) NOT NULL,
    sup_address     VARCHAR(30) NOT NULL,
    sup_name        VARCHAR(30) NOT NULL
);

CREATE TABLE arcade.Publisher (
    pub_id          INT         PRIMARY KEY,
    pub_name        VARCHAR(30) NOT NULL,
    pub_location    VARCHAR(100), /*pode ser online, logo null */
    is_indie        BIT         DEFAULT 0
);

CREATE TABLE arcade.Game (
    game_id         INT         PRIMARY KEY,
    game_name       VARCHAR(30) NOT NULL,
    publisher_id    INT         NOT NULL,
    point_value     INT         NOT NULL DEFAULT 0 CHECK (point_value >= 0),
    credit_cost     INT         NOT NULL DEFAULT 1 CHECK (credit_cost >= 0),
    no_players      INT         NOT NULL DEFAULT 2 CHECK (no_players > 0),  
    FOREIGN KEY(publisher_id) REFERENCES arcade.Publisher(pub_id)
);

CREATE TABLE arcade.ArcadeMachine(
    serial_no       INT          PRIMARY KEY,
    manufacturer    VARCHAR(30),
    NIF             CHAR(9)     NOT NULL CHECK(NIF NOT LIKE '%[^0-9]%'),
    code            INT         ,   
    store_id        INT         NOT NULL,
    FOREIGN KEY (NIF) REFERENCES arcade.Supplier(NIF),
    FOREIGN KEY (code) REFERENCES arcade.Game(game_id),
    FOREIGN KEY (store_id) REFERENCES arcade.Store(store_id)
);

CREATE TABLE arcade.Rents (
    id              INT         IDENTITY(1,1),
    machine_no      INT         NOT NULL,
    supplier        CHAR(9)     NOT NULL CHECK(supplier NOT LIKE '%[^0-9]%'),
    rent_cost       MONEY       NOT NULL DEFAULT 0 CHECK (rent_cost >= 0),
    rent_duration   DATE        NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(machine_no) REFERENCES arcade.ArcadeMachine(serial_no),
    FOREIGN KEY(supplier) REFERENCES arcade.Supplier(NIF)
);

CREATE TABLE arcade.Client(
    client_no   INT             PRIMARY KEY,
    cli_name    VARCHAR(30)     NOT NULL,
    points      INT             NOT NULL DEFAULT 0 CHECK (points >= 0),
    credits     INT             NOT NULL DEFAULT 0 CHECK (credits >= 0)
);

CREATE TABLE arcade.Prize(
    pri_id          INT             PRIMARY KEY,
    pri_name        VARCHAR(30)     NOT NULL,
    pri_price       INT             NOT NULL,
    no_available    INT             DEFAULT 0 NOT NULL,
    store_id        INT             NOT NULL,
    FOREIGN KEY     (store_id) REFERENCES arcade.Store(store_id)
);

CREATE TABLE arcade.Schedule (
    schedule_code   INT         PRIMARY KEY,
    start_time      TIME, -- uhhh default 8h?
    end_time        TIME
);

CREATE TABLE arcade.ScheduleFunctions (
    schedule_code   INT,
    task            VARCHAR(30),
    PRIMARY KEY(schedule_code, task),
    FOREIGN KEY (schedule_code) REFERENCES arcade.Schedule(schedule_code)    
);

CREATE TABLE arcade.ScheduleWeekDays (
    schedule_code   INT,
    week_day        VARCHAR(10),
    PRIMARY KEY(schedule_code, week_day),
    FOREIGN KEY (schedule_code) REFERENCES arcade.Schedule(schedule_code)
);

CREATE TABLE arcade.Employee (
    emp_no      INT         PRIMARY KEY,
    emp_name    VARCHAR(40) NOT NULL,
    emp_address VARCHAR(50) NOT NULL,
    email       VARCHAR(50) NOT NULL CHECK( email LIKE '%@%.%' ),
    salary      MONEY       DEFAULT 0 CHECK (salary >= 0),
    phone_no    VARCHAR(20) NOT NULL,
    NIF         CHAR(9)     UNIQUE NOT NULL CHECK(NIF NOT LIKE '%[^0-9]%'),
    schedule    INT         NOT NULL,
    store       INT         NOT NULL,
    FOREIGN KEY(schedule) REFERENCES arcade.Schedule(schedule_code),
    FOREIGN KEY(store) REFERENCES arcade.Store(store_id)
);

CREATE TABLE arcade.Redeemed(
    op_id       INT     identity(1,1) primary key,
    quantity    INT     NOT NULL,
    time_stamp  DATETIME    NOT NULL,
    client_no   INT     NOT NULL,
    emp_no      INT     NOT NULL,
    pri_id      INT     NOT NULL,
    FOREIGN KEY(client_no) REFERENCES arcade.Client(client_no),
    FOREIGN KEY(emp_no)    REFERENCES arcade.Employee(emp_no),
    FOREIGN KEY (pri_id)   REFERENCES arcade.Prize(pri_id)
);

CREATE TABLE arcade.Played(
    id          INT     IDENTITY(1,1) PRIMARY KEY,
    time_stamp  DATETIME,
    playtime    TIME    NOT NULL,
    points_recv INT     DEFAULT 0,
    client      INT     NOT NULL,
	machine_no	INT		NOT NULL,
    FOREIGN KEY(client) REFERENCES arcade.Client(client_no),
    FOREIGN KEY(machine_no) REFERENCES arcade.ArcadeMachine(serial_no)
);

CREATE TABLE arcade.Maintained (
    op_id       INT     identity(1,1) PRIMARY KEY,
    employee    INT     NOT NULL,
    machine_no  INT     NOT NULL,
    time_stamp  DATETIME    NOT NULL,
    FOREIGN KEY(employee) REFERENCES arcade.Employee(emp_no),
    FOREIGN KEY(machine_no) REFERENCES arcade.ArcadeMachine(serial_no)
);

CREATE TABLE arcade.ToppedUp (
    op_id       INT     identity(1,1) PRIMARY KEY,
    employee    INT     NOT NULL,
    client      INT     NOT NULL,
    cost        MONEY   NOT NULL CHECK (cost >= 0),
    time_stamp  DATETIME    NOT NULL,
    credits     INT     NOT NULL CHECK (credits > 0),
    FOREIGN KEY(employee) REFERENCES arcade.Employee(emp_no),
    FOREIGN KEY(client)   REFERENCES arcade.Client(client_no)
);


CREATE OR ALTER PROCEDURE arcade.getMachinesWithNoGame
as
	select * from arcade.arcadeMachine where code = null

go