## Customer

# create table
```
CREATE TABLE customers (
    customer_id int UNSIGNED auto_increment primary key,
    name VARCHAR(255),
    email VARCHAR(255),
    contact_no VARCHAR(20)
) ENGINE = innodb;
```

# sample data
```
INSERT INTO customers (name, email, contact_no)
VALUES 
("Chevonne", "chevonne@gmail.com", "96752722"),
("Crystal", "crystal@gmail.com", "98625678");
```




## Appointments

# create table
```
CREATE TABLE appointments (
    appointment_id int UNSIGNED auto_increment primary key,
    appointment_slot datetime
) ENGINE = innodb;
```

# reference foreign key
ALTER TABLE appointments ADD COLUMN customer_id int UNSIGNED;
ALTER TABLE appointments ADD CONSTRAINT fk_appointment_customer 
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id);

ALTER TABLE appointments ADD COLUMN stylist_id int UNSIGNED;
ALTER TABLE appointments ADD CONSTRAINT fk_appointment_stylist
    FOREIGN KEY (stylist_id) REFERENCES stylists (stylist_id);

# sample data







## Stylist

# create table
```
CREATE TABLE stylists (
    stylist_id int UNSIGNED auto_increment primary key,
    experience_level varchar(100)
) ENGINE = innodb;
```






## Services
# create table
```
CREATE TABLE services (
    service_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    service_type VARCHAR(255)
) ENGINE = innodb;
```



## Appointment services
# create table
```
CREATE TABLE appointment_services (
    treatment_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY
) ENGINE = innodb;
```

# reference foreign key
```
ALTER TABLE appointment_services ADD COLUMN service_id int UNSIGNED;
ALTER TABLE appointment_services ADD CONSTRAINT fk_appointment_service
    FOREIGN KEY (service_id) REFERENCES services (service_id);

ALTER TABLE appointment_services ADD COLUMN appointment_id int UNSIGNED;
ALTER TABLE appointment_services ADD CONSTRAINT fk_appointment_appointment
    FOREIGN KEY (appointment_id) REFERENCES appointments (appointment_id);
```





## Price 
# create table
```
CREATE TABLE price (
    price_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cost decimal UNSIGNED
) ENGINE = innodb;
```

# reference foreign key
```
ALTER TABLE price ADD COLUMN service_id int UNSIGNED;
ALTER TABLE price ADD CONSTRAINT fk_price_service
    FOREIGN KEY (service_id) REFERENCES services (service_id);
```



## Rewards 
# create table
```
CREATE TABLE rewards (
    reward_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    reward_type VARCHAR(255)
) ENGINE = innodb;
```




## Point Transactions 
# create table
```
CREATE TABLE point_transactions (
    point_transaction_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    points int UNSIGNED
) ENGINE = innodb;
```

# reference foreign key
```
ALTER TABLE point_transactions ADD COLUMN reward_id int UNSIGNED;
ALTER TABLE point_transactions ADD CONSTRAINT fk_point_transaction_reward
    FOREIGN KEY (reward_id) REFERENCES rewards (reward_id);
```

```
ALTER TABLE point_transactions ADD COLUMN appointment_id int UNSIGNED;
ALTER TABLE point_transactions ADD CONSTRAINT fk_point_transaction_appointment
    FOREIGN KEY (appointment_id) REFERENCES appointments (appointment_id);
```

```
ALTER TABLE point_transactions ADD COLUMN customer_id int UNSIGNED;
ALTER TABLE point_transactions ADD CONSTRAINT fk_point_transaction_customer
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id);
```