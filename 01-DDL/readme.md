# Data Definition Language (DDL)
* It's for the creating tables in a MySQL server

# Log into MySQL
Login with the `root` user: `mysql -u root`

# Common MySQL commands

## Show all the databases on the server
```
show databases;
```

## Create a new database
```
create database <name of database>
```

For example, to create a database with the name `swimming_coach`, we use:
```
create database swimming_coach;
```

## Change the active database
```
use swimming_coach;
```

## Create the `parents` table
```
create table parents (
    parent_id int unsigned auto_increment primary key,
    first_name varchar(200) not null,
    last_name varchar(200) default ''
) engine = innodb;
```

## Show all the tables in a database
```
show tables;
```

## Examine a table
```
describe parents;
```

## Create the locations table
```
create table locations (
    location_id int unsigned auto_increment primary key,
    name varchar(255),
    address varchar(255)
) engine = innodb;
```


## Insert one parents
```
insert into parents (first_name, last_name) VALUES ("John", "Snow");
```

## SHow all rows from a table
```
select * from parents;
```

## Insert many rows at one go
```
insert into parents (first_name, last_name) VALUES
("Mary", "Su"),
("Alice", "White"),
("Jon", "Wick");
```

```
insert into locations (name, address) VALUES 
("Yishun Swimming Complex", "Yishun Ring Road 123"),
("Ang Mo Kio Swimming Complex", "Ang Mo Kio Road 456"),
("Tampines Swimming Complex", "Tampines West 518");
```

# Foreign Keys

## 1. Create the `students` table
```
CREATE TABLE students (
    student_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name varchar(45) NOT NULL,
    swimming_level VARCHAR(45),
    dob DATE not null
) ENGINE = innodb;
```

## 2. Add in the column for the foreign key
We will use the `ALTER TABLE` command which allows us to make changes to a table
```
ALTER TABLE students ADD COLUMN parent_id INT UNSIGNED;
```

## 3. Define the foreign key
```
ALTER TABLE students ADD CONSTRAINT fk_students_parents
    FOREIGN KEY (parent_id) REFERENCES parents(parent_id);
```

## 4. Add in some students
```
INSERT INTO students (name, swimming_level, dob, parent_id) 
VALUES ("Mary Snow", "Beginner", "2019-01-01", 1);
```

# How to add a new column to a table
Add email address to parents:
```
ALTER TABLE parents ADD COLUMN email VARCHAR(100);
```

# How to remove a column from a table
```
ALTER TABLE parents DROP COLUMN email;
```

# How to delete an entire table
```
DROP TABLE parents;
```