CREATE TABLE Organizations (
    organization_id INT IDENTITY(1,1) PRIMARY KEY,
    organization_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) NOT NULL,
    created_at DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE Projects (
    project_id INT IDENTITY(1,1) PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    organization_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES Organizations(organization_id)
);

CREATE TABLE Activities (
    activity_id INT IDENTITY(1,1) PRIMARY KEY,
    project_id INT,
    activity_name VARCHAR(100) NOT NULL,
    activity_date DATE NOT NULL,
    carbon_emissions DECIMAL(10, 2) NOT NULL,
    water_usage DECIMAL(10, 2) NOT NULL,
    energy_consumption DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

CREATE TABLE Impact_Metrics (
    metric_id INT IDENTITY(1,1) PRIMARY KEY,
    activity_id INT,
    metric_name VARCHAR(100) NOT NULL,
    metric_value DECIMAL(10, 2) NOT NULL,
    unit VARCHAR(50) NOT NULL,
    recorded_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (activity_id) REFERENCES Activities(activity_id)
);


--Data Insertion

-- Inserting into Organizations
INSERT INTO Organizations (organization_name, contact_person, contact_email) VALUES ('EcoCorp', 'Jane Doe', 'jane@ecocorp.com');
INSERT INTO Organizations (organization_name, contact_person, contact_email) VALUES ('GreenWorld', 'John Smith', 'john@greenworld.com');

-- Inserting into Projects
INSERT INTO Projects (project_name, organization_id, start_date, end_date) VALUES ('Renewable Energy Initiative', 1, '2023-01-01', '2023-12-31');
INSERT INTO Projects (project_name, organization_id, start_date, end_date) VALUES ('Water Conservation Program', 2, '2023-03-01', '2023-09-30');

-- Inserting into Activities
INSERT INTO Activities (project_id, activity_name, activity_date, carbon_emissions, water_usage, energy_consumption) VALUES (1, 'Solar Panel Installation', '2023-02-15', 200.50, 1000.00, 500.00);
INSERT INTO Activities (project_id, activity_name, activity_date, carbon_emissions, water_usage, energy_consumption) VALUES (2, 'Drip Irrigation Setup', '2023-04-10', 50.00, 5000.00, 200.00);

-- Inserting into Impact_Metrics
INSERT INTO Impact_Metrics (activity_id, metric_name, metric_value, unit) VALUES (1, 'Carbon Emissions', 200.50, 'kg CO2e');
INSERT INTO Impact_Metrics (activity_id, metric_name, metric_value, unit) VALUES (1, 'Water Usage', 1000.00, 'liters');
INSERT INTO Impact_Metrics (activity_id, metric_name, metric_value, unit) VALUES (1, 'Energy Consumption', 500.00, 'kWh');
INSERT INTO Impact_Metrics (activity_id, metric_name, metric_value, unit) VALUES (2, 'Carbon Emissions', 50.00, 'kg CO2e');
INSERT INTO Impact_Metrics (activity_id, metric_name, metric_value, unit) VALUES (2, 'Water Usage', 5000.00, 'liters');
INSERT INTO Impact_Metrics (activity_id, metric_name, metric_value, unit) VALUES (2, 'Energy Consumption', 200.00, 'kWh');