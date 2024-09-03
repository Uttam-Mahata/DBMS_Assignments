use package_management;

create table TBL_CUSTOMER(
    customer_id int auto_increment primary key,
    customer_no int check ( customer_no > 100 and customer_no < 1000 )  ,
    customer_name varchar(100) not null,
    annual_revenue int not null,
    customer_type enum('Manufacturer', 'Wholesaler', 'Retailer') not null

);
create table TBL_SHIPMENT(
    shipment_no int auto_increment primary key,

    customer_no int references TBL_CUSTOMER(customer_no) on delete cascade,

    weight decimal(5,3) check(weight < 1000) not null,

    truck_no varchar(10) references TBL_TRUCK(truck_no) on delete set null,

    destination int references TBL_CITY(city_name),

    shipping_date date not null




);

create table TBL_TRUCK(
    truck_id int auto_increment primary key,
    truck_no varchar(10) not null,
    driver_name varchar(100) not null
);

create table TBL_CITY(
    city_id int auto_increment primary key,
    city_name varchar(100) not null,
    population bigint not null
);

