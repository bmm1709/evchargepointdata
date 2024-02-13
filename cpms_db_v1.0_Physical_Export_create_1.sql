-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-02-12 05:19:02.807

-- tables
-- Table: chargepoint_maintenance_logs
CREATE TABLE chargepoint_maintenance_logs (
    maintenance_id int  NOT NULL,
    station_id int  NOT NULL,
    log_date date  NOT NULL,
    description longtext  NOT NULL,
    charging_stations_charging_station_id int  NOT NULL,
    CONSTRAINT chargepoint_maintenance_logs_pk PRIMARY KEY (maintenance_id)
);

-- Table: charging_station_sessions
CREATE TABLE charging_station_sessions (
    cs_session_id int  NOT NULL,
    cs_station_id int  NOT NULL,
    user_id int  NOT NULL,
    start_time datetime  NOT NULL,
    end_time datetime  NOT NULL,
    kwperhr_delivered int  NOT NULL,
    payment_status varchar(50)  NOT NULL,
    session_status int  NOT NULL,
    users_user_id int  NOT NULL,
    charging_stations_charging_station_id int  NOT NULL,
    CONSTRAINT charging_station_sessions_pk PRIMARY KEY (cs_session_id)
);

-- Table: charging_stations
CREATE TABLE charging_stations (
    charging_station_id int  NOT NULL,
    charging_station_name varchar(255)  NOT NULL,
    charging_station_location varchar(255)  NOT NULL,
    number_of_ports int  NOT NULL,
    operator_id int  NOT NULL,
    port_type_id int  NOT NULL,
    port_type_name varchar(255)  NOT NULL,
    power_capacity varchar(20)  NOT NULL,
    port_status varchar(20)  NOT NULL,
    transactions_transaction_id int  NOT NULL,
    session_pricing_session_price_id int  NOT NULL,
    CONSTRAINT charging_stations_pk PRIMARY KEY (charging_station_id)
);

-- Table: fault_reports
CREATE TABLE fault_reports (
    report_id int  NOT NULL,
    station_id int  NOT NULL,
    reported_by_user int  NOT NULL,
    report_description longtext  NOT NULL,
    report_time datetime  NOT NULL,
    resolved_status boolean  NOT NULL,
    charging_stations_charging_station_id int  NOT NULL,
    CONSTRAINT fault_reports_pk PRIMARY KEY (report_id)
);

-- Table: notifications
CREATE TABLE notifications (
    notifications_id int  NOT NULL,
    user_id int  NOT NULL,
    message longtext  NOT NULL,
    timestamp datetime  NOT NULL,
    users_user_id int  NOT NULL,
    CONSTRAINT notifications_pk PRIMARY KEY (notifications_id)
);

-- Table: operators
CREATE TABLE operators (
    operator_id int  NOT NULL,
    operator_name varchar(255)  NOT NULL,
    operator_description longtext  NOT NULL,
    charging_stations_charging_station_id int  NOT NULL,
    CONSTRAINT operators_pk PRIMARY KEY (operator_id)
);

-- Table: session_pricing
CREATE TABLE session_pricing (
    session_price_id int  NOT NULL,
    station_id int  NOT NULL,
    port_type_id int  NOT NULL,
    price_per_kWh decimal(10,2)  NOT NULL,
    CONSTRAINT session_pricing_pk PRIMARY KEY (session_price_id)
);

-- Table: subscriptions
CREATE TABLE subscriptions (
    subscription_id int  NOT NULL,
    user_id int  NOT NULL,
    subscription_type varchar(50)  NOT NULL,
    start_date datetime  NOT NULL,
    end_date datetime  NOT NULL,
    users_user_id int  NOT NULL,
    CONSTRAINT subscriptions_pk PRIMARY KEY (subscription_id)
);

-- Table: transactions
CREATE TABLE transactions (
    transaction_id int  NOT NULL,
    session_id int  NOT NULL,
    transaction_amount int  NOT NULL,
    payment_method varchar(50)  NOT NULL,
    timestamp datetime  NOT NULL,
    CONSTRAINT transactions_pk PRIMARY KEY (transaction_id)
);

-- Table: users
CREATE TABLE users (
    user_id int  NOT NULL,
    username varchar(255)  NOT NULL,
    email varchar(255)  NOT NULL,
    phone varchar(20)  NOT NULL,
    address varchar(255)  NOT NULL,
    membership_type varchar(50)  NOT NULL,
    evtype varchar(50)  NOT NULL,
    connector_type varchar(50)  NOT NULL,
    CONSTRAINT users_pk PRIMARY KEY (user_id)
);

-- foreign keys
-- Reference: chargepoint_maintenance_logs_charging_stations (table: chargepoint_maintenance_logs)
ALTER TABLE chargepoint_maintenance_logs ADD CONSTRAINT chargepoint_maintenance_logs_charging_stations FOREIGN KEY chargepoint_maintenance_logs_charging_stations (charging_stations_charging_station_id)
    REFERENCES charging_stations (charging_station_id);

-- Reference: charging_station_sessions_charging_stations (table: charging_station_sessions)
ALTER TABLE charging_station_sessions ADD CONSTRAINT charging_station_sessions_charging_stations FOREIGN KEY charging_station_sessions_charging_stations (charging_stations_charging_station_id)
    REFERENCES charging_stations (charging_station_id);

-- Reference: charging_station_sessions_users (table: charging_station_sessions)
ALTER TABLE charging_station_sessions ADD CONSTRAINT charging_station_sessions_users FOREIGN KEY charging_station_sessions_users (users_user_id)
    REFERENCES users (user_id);

-- Reference: charging_stations_session_pricing (table: charging_stations)
ALTER TABLE charging_stations ADD CONSTRAINT charging_stations_session_pricing FOREIGN KEY charging_stations_session_pricing (session_pricing_session_price_id)
    REFERENCES session_pricing (session_price_id);

-- Reference: charging_stations_transactions (table: charging_stations)
ALTER TABLE charging_stations ADD CONSTRAINT charging_stations_transactions FOREIGN KEY charging_stations_transactions (transactions_transaction_id)
    REFERENCES transactions (transaction_id);

-- Reference: fault_reports_charging_stations (table: fault_reports)
ALTER TABLE fault_reports ADD CONSTRAINT fault_reports_charging_stations FOREIGN KEY fault_reports_charging_stations (charging_stations_charging_station_id)
    REFERENCES charging_stations (charging_station_id);

-- Reference: operators_charging_stations (table: operators)
ALTER TABLE operators ADD CONSTRAINT operators_charging_stations FOREIGN KEY operators_charging_stations (charging_stations_charging_station_id)
    REFERENCES charging_stations (charging_station_id);

-- Reference: subscriptions_users (table: subscriptions)
ALTER TABLE subscriptions ADD CONSTRAINT subscriptions_users FOREIGN KEY subscriptions_users (users_user_id)
    REFERENCES users (user_id);

-- Reference: users_notifications (table: notifications)
ALTER TABLE notifications ADD CONSTRAINT users_notifications FOREIGN KEY users_notifications (users_user_id)
    REFERENCES users (user_id);

-- End of file.

