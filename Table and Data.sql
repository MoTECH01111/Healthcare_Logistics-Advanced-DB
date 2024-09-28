CREATE DATABASE Healthcare_Distribution;
USE Healthcare_Distribution;

-- Dimen Table
CREATE TABLE Order_Calender(
    date_Ref INT PRIMARY KEY,
    date DATE,
    day VARCHAR(15), 
    month INT,
    year INT
);

--  Dimen Table
CREATE TABLE Hospital_Region(
    order_Ref INT PRIMARY KEY,
    location_Ref INT,
    location VARCHAR(250),
    address VARCHAR(250),
    region VARCHAR(10)
);

--  Dimen Table
CREATE TABLE Supplies(
    supply_Ref INT PRIMARY KEY,
    supply VARCHAR(255),
    dept VARCHAR(255),
    Provider VARCHAR(255)
);

--  Dimen Table
CREATE TABLE ChainLocation(
    order_Ref INT PRIMARY KEY,
    location VARCHAR(255),
    equipment VARCHAR(255),
    product_Ref INT,
    qty INT
);

-- Fact Table
CREATE TABLE Merchandise(
    equip_Ref INT PRIMARY KEY,
    date_Ref INT,
    supply_Ref INT,
    used INT,
    order_Ref INT,
    FOREIGN KEY (date_Ref) REFERENCES Order_Calender(date_Ref),
    FOREIGN KEY (supply_Ref) REFERENCES Supplies(supply_Ref),
    FOREIGN KEY (order_Ref) REFERENCES ChainLocation(order_Ref)
);


-- Enter data into Order_Calender 
INSERT INTO Order_Calender(date_Ref ,date, day, month, year)
VALUES
    (1,'2024-02-09', 'Monday', 07, 2024),
    (2,'2024-03-16', 'Friday', 03, 2024),
    (3,'2024-04-13', 'Thursday', 04, 2024),
    (4,'2024-05-01', 'Thursday', 05, 2024),
    (5,'2024-05-17', 'Monday', 05, 2024),
    (6,'2024-06-09', 'Friday', 06, 2024),
    (7,'2024-06-25', 'Monday', 06, 2024),
    (8,'2024-07-05', 'Thursday', 07, 2024),
    (9,'2024-07-20', 'Friday', 07, 2024),
    (12,'2024-08-07', 'Monday', 08, 2024),
    (13,'2024-08-18', 'Thursday', 08, 2024);
    
    
-- Enter data into Supplies
INSERT INTO Supplies (supply_Ref, supply, dept, provider)
VALUES
	(399,'Supply X', 'General Surgery', 'Johnson'),
    (400,'Supply Y', 'Radiology', 'Phillips'),
    (501,'Supply A', 'Neurology', 'Medtronic'),
    (602,'Supply B', 'Cardiology', 'Abbott'),
    (744,'Supply C', 'Pathology', 'Fresenius'),
    (398,'Supply Z', 'General Surgery', 'Johnson'),
    (410,'Supply V', 'Radiology', 'Phillips'),
    (404,'Supply D', 'Neurology', 'Medtronic'),
    (660,'Supply E', 'Cardiology', 'Abbott'),
    (750,'Supply F', 'Pathology', 'Fresenius'),
    (397,'Supply G', 'General Surgery', 'Johnson');
   
    
    
 -- Entering data into Hospital_Region
INSERT INTO Hospital_Region (order_Ref, location_Ref, location, address, region)
VALUES
	 (09, 1385, 'Cardiology','St Kevins', 'Leinster'),
	 (07, 1384, 'Radiology','Beamount', 'Leinster'),
     (03, 1382, 'General Surgery','Clontarf', 'Leinster'),
     (95, 43379, 'Pathology','Victoria University', 'Munster'),
     (90, 43378, 'Neurology','Bon Secours', 'Munster'),
     (91, 43377, 'Cardiology','Mercy University', 'Munster'),
	 (12, 43379, 'Pathology','Victoria University', 'Ulster'),
     (10, 43378, 'Neurology','Bon', 'Ulster'),
     (11, 43377, 'Cardiology','Mercy University', 'Ulster'),
     (013, 40182, 'General Surgery','Mayo University', 'Connacht'),
     (014, 40181, 'Pathology','Galway University Hospital', 'Connacht');
    

 -- Entering data into ChainLocation
INSERT INTO ChainLocation (order_Ref,location,equipment, Product_Ref, qty)
VALUES
	 (09,'St Kevins','Syringe',8979,505),
	 (07, 'Beamount','Ventilator',6768,870),
     (03, 'Clontarf','Hospital Bed',3289,912),
     (95, 'Victoria University','Blood Pressure Monitor',3333,670),
     (90, 'Bon Secours','Anesthesia',4563,830),
     (91, 'Mercy University','Defibrillation',5646,258),
	 (12, 'Victoria University','Nebulizer',2786,458),
     (10, 'Bon Secours','Electrosurgery',6928,258),
     (11, 'Mercy University','Thermometer',5646,258),
     (013,'Mayo University','Traction',7879,298),
     (014,'Galway University Hospital','Stethoscope',4667,478);
     
     
     
     
-- Enter data into Merchandise
INSERT INTO Merchandise(equip_Ref,date_Ref, supply_Ref, used, order_Ref)
VALUES
    (678,1, 397, 111, 09),
    (890,2, 398, 158, 07),
    (345,3, 399, 165, 03),
    (656,4, 400, 138, 95),
    (348,5, 404, 118, 90),
    (778,6, 410, 67, 91),
    (865,7, 501, 89, 12),
    (911,8, 602, 129, 10),
    (675,9, 660, 198, 11),
    (281,12, 744, 179, 013),
    (230,13, 750, 125, 014);
