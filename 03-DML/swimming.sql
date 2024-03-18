-- DML: INSERT INTO: add a new row into an existing table
INSERT INTO parents (first_name, last_name)
VALUES ("Daisy", "Lou");

INSERT INTO locations (name, address)
VALUES ("Bishan Swimming Complex", "Bishan St 81"), ("YCK Swimming Complex", "Ang Mo Kio Avenue 1");

-- Update an existing row
UPDATE locations SET name = "Commonwealth Sports Hall"
WHERE location_id = 2;

UPATE students SET swimming_level = "Intermediate"
WHERE student_id = 1;

-- Update multiple columns at the same time
UPDATE parents SET first_name = "Joe", last_name = "Tan"
WHERE parent_id = 4;

-- Delete
DELETE FROM locations
WHERE location_id = 5;