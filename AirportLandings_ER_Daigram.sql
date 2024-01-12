#Airport Landings ER Model
# Geo Region
CREATE TABLE geo_region (
    geo_region_id INT(2) NOT NULL AUTO_INCREMENT,
	geo_region_name VARCHAR(100) NOT NULL,
	PRIMARY KEY (geo_region_id)
    );
    
# Landing Type
CREATE TABLE landing_type (
    landing_type_id INT(3) NOT NULL AUTO_INCREMENT,
	landing_type VARCHAR(100),
	PRIMARY KEY (landing_type_id)
    );
    
# Activity Period
CREATE TABLE activity_period (
    activity_period_id INT(3) NOT NULL AUTO_INCREMENT,
	activity_period INT(6) NOT NULL,
	PRIMARY KEY (activity_period_id)
    );
    
# Aircraft Manufacturers
CREATE TABLE manufacturers (
    manufacture_id INT(2) NOT NULL AUTO_INCREMENT,
	manufacture_name VARCHAR(100) NOT NULL,
	PRIMARY KEY (manufacture_id)
    );
    
# Geo Summary
CREATE TABLE geo_summary (
    geo_summary_id INT(1) NOT NULL AUTO_INCREMENT,
	geo_summary_name VARCHAR(100),
	PRIMARY KEY (geo_summary_id)
    );

# Body Type
CREATE TABLE body_type (
    body_type_id INT(1) NOT NULL AUTO_INCREMENT,
	body_type_name VARCHAR(100),
	PRIMARY KEY (body_type_id)
    );

# Airlines
CREATE TABLE airlines (
    iata_code CHAR(2) NOT NULL,
	geo_region_id INT(2) NOT NULL,
	airline_name VARCHAR(100),
	PRIMARY KEY (iata_code),
    CONSTRAINT geo_region_fk FOREIGN KEY (geo_region_id)
    REFERENCES geo_region(geo_region_id)
    );
    
# Model
CREATE TABLE model (
    model_id INT(2) NOT NULL AUTO_INCREMENT,
	manufacture_id INT(2) NOT NULL,
	body_type_id INT(1) NOT NULL,
	model_name VARCHAR(100),
	PRIMARY KEY (model_id),
    CONSTRAINT manufacturers_fk FOREIGN KEY (manufacture_id)
    REFERENCES manufacturers(manufacture_id),
    
    CONSTRAINT body_type_fk FOREIGN KEY (body_type_id)
    REFERENCES body_type(body_type_id)
    );
    
# Codeshare    
CREATE TABLE codeshare (
    pub_airine_iata CHAR(2) NOT NULL AUTO_INCREMENT,
	landing_id INT(5) NOT NULL,
	PRIMARY KEY (pub_airine_iata, landing_id),
    CONSTRAINT airlines_fk FOREIGN KEY (pub_airine_iata)
    REFERENCES airlines(iata_code),
    
	CONSTRAINT landings_fk FOREIGN KEY (landing_id)
    REFERENCES landings(landing_id)
    );
    
# Version
CREATE TABLE version (
    version_id INT NOT NULL AUTO_INCREMENT,
	model_id INT(2) NOT NULL,
	version_name INT(3),
	PRIMARY KEY (version_id),
	CONSTRAINT model_fk FOREIGN KEY (model_id)
    REFERENCES model(model_id)
    );

# Landings
CREATE TABLE landings (
    landing_id INT(5) NOT NULL AUTO_INCREMENT,
    op_airline_iata CHAR(2) NOT NULL, 
    pub_airine_iata CHAR(2) NOT NULL, 
	manufacture_id INT(2) NOT NULL,
	geo_summary_id INT(1) NOT NULL,
	geo_region_id INT(2) NOT NULL,
	landing_type_id INT(1) NOT NULL,
	model_id INT(2) NOT NULL,
	version_id INT NOT NULL,
	activity_period_id INT(3) NOT NULL,
	landing_count INT,
	landing_weight INT,
	PRIMARY KEY (landing_id),
    CONSTRAINT airlines_fk FOREIGN KEY (op_airline_iata)
    REFERENCES airlines(iata_code),
    
	CONSTRAINT codeshare_fk FOREIGN KEY (pub_airine_iata)
    REFERENCES codeshare(pub_airine_iata),
    
    CONSTRAINT manufacturers_fk FOREIGN KEY (manufacture_id)
    REFERENCES manufacturers(manufacture_id),
    
    CONSTRAINT geo_summary_fk FOREIGN KEY (geo_summary_id)
    REFERENCES geo_summary(geo_summary_id),
    
    CONSTRAINT landing_type_fk FOREIGN KEY (landing_type_id)
    REFERENCES landing_type(landing_type_id),
    
    CONSTRAINT model_fk FOREIGN KEY (model_id)
    REFERENCES model(model_id),
    
    CONSTRAINT version_fk FOREIGN KEY (version_id)
    REFERENCES version(version_id),
    
    CONSTRAINT activty_period_fk FOREIGN KEY (activty_period_id)
    REFERENCES activty_period(activty_period_id)
    );
  
show global variables like 'local_infile';
set global local_infile=true;
set global local_infile=1;

LOAD DATA LOCAL INFILE 'geo_region.csv'
INTO TABLE `-g1fcp`.`geo_region`
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'geo_region.csv'
INTO TABLE `-g1fcp.geo`.`region_csv`
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'geo_region.csv'
INTO TABLE `-g1fcp.geo`.`region_csv`
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'geo_region.csv'
INTO TABLE `-g1fcp.geo`.`region_csv`
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'geo_region.csv'
INTO TABLE `-g1fcp.geo`.`region_csv`
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'geo_region.csv'
INTO TABLE `-g1fcp.geo`.`region_csv`
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


