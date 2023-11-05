CREATE TABLE vehicle(
	vehicle_id SERIAL PRIMARY KEY,
	vehicle_year INTEGER,
	make VARCHAR,
	model VARCHAR,
	vin VARCHAR(17)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	full_name VARCHAR,
	email_address VARCHAR,
	home_address VARCHAR,
	phone_num VARCHAR(12)
);

CREATE TABLE staff(
	staff_id SERIAL PRIMARY KEY,
	full_name VARCHAR,
	department VARCHAR,
	phone_num VARCHAR(12),
	home_address VARCHAR,
	email_address VARCHAR
);

CREATE TABLE service_provided(
	service_id SERIAL PRIMARY KEY,
	service_type VARCHAR,
	price VARCHAR,
	labor_time VARCHAR
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	vehicle_id INTEGER,
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
	customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	staff_id INTEGER,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
	purchase_date DATE,
	listed_price VARCHAR,
    selilng_price VARCHAR,
    new_used VARCHAR
);

CREATE TABLE service_ticket(
	ticket_id SERIAL PRIMARY KEY,
	vehicle_id INTEGER,
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
	customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	staff_id INTEGER,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
	service_date DATE,
	service_id INTEGER,
    FOREIGN KEY (service_id) REFERENCES service_provided(service_id),
    total_price VARCHAR
);


INSERT INTO vehicle(
    vehicle_year,
    make,
    model,
    vin
) VALUES (
    '2018',
    'kia',
    'sorento',
    'KMHCM36C29U136944'
),(
    '2023',
    'dodge',
    'charger',
    'YV1SZ58D511038316'
),(
    '2003',
    'lexus',
    'es300',
    '2G4WD552671175823'
);

INSERT INTO customer(
    full_name,
    email_address,
    home_address,
    phone_num
) VALUES (
    'Joan Chesterfield',
    'j.k.chesterfield@fakeemail.com',
    '235 w. hampton ct, mesa, az 85201',
    '623-497-6792'
),(
    'Jeremy Huang',
    'huang.jeremy@fakeemail.com',
    '6947 n. evergreen pl, chandler, az 85226',
    '480-294-3210'
),(
    'Bryan Axford',
    'i.m.bryan@fakeemail.com',
    '12252 w. mockingbird way, gilbert, az 85236',
    '602-641-1510'
);

INSERT INTO staff(
    full_name,
    department,
    phone_num,
    home_address,
    email_address
) VALUES (
    'Edgar Juarez',
    'sales',
    '623-642-6644',
    '123 n. main st, mesa, az 85202',
    'edgar.juarez@fakeworkemail.com'
),(
    'Sarah Overstreet',
    'sales',
    '480-259-7487',
    '321 w. chandler blvd, phoenix, az 85048',
    'sarah.overstreet@fakeworkemail.com'
),(
    'Jermome Smith',
    'service',
    '602-247-8763',
    '444 s. mirage cir, gilbert, az 85237',
    'jerome.smith@fakeworkemail.com'
),(
    'Tiffany De Los Santos',
    'service',
    '702-687-3741',
    '2442 w. court st., mesa, az 85204 ',
    'tiffany.delossantos@fakeworkemail.com'
);

INSERT INTO service_provided(
    service_type,
    price,
    labor_time
) VALUES (
    'lof',
    '34.99',
    '1.0'
),(
    'tire roation',
    '14.99',
    '0.5'
),(
    'engine flush w/lof',
    '64.99',
    '1.5'
);

INSERT INTO invoice(
    purchase_date,
    listed_price,
    selilng_price,
    new_used
) VALUES (
    '03/29/2021',
    '17,692',
    '20,974',
    'used'
),(
    '06/14/2023',
    '35,825',
    '37,999',
    'new'
);

INSERT INTO service_ticket(
    service_date,
    total_price
) VALUES (
    '09/16/2023',
    '49.98'
),(
    '10/14/2023',
    '64.99'
);

SELECT *
FROM vehicle;