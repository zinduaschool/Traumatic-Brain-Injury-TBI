USE sql_tbi_data;

-- CREATING TABLES
-- create mechanisms table
CREATE TABLE mechanisms (
	mechanism_id INT NOT NULL PRIMARY KEY,
    mechanism_name VARCHAR(70)
);

INSERT INTO mechanisms
	(mechanism_id, mechanism_name)
VALUES
	(100, 'Motor Vehicle Crashes'),
	(101, 'Unintentional Falls'),
	(102, 'Unintentionally struck by or against an object'),
	(103, 'Other unintentional injury, mechanism unspecified'),
	(104, 'Assault'),
	(105, 'Other or no mechanism specified');

-- create outcomes table
CREATE TABLE outcomes (
	outcome_id INT NOT NULL PRIMARY KEY,
    outcome_name VARCHAR(70)
);

INSERT INTO outcomes
	(outcome_id, outcome_name)
VALUES
	(200, 'Emergency Department Visit'),
	(201, 'Hospitalizations'),
	(202, 'Deaths');

-- create tbi_age table
CREATE TABLE tbi_age (
	age_group VARCHAR(30),
    outcome_id INT NOT NULL,
    mechanism_id INT NOT NULL,
    number  INT,
    rate DOUBLE
);

INSERT INTO tbi_age
	(age_group, outcome_id, mechanism_id, number, rate)
VALUES 
	('0-4', '200', '100', '5464', '27.5'),
	('0-4', '200', '101', '230776', '1161'),
	('0-4', '200', '102', '53436', '268.8'),
	('0-4', '200', '103', '12007', '60.4'),
	('0-4', '200', '104', '674', '3.4'),
	('0-4', '200', '105', '19360', '97.4'),
	('5-14', '200', '100', '19785', '48'),
	('5-14', '200', '101', '133084', '323.1'),
	('5-14', '200', '102', '120839', '293.4'),
	('5-14', '200', '103', '30656', '74.4');


-- create tbi_year table
CREATE TABLE tbi_year (
	year VARCHAR(30),
    outcome_id INT NOT NULL,
    mechanism_id INT NOT NULL,
    number  INT,
    rate DOUBLE
);

INSERT INTO tbi_year
	(year, outcome_id, mechanism_id, number, rate)
VALUES
	('2006', '200', '100', '254793', '85.3'),
	('2007', '200', '100', '252459', '83.8'),
	('2008', '200', '100', '254391', '83.9'),
	('2009', '200', '100', '270240', '88.7'),
	('2010', '200', '100', '292942', '95.3'),
	('2011', '200', '100', '305694', '98.7'),
	('2012', '200', '100', '311271', '99.9'),
	('2013', '200', '100', '312048', '99.6'),
	('2014', '200', '100', '334144', '106');
 