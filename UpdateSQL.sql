USE Healthcare_Distribution;

-- Add index to Merchandise 
CREATE INDEX idx_date_Ref ON Merchandise(date_Ref);
CREATE INDEX idx_supply_Ref ON Merchandise(supply_Ref);
CREATE INDEX idx_order_Ref ON Merchandise(order_Ref);


-- Add denormalized columns to ChainLocation table
ALTER TABLE ChainLocation
ADD COLUMN location_name VARCHAR(255),
ADD COLUMN region VARCHAR(10);

-- Update data for denormalized columns 

UPDATE ChainLocation cl
JOIN Hospital_Region hr ON cl.order_Ref = hr.order_Ref
SET cl.location_name = hr.location, cl.region = hr.region;


-- Example: Change data types and lengths
ALTER TABLE Order_Calender MODIFY month TINYINT;
ALTER TABLE Hospital_Region MODIFY region VARCHAR(20);

-- Example: Change data type for quantity and used columns
ALTER TABLE ChainLocation MODIFY qty INT;
ALTER TABLE Merchandise MODIFY used INT;

-- Example: If location information is already stored in Hospital_Region, consider removing it from ChainLoaction
ALTER TABLE ChainLocation DROP COLUMN location;



