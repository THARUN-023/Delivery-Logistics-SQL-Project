CREATE TABLE drivers (
    driver_id       VARCHAR2(10),
    driver_name     VARCHAR2(100),
    gender          VARCHAR2(10),
    age             NUMBER,
    city            VARCHAR2(50),
    joining_date    DATE,
    rating          NUMBER(3,1)
);

INSERT INTO drivers VALUES ('D001', 'Arun Kumar', 'Male', 28, 'Bangalore', DATE '2022-01-15', 4.5);
INSERT INTO drivers VALUES ('D002', 'Rahul Sharma', 'Male', 32, 'Mumbai', DATE '2021-03-20', 4.2);
INSERT INTO drivers VALUES ('D003', 'Priya Singh', 'Female', 26, 'Delhi', DATE '2023-06-10', 4.8);
INSERT INTO drivers VALUES ('D004', 'Vikram Rao', 'Male', 35, 'Hyderabad', DATE '2020-11-05', 3.9);
INSERT INTO drivers VALUES ('D005', 'Sneha Patel', 'Female', 29, 'Pune', DATE '2022-08-18', 4.6);
INSERT INTO drivers VALUES ('D006', 'Kiran Das', 'Male', 31, 'Chennai', DATE '2021-12-12', 4.1);
INSERT INTO drivers VALUES ('D007', 'Meena Reddy', 'Female', 27, 'Bangalore', DATE '2023-02-14', 4.7);
INSERT INTO drivers VALUES ('D008', 'Suresh Babu', 'Male', 40, 'Mumbai', DATE '2019-07-22', 3.8);
INSERT INTO drivers VALUES ('D009', 'Anjali Verma', 'Female', 25, 'Delhi', DATE '2024-01-08', 4.9);
INSERT INTO drivers VALUES ('D010', 'Manoj Kumar', 'Male', 33, 'Hyderabad', DATE '2022-04-25', 4.0);
INSERT INTO drivers VALUES ('D011', 'Deepak Singh', 'Male', 30, 'Pune', DATE '2021-09-17', 4.3);
INSERT INTO drivers VALUES ('D012', 'Pooja Nair', 'Female', 28, 'Chennai', DATE '2023-03-30', 4.6);
INSERT INTO drivers VALUES ('D013', 'Ramesh Yadav', 'Male', 37, 'Bangalore', DATE '2020-05-19', 3.7);
INSERT INTO drivers VALUES ('D014', 'Divya Sharma', 'Female', 24, 'Mumbai', DATE '2024-02-11', 4.8);
INSERT INTO drivers VALUES ('D015', 'Amit Joshi', 'Male', 29, 'Delhi', DATE '2022-10-06', 4.1);
INSERT INTO drivers VALUES ('D016', 'Neha Kapoor', 'Female', 27, 'Hyderabad', DATE '2023-07-15', 4.5);
INSERT INTO drivers VALUES ('D017', 'Rohit Das', 'Male', 34, 'Pune', DATE '2020-08-21', 3.6);
INSERT INTO drivers VALUES ('D018', 'Lakshmi Rao', 'Female', 31, 'Chennai', DATE '2021-01-12', 4.4);
INSERT INTO drivers VALUES ('D019', 'Sanjay Kumar', 'Male', 38, 'Bangalore', DATE '2019-04-16', 3.9);
INSERT INTO drivers VALUES ('D020', 'Nisha Patel', 'Female', 26, 'Mumbai', DATE '2024-03-05', 4.7);

-- Duplicate record intentionally added
INSERT INTO drivers VALUES ('D005', 'Sneha Patel', 'Female', 29, 'Pune', DATE '2022-08-18', 4.6);

-- NULL / invalid data intentionally added
INSERT INTO drivers VALUES ('D021', 'Varun Mehta', NULL, 22, 'Bangalore', DATE '2024-05-10', 5.5);
INSERT INTO drivers VALUES ('D022', 'Kavya Rao', 'Female', NULL, 'Hyderabad', DATE '2023-09-12', 4.2);
INSERT INTO drivers VALUES ('D023', 'Ajay Kumar', 'Male', -5, 'Chennai', DATE '2022-12-01', 3.5);




CREATE TABLE vehicles (
    vehicle_id      VARCHAR2(10),
    driver_id       VARCHAR2(10),
    vehicle_type    VARCHAR2(30),
    vehicle_model   VARCHAR2(50),
    fuel_type       VARCHAR2(20),
    capacity        NUMBER
);




INSERT INTO vehicles VALUES ('V001', 'D001', 'Bike', 'Honda Activa', 'Petrol', 20);
INSERT INTO vehicles VALUES ('V002', 'D002', 'Car', 'Maruti Swift', 'Petrol', 100);
INSERT INTO vehicles VALUES ('V003', 'D003', 'Bike', 'TVS Jupiter', 'Petrol', 25);
INSERT INTO vehicles VALUES ('V004', 'D004', 'Van', 'Tata Ace', 'Diesel', 500);
INSERT INTO vehicles VALUES ('V005', 'D005', 'Bike', 'Honda Activa', 'Petrol', 20);
INSERT INTO vehicles VALUES ('V006', 'D006', 'Car', 'Hyundai i20', 'Diesel', 120);
INSERT INTO vehicles VALUES ('V007', 'D007', 'Bike', 'TVS Ntorq', 'Petrol', 25);
INSERT INTO vehicles VALUES ('V008', 'D008', 'Van', 'Mahindra Bolero', 'Diesel', 600);
INSERT INTO vehicles VALUES ('V009', 'D009', 'Bike', 'Honda Shine', 'Petrol', 20);
INSERT INTO vehicles VALUES ('V010', 'D010', 'Car', 'Maruti Baleno', 'Petrol', 110);
INSERT INTO vehicles VALUES ('V011', 'D011', 'Bike', 'Bajaj Pulsar', 'Petrol', 30);
INSERT INTO vehicles VALUES ('V012', 'D012', 'Car', 'Hyundai i20', 'Electric', 120);
INSERT INTO vehicles VALUES ('V013', 'D013', 'Van', 'Tata Ace', 'Diesel', 500);
INSERT INTO vehicles VALUES ('V014', 'D014', 'Bike', 'Honda Activa', 'Petrol', 20);
INSERT INTO vehicles VALUES ('V015', 'D015', 'Car', 'Maruti Swift', 'Petrol', 100);
INSERT INTO vehicles VALUES ('V016', 'D016', 'Bike', 'TVS Jupiter', 'Petrol', 25);
INSERT INTO vehicles VALUES ('V017', 'D017', 'Van', 'Tata Ace', 'Diesel', 500);
INSERT INTO vehicles VALUES ('V018', 'D018', 'Car', 'Tata Nexon', 'Electric', 130);
INSERT INTO vehicles VALUES ('V019', 'D019', 'Bike', 'Bajaj Pulsar', 'Petrol', 30);
INSERT INTO vehicles VALUES ('V020', 'D020', 'Car', 'Hyundai Creta', 'Diesel', 150);

-- Duplicate
INSERT INTO vehicles VALUES ('V005', 'D005', 'Bike', 'Honda Activa', 'Petrol', 20);

-- Invalid / NULL data
INSERT INTO vehicles VALUES ('V021', 'D021', 'Bike', 'Honda Shine', 'Petrol', -10);
INSERT INTO vehicles VALUES ('V022', NULL, 'Car', 'Tata Nexon', 'Electric', 120);





CREATE TABLE deliveries (
    delivery_id            VARCHAR2(10),
    driver_id              VARCHAR2(10),
    vehicle_id             VARCHAR2(10),
    customer_id            VARCHAR2(10),
    pickup_city             VARCHAR2(50),
    delivery_city           VARCHAR2(50),
    delivery_date           DATE,
    distance_km             NUMBER(6,2),
    delivery_time_minutes   NUMBER,
    delivery_status         VARCHAR2(30)
);






INSERT INTO deliveries VALUES ('DL001','D001','V001','C001','Bangalore','Bangalore',DATE '2025-01-05',8.5,35,'Completed');
INSERT INTO deliveries VALUES ('DL002','D002','V002','C002','Mumbai','Mumbai',DATE '2025-01-06',12.2,48,'Completed');
INSERT INTO deliveries VALUES ('DL003','D003','V003','C003','Delhi','Delhi',DATE '2025-01-07',6.8,30,'Completed');
INSERT INTO deliveries VALUES ('DL004','D004','V004','C004','Hyderabad','Hyderabad',DATE '2025-01-08',18.5,65,'Completed');
INSERT INTO deliveries VALUES ('DL005','D005','V005','C005','Pune','Pune',DATE '2025-01-09',9.4,40,'Completed');
INSERT INTO deliveries VALUES ('DL006','D006','V006','C006','Chennai','Chennai',DATE '2025-01-10',15.2,55,'Completed');
INSERT INTO deliveries VALUES ('DL007','D007','V007','C007','Bangalore','Bangalore',DATE '2025-01-11',7.5,32,'Completed');
INSERT INTO deliveries VALUES ('DL008','D008','V008','C008','Mumbai','Mumbai',DATE '2025-01-12',22.5,75,'Cancelled');
INSERT INTO deliveries VALUES ('DL009','D009','V009','C009','Delhi','Delhi',DATE '2025-01-13',5.2,25,'Completed');
INSERT INTO deliveries VALUES ('DL010','D010','V010','C010','Hyderabad','Hyderabad',DATE '2025-01-14',14.7,52,'Completed');

INSERT INTO deliveries VALUES ('DL011','D011','V011','C011','Pune','Pune',DATE '2025-01-15',10.3,42,'Completed');
INSERT INTO deliveries VALUES ('DL012','D012','V012','C012','Chennai','Chennai',DATE '2025-01-16',16.8,60,'Completed');
INSERT INTO deliveries VALUES ('DL013','D013','V013','C013','Bangalore','Bangalore',DATE '2025-01-17',25.5,80,'Delayed');
INSERT INTO deliveries VALUES ('DL014','D014','V014','C014','Mumbai','Mumbai',DATE '2025-01-18',8.1,36,'Completed');
INSERT INTO deliveries VALUES ('DL015','D015','V015','C015','Delhi','Delhi',DATE '2025-01-19',13.4,50,'Completed');
INSERT INTO deliveries VALUES ('DL016','D016','V016','C016','Hyderabad','Hyderabad',DATE '2025-01-20',7.8,34,'Completed');
INSERT INTO deliveries VALUES ('DL017','D017','V017','C017','Pune','Pune',DATE '2025-01-21',20.5,70,'Cancelled');
INSERT INTO deliveries VALUES ('DL018','D018','V018','C018','Chennai','Chennai',DATE '2025-01-22',11.6,45,'Completed');
INSERT INTO deliveries VALUES ('DL019','D019','V019','C019','Bangalore','Bangalore',DATE '2025-01-23',9.8,39,'Completed');
INSERT INTO deliveries VALUES ('DL020','D020','V020','C020','Mumbai','Mumbai',DATE '2025-01-24',17.2,58,'Completed');

INSERT INTO deliveries VALUES ('DL021','D001','V001','C021','Bangalore','Bangalore',DATE '2025-02-01',6.4,28,'Completed');
INSERT INTO deliveries VALUES ('DL022','D002','V002','C022','Mumbai','Mumbai',DATE '2025-02-02',14.5,52,'Completed');
INSERT INTO deliveries VALUES ('DL023','D003','V003','C023','Delhi','Delhi',DATE '2025-02-03',8.9,38,'Completed');
INSERT INTO deliveries VALUES ('DL024','D004','V004','C024','Hyderabad','Hyderabad',DATE '2025-02-04',21.2,72,'Delayed');
INSERT INTO deliveries VALUES ('DL025','D005','V005','C025','Pune','Pune',DATE '2025-02-05',10.8,44,'Completed');
INSERT INTO deliveries VALUES ('DL026','D006','V006','C026','Chennai','Chennai',DATE '2025-02-06',13.7,50,'Completed');
INSERT INTO deliveries VALUES ('DL027','D007','V007','C027','Bangalore','Bangalore',DATE '2025-02-07',5.5,25,'Completed');
INSERT INTO deliveries VALUES ('DL028','D008','V008','C028','Mumbai','Mumbai',DATE '2025-02-08',19.4,68,'Completed');
INSERT INTO deliveries VALUES ('DL029','D009','V009','C029','Delhi','Delhi',DATE '2025-02-09',7.2,31,'Completed');
INSERT INTO deliveries VALUES ('DL030','D010','V010','C030','Hyderabad','Hyderabad',DATE '2025-02-10',12.5,47,'Completed');

-- Duplicate delivery
INSERT INTO deliveries VALUES ('DL010','D010','V010','C010','Hyderabad','Hyderabad',DATE '2025-01-14',14.7,52,'Completed');

-- NULL / invalid data
INSERT INTO deliveries VALUES ('DL031',NULL,'V011','C031','Pune','Pune',DATE '2025-02-11',11.2,45,'Completed');
INSERT INTO deliveries VALUES ('DL032','D012','V012','C032','Chennai','Chennai',DATE '2025-02-12',-5.5,40,'Completed');
INSERT INTO deliveries VALUES ('DL033','D013','V013','C033','Bangalore','Bangalore',DATE '2025-02-13',15.2,NULL,'Completed');
INSERT INTO deliveries VALUES ('DL034','D014','V014','C034','Mumbai','Mumbai',DATE '2025-02-14',9.5,40,'Unknown');





CREATE TABLE delivery_payments (
    payment_id          VARCHAR2(10),
    delivery_id         VARCHAR2(10),
    delivery_charge     NUMBER(10,2),
    driver_payment      NUMBER(10,2),
    company_commission  NUMBER(10,2),
    payment_method      VARCHAR2(30)
);






INSERT INTO delivery_payments VALUES ('P001','DL001',250,180,70,'UPI');
INSERT INTO delivery_payments VALUES ('P002','DL002',350,250,100,'Card');
INSERT INTO delivery_payments VALUES ('P003','DL003',200,140,60,'Cash');
INSERT INTO delivery_payments VALUES ('P004','DL004',500,350,150,'UPI');
INSERT INTO delivery_payments VALUES ('P005','DL005',280,200,80,'Card');
INSERT INTO delivery_payments VALUES ('P006','DL006',420,300,120,'UPI');
INSERT INTO delivery_payments VALUES ('P007','DL007',220,155,65,'Cash');
INSERT INTO delivery_payments VALUES ('P008','DL008',550,380,170,'Card');
INSERT INTO delivery_payments VALUES ('P009','DL009',180,125,55,'UPI');
INSERT INTO delivery_payments VALUES ('P010','DL010',400,280,120,'UPI');

INSERT INTO delivery_payments VALUES ('P011','DL011',300,210,90,'Cash');
INSERT INTO delivery_payments VALUES ('P012','DL012',450,315,135,'Card');
INSERT INTO delivery_payments VALUES ('P013','DL013',600,420,180,'UPI');
INSERT INTO delivery_payments VALUES ('P014','DL014',240,170,70,'Cash');
INSERT INTO delivery_payments VALUES ('P015','DL015',380,265,115,'Card');
INSERT INTO delivery_payments VALUES ('P016','DL016',230,160,70,'UPI');
INSERT INTO delivery_payments VALUES ('P017','DL017',500,350,150,'Cash');
INSERT INTO delivery_payments VALUES ('P018','DL018',330,230,100,'Card');
INSERT INTO delivery_payments VALUES ('P019','DL019',270,190,80,'UPI');
INSERT INTO delivery_payments VALUES ('P020','DL020',480,335,145,'Card');

INSERT INTO delivery_payments VALUES ('P021','DL021',210,145,65,'UPI');
INSERT INTO delivery_payments VALUES ('P022','DL022',390,275,115,'Card');
INSERT INTO delivery_payments VALUES ('P023','DL023',260,180,80,'Cash');
INSERT INTO delivery_payments VALUES ('P024','DL024',520,360,160,'UPI');
INSERT INTO delivery_payments VALUES ('P025','DL025',290,200,90,'Card');
INSERT INTO delivery_payments VALUES ('P026','DL026',410,285,125,'UPI');
INSERT INTO delivery_payments VALUES ('P027','DL027',190,130,60,'Cash');
INSERT INTO delivery_payments VALUES ('P028','DL028',540,375,165,'Card');
INSERT INTO delivery_payments VALUES ('P029','DL029',210,145,65,'UPI');
INSERT INTO delivery_payments VALUES ('P030','DL030',370,260,110,'Cash');

-- Duplicate payment
INSERT INTO delivery_payments VALUES ('P010','DL010',400,280,120,'UPI');

-- Invalid / NULL values
INSERT INTO delivery_payments VALUES ('P031','DL031',NULL,150,50,'UPI');
INSERT INTO delivery_payments VALUES ('P032','DL032',-200,140,60,'Cash');
INSERT INTO delivery_payments VALUES ('P033','DL033',350,400,-50,'Card');
INSERT INTO delivery_payments VALUES ('P034','DL034',300,210,90,'Bitcoin');




CREATE TABLE delivery_reviews (
    review_id       VARCHAR2(10),
    delivery_id     VARCHAR2(10),
    customer_id     VARCHAR2(10),
    rating          NUMBER(2,1),
    review_date     DATE,
    feedback        VARCHAR2(200)
);



INSERT INTO delivery_reviews VALUES ('R001','DL001','C001',5,DATE '2025-01-05','Fast delivery');
INSERT INTO delivery_reviews VALUES ('R002','DL002','C002',4,DATE '2025-01-06','Good service');
INSERT INTO delivery_reviews VALUES ('R003','DL003','C003',5,DATE '2025-01-07','Very good');
INSERT INTO delivery_reviews VALUES ('R004','DL004','C004',3,DATE '2025-01-08','Delivery was slow');
INSERT INTO delivery_reviews VALUES ('R005','DL005','C005',4,DATE '2025-01-09','Good experience');
INSERT INTO delivery_reviews VALUES ('R006','DL006','C006',5,DATE '2025-01-10','Excellent');
INSERT INTO delivery_reviews VALUES ('R007','DL007','C007',4,DATE '2025-01-11','Good');
INSERT INTO delivery_reviews VALUES ('R008','DL008','C008',2,DATE '2025-01-12','Order cancelled');
INSERT INTO delivery_reviews VALUES ('R009','DL009','C009',5,DATE '2025-01-13','Very fast');
INSERT INTO delivery_reviews VALUES ('R010','DL010','C010',4,DATE '2025-01-14','Good service');

INSERT INTO delivery_reviews VALUES ('R011','DL011','C011',3,DATE '2025-01-15','Average');
INSERT INTO delivery_reviews VALUES ('R012','DL012','C012',5,DATE '2025-01-16','Excellent service');
INSERT INTO delivery_reviews VALUES ('R013','DL013','C013',2,DATE '2025-01-17','Very late');
INSERT INTO delivery_reviews VALUES ('R014','DL014','C014',4,DATE '2025-01-18','Good delivery');
INSERT INTO delivery_reviews VALUES ('R015','DL015','C015',5,DATE '2025-01-19','Excellent');
INSERT INTO delivery_reviews VALUES ('R016','DL016','C016',4,DATE '2025-01-20','Good');
INSERT INTO delivery_reviews VALUES ('R017','DL017','C017',1,DATE '2025-01-21','Cancelled');
INSERT INTO delivery_reviews VALUES ('R018','DL018','C018',5,DATE '2025-01-22','Perfect');
INSERT INTO delivery_reviews VALUES ('R019','DL019','C019',4,DATE '2025-01-23','Good service');
INSERT INTO delivery_reviews VALUES ('R020','DL020','C020',5,DATE '2025-01-24','Excellent');

INSERT INTO delivery_reviews VALUES ('R021','DL021','C021',4,DATE '2025-02-01','Good');
INSERT INTO delivery_reviews VALUES ('R022','DL022','C022',5,DATE '2025-02-02','Excellent');
INSERT INTO delivery_reviews VALUES ('R023','DL023','C023',4,DATE '2025-02-03','Good service');
INSERT INTO delivery_reviews VALUES ('R024','DL024','C024',2,DATE '2025-02-04','Delayed');
INSERT INTO delivery_reviews VALUES ('R025','DL025','C025',5,DATE '2025-02-05','Very good');
INSERT INTO delivery_reviews VALUES ('R026','DL026','C026',4,DATE '2025-02-06','Good');
INSERT INTO delivery_reviews VALUES ('R027','DL027','C027',5,DATE '2025-02-07','Fast');
INSERT INTO delivery_reviews VALUES ('R028','DL028','C028',4,DATE '2025-02-08','Good service');
INSERT INTO delivery_reviews VALUES ('R029','DL029','C029',5,DATE '2025-02-09','Excellent');
INSERT INTO delivery_reviews VALUES ('R030','DL030','C030',3,DATE '2025-02-10','Average');

-- Duplicate review
INSERT INTO delivery_reviews VALUES ('R010','DL010','C010',4,DATE '2025-01-14','Good service');

-- Invalid / NULL values
INSERT INTO delivery_reviews VALUES ('R031','DL031','C031',6,DATE '2025-02-11','Excellent');
INSERT INTO delivery_reviews VALUES ('R032','DL032','C032',NULL,DATE '2025-02-12','No rating');
INSERT INTO delivery_reviews VALUES ('R033','DL033','C033',-2,DATE '2025-02-13','Bad');
INSERT INTO delivery_reviews VALUES ('R034','DL034','C034',3,DATE '2025-02-14',NULL);


COMMIT;



