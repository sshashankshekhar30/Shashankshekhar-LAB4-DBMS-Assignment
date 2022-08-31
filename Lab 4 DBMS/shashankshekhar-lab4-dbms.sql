create database `order-directory`;
use `order-directory`;

create table if not Exists supplier(
SUPP_ID int primary key not null auto_increment ,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50),
SUPP_PHONE varchar(50)
);

/*******************************************************/
drop table if Exists customer;
create  table  customer(
cus_ID int primary key not null auto_increment,
CUS_NAME	VARCHAR(20) NOT NULL ,
CUS_PHONE varchar(10) not null,
CUS_CITY	VARCHAR(30) NOT NULL,
CUS_GENDER	CHAR
);
/*********************************************************/
drop table if exists category;
create table category(
CAT_ID int primary key not null auto_increment,
CAT_NAME varchar(20) not null
);
/************************************************************/
drop table if Exists product;
CREATE TABLE  product (
PRO_ID INT NOT NULL,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT NOT NULL,
PRIMARY KEY (PRO_ID),
FOREIGN KEY (CAT_ID) REFERENCES category (CAT_ID)
);

/***************************************************************/
drop table if Exists supplier_pricing;

create table supplier_pricing(
PRICING_ID	INT primary key not null auto_increment,
PRO_ID int not null ,
   SUPP_ID int not null ,
    SUPP_PRICE	INT default 0 ,
 foreign key(PRO_ID) references product(PRO_ID),
 foreign key(SUPP_ID) references supplier(SUPP_ID)
 );
 
 /******************************************************************/
 drop table if Exists `order`;
create table `order` (
ORD_ID int Primary key not null auto_increment,
ORD_AMOUNT int not null,
ORD_Date date Not null,
CUS_ID int,
PRICING_ID int ,
foreign key(CUS_ID) references	customer(CUS_ID),
foreign key(PRICING_ID) references supplier_pricing(PRICING_ID)
);

/************************************************************************/
drop table if Exists Rating ;

create table Rating(
RAT_ID int Primary key not null auto_increment,
ORD_ID int,
 RAT_RATSTARS	INT 
NOT NULL,
foreign key(ORD_ID ) references `order`(ORD_ID)
);

/**************************************************************************************
/*2)	Insert the following data in the table created above*/

INSERT INTO  supplier VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO supplier VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO supplier VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO supplier VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO supplier VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

/*************************************************************************************/
INSERT INTO customer VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO customer VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO customer VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO customer VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO customer VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

/****************************************************************************************/
INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

/****************************************************************************************/
INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

/**************************************************************************************/
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);

/***************************************************************************************/
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

/******************************************************************************************/
INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);

/***********************************************************************/
INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);

/****************************************************************/
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);
use `order-directory`;

/**********************************************************************************/

/* Ans Sheet:-*/
/*3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.*/

select count(Cus_Name) as Total_number_of_customar,Cus_Gender as Total_gender  from  Customer  C inner join `ORDER`O on O.Cus_id=C.Cus_id where O.ORD_AMOUNT>=3000 group by C.Cus_Gender;

/************************************************************************************/
/*4)Display all the orders along with product name ordered by a customer having Customer_Id=2*?*/
/*table choicing*/
select * from `order`;
select* from Supplier_Pricing ;
select * from  Product;

select * from `order` O inner join 
Supplier_Pricing sp
on sp.Pricing_Id= O.Pricing_id;

/*_______________________________________________*/
select O.ORD_id,O.ORD_Amount,P.pro_Name from
 `order` O inner join 
Supplier_Pricing sp
on sp.Pricing_Id= O.Pricing_id
inner join Product p on
p.Pro_id=sp.pro_id;
/*______________________________________*/
select O.ORD_id,O.ORD_Amount,P.pro_Name from
 `order` O inner join 
Supplier_Pricing sp
on sp.Pricing_Id= O.Pricing_id
inner join Product p on
p.Pro_id=sp.pro_id
where O.CUS_id=2;
/******************************************************************************************/

/*5)	Display the Supplier details who can supply more than one product.*/

select * from supplier_Pricing;
select * from Supplier;
select * from Product;

select * from supplier_Pricing  having count(Supp_id)>1;
/*____________________________________________________*/
select * from supplier_Pricing group by Supp_id having count(Supp_id)>1;
/*________________________________________________________*/

select Supplier.Supp_id,Supp_Name,Supp_City,Supp_Phone from Supplier inner join 
(
select * from supplier_Pricing  group by Supp_id having count(Supp_id)>1
) as sp
on Supplier.SUPP_id=Sp.SUPP_id;

/*******************************************************************************/

/*6)	Find the least expensive product from each category and print the table with category id, name, product name and price of the product*/
/* choose and Create all the tables */
select * from Category;
select * from product;
select * from Supplier_pricing ;

/*___________________________________________________________*/

select * from Category  C 
inner join product P
on C.CAT_ID=P.CAT_ID;

/*__________________________________*/
select C.Cat_Id,C.CAT_Name,P.Pro_name from 
 Category  C 
inner join product P
on C.CAT_ID=P.CAT_ID
inner join supplier_pricing Sp
on Sp.Pro_id=P.Pro_id;
/*_______________________________________-*/
select C.Cat_Id,C.CAT_Name,P.Pro_name from 
 Category  C 
inner join product P
on C.CAT_ID=P.CAT_ID
inner join supplier_pricing Sp
on Sp.Pro_id=P.Pro_id ;
/*__________________________________*/
select C.Cat_Id,C.CAT_Name,P.Pro_name from 
 Category  C 
inner join product P
on C.CAT_ID=P.CAT_ID
inner join supplier_pricing Sp
on Sp.Pro_id=P.Pro_id 
inner join `order`O
on O.pricing_id=Sp.Pricing_id;

/*____________________________________________*/
select C.Cat_Id,C.CAT_Name,P.Pro_name from 
 Category  C 
inner join product P
on C.CAT_ID=P.CAT_ID
inner join supplier_pricing Sp 
on Sp.Pro_id=P.Pro_id 
inner join `order`O
on O.pricing_id=Sp.Pricing_id 
group by C.Cat_id;

/*_______________________________________-*/
/*Hear displays The Number of Least Itemes from The catagory where We are Showing Only the 5 least Items  items  */
select C.Cat_Id,C.CAT_Name,P.Pro_name from 
 Category  C 
inner join product P
on C.CAT_ID=P.CAT_ID
inner join supplier_pricing Sp 
on Sp.Pro_id=P.Pro_id 
inner join `order`O
on O.pricing_id=Sp.Pricing_id 
group by P.Pro_Name order by O.ORD_AMOUNT limit 5;   

/******************************************************************************/
/*7)	Display the Id and Name of the Product ordered after “2021-10-05”.*/
/* table That needs to be selected Hear */
select * from `order`;
select * from Supplier_pricing;
select * from product;

select * from `order` O inner join 
supplier_pricing sp on
sp.pricing_id=O.pricing_id ;
/*____________________________________*/

select P.pro_id,P.Pro_Name from 
`order` O inner join 
supplier_pricing sp on
sp.PRICING_ID=O.PRICING_ID
inner join Product P on P.Pro_Id=sp.Pro_Id;
/*_____________________________________________________*/
select P.pro_id,P.Pro_Name from 
`order` O inner join 
supplier_pricing sp on
sp.PRICING_ID=O.PRICING_ID
inner join Product P on P.Pro_Id=sp.Pro_Id
where O.ORD_Date>'2021-10-05';

/*******************************************************************************************/

/*8)	Display customer name and gender whose names start or end with character 'A'.*/
select C.Cus_Name,C.Cus_Gender from customer C where C.Cus_Name like "A%" or  C.Cus_Name like  "%A";

/*************************************************************************************************/
/*9)	Create a stored procedure to display supplier id, name, rating 
and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 
print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”./*
/* hear we will br creting the Prossedure */
USE `order-directory`;
DROP procedure IF EXISTS `my2nd_Store`;

DELIMITER $$
USE `order-directory`$$
CREATE PROCEDURE `my2nd_Store` ()
BEGIN
select S.SUPP_id,S.SUPP_Name,R.RAT_RATSTARS, 
case 
when R. RAT_RATSTARS=5 then " Exilent Service"
when R. RAT_RATSTARS>4 then "Good Service "
when R. RAT_RATSTARS >2 then "Avarage sevice"
else "Poor  service "
END  AS TYPE_OF_SERVICE FROM
Supplier S 
inner join Supplier_Pricing sp
on sp.Supp_id=S.Supp_id
inner join `order`O
on O.Pricing_id=sp.Pricing_id
inner join rating R
on R.ORD_id=O.ORD_id ;
END$$
DELIMITER ;
call `my2nd_Store`();

 /**************************************************/