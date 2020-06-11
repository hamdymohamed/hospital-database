create database hospital14
use hospital14
create table doctors (id int primary key not null, name varchar(100)not null,specailty varchar(100)not null, phone int not null,salary int not null)
create table patient13 (id int primary key not null,name varchar(100)not null,illness varchar(100)not null,age int not null,medicine1 varchar(100)not null,medicine_id int not null,duration int not null)
create table medicines13(id int primary key not null,name varchar(100)not null,price int not null,quantity int not null)
create table rooms (id int primary key not null, department varchar(100)not null,bednum int not null,patient_name varchar(100)not null, patient_id int not null)
create table store1(patient_id int not null,patient_name varchar(100)not null,doctor_id int not null,doctor_name varchar(100)not null,
patient_duration int not null, medicines_price int not null,medicien_id int not null,room_id int not null,cost int not null)

insert into doctors values(13,'ahmed mostafa','cardiac diseases',01234567,8000)
insert into doctors values(14,' mostafa iprahem','Ophthalmology and surgery',01076654,5000)
insert into doctors values(43,'mohamed kamel','Chest and respiratory system',01530567,4000)
insert into doctors values(45,'hosam gaml','Urinary tract and surgery',012309867,8000)
insert into doctors values(68,'bassem diab',' the ear, nose and throat',01097567,3500)
insert into doctors values(21,'oasma seid','Neurology and surgery',01234654,7000)
insert into doctors values(60,'hassn ahmed','Dermatology',01209876,6000)
insert into doctors values(32,'abdulla mahmoud','Orthopedic surgery',015646567,5000)
insert into doctors values(85,'omar shaban','the ear, nose and throat',01287657,3000)
insert into doctors values(12,'ahmed mahmoud','cardiac diseases',01254321,9000)


insert into patient13 values(132,'karim osama',' leg broken ',17,' balad',43,5)
insert into patient13 values(345,'mohamed bakr',' problem with heart ',65,' cardoxin',45,10)
insert into patient13 values(876,'samy mostafa',' eye infection ',25,' relestat',34,1)
insert into patient13 values(908,'ahmed afef',' flu ',37,' panadol',94,1)
insert into patient13 values(524,'khaled abd el rahman',' arthritis ',71,' indomin',95,1)
insert into patient13 values(145,'mohamed ghareb',' nerves infection ',55,' tramadol',90,5)
insert into patient13 values(987,'samy naser',' skin allergy ',34,' choline',78,1)
insert into patient13 values(768,'omar zaher',' arm broken ',36,' fudion',37,2)
insert into patient13 values(432,'karem iprahem',' chest allergy ',12,' histamin',76,4)
insert into patient13 values(784,'ramy tarek',' Kidney stone',17,' diuril',25,5)


insert into medicines13 values(23,'udion',20,70)
insert into medicines13 values(43,'balad',50,34)
insert into medicines13 values(25,'diuril',60,56)
insert into medicines13 values(76,'histamin',330,43)
insert into medicines13 values(45,'cardoxin',120,53)
insert into medicines13 values(78,'choline',25,98)
insert into medicines13 values(34,'relestat',30,100)
insert into medicines13 values(37,'fudion',60,34)
insert into medicines13 values(90,'tramadol',90,34)
insert into medicines13 values(95,'indomin',190,39)
insert into medicines13 values(94,'panadol',20,89)


insert into rooms values (5,'bone',7,'karim osama',132)
insert into rooms values (2,'chest and heart',3,'karem iprahem',432)
insert into rooms values (3,'chest and heart',4,'mohamed bakr',345)
insert into rooms values (9,'Neurology and brian',2,'mohamed ghareb',145)
insert into rooms values (4,'bone',6,'omar zaher',768)
insert into rooms values (10,'Interior',7,'ramy tarek',674)
insert into rooms values (8,'Joints and bones',3,'khaled abd el rahman',524)



insert into store1 values(132,'karim osama',32,'abdulla mahmoud',5,20,43,5,550)
insert into store1 values(345,'mohamed bakr',13,'ahmed mostafa',10,120,45,3,1550)
insert into store1 values(432,'karem iprahem',43,'mohamed kamel',4,330,76,8,400)
insert into store1 values(524,'khaled abd el rahman',32,'abdulla mahmoud',1,190,95,8,300)
insert into store1 values(987,'samy naser',60,'hassn ahmed',1,25,78,0,50)
insert into store1 values(145,'mohamed ghareb',21,'oasma seid',5,90,90,9,550)
insert into store1 values(784,'ramy tarek',45,'hosam gaml',60,2,25,10,300)
insert into store1 values(768,'omar zaher',32,'abdulla mahmoud',2,60,34,4,250)


select *from doctors
select name ,specailty from doctors where salary >=7000
select *from doctors where name like'ahmed%'and salary=9000
select *from doctors where salary between 8000 and 10000
select name from doctors where id in (12,21,60,45)
select *from patient13
select illness from patient13 where age <30 
select name from patient13 where duration between 4 and 10
select * from patient13 where name like ('%ah%')
select medicine1 from patient13 where illness like('%a%')
select *from medicines13
select price from medicines13 where id not in (45,43)
select name from medicines13 where price <=100 and price >=50
select name,id from medicines13 where quantity<40
select *from rooms
select bednum,patient_name from rooms where patient_id>500
select patient_name from rooms where bednum = 2 or bednum=3
select *from store1
select patient_name ,patient_duration,cost from store1 where cost between 400 and 1000
select doctor_id,doctor_name from store1 where medicines_price>100 and cost >800

select cost,patient_name from store1 where doctor_id in (select id from doctors where salary>5000)
select name ,duration from patient13 where medicine_id in (select id from medicines13 where quantity<50)
select department,patient_name from rooms where patient_id in (select patient_id from store1 where cost between 500 and 2000)

select  avg(salary) as 'avg' ,id from doctors where salary>7000 group by id
select max(duration) as 'max duration' from patient13 where duration >4 group by medicine_id
select sum(cost) as 'the sum of cost' from store1 group by patient_duration

select *from store1 s right join rooms r on s.room_id=r.id
select *from patient13 p inner join medicines13 m on p.medicine_id=m.id
select *from doctors d left join store1 s on s.doctor_id=d.id
select *from medicines13 m join store1 s on s.medicien_id=m.id
select cost,salary from doctors d join store1 s on d.id=s.doctor_id


update doctors set phone=0123445677 where name='ahmed mahmoud'
update doctors set salary=9000 where id=13
update patient13 set duration=4 where illness='arm broken'
update patient13 set medicine1='panadol' where illness='leg broken'
update store1 set cost =1000 where patient_duration=10
update medicines13 set price=65 where id=23


delete from rooms where patient_id=432
delete from doctors where specailty='Ophthalmology and surgery'
delete from patient13 where duration=10
delete from medicines13 where price=50
delete from store1 where cost =50
delete from patient13 where id=145




 




 

