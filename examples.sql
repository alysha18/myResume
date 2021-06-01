#creating database
create database Qabdt;
use Qabdt;
create table Employeeinfo (name varchar(20), id int, location varchar(20), age int);
describe Employeeinfo;
insert into Employeeinfo values('sam',1,'newjersey',21);
insert into Employeeinfo values('ram',2,'newyork',22);
insert into Employeeinfo values('tam',3,'florida',23);
insert into Employeeinfo values('nam',4,'charlotte',24);
insert into Employeeinfo values('lam',5,'texas',25,'female');
select * from Employeeinfo;
delete from Employeeinfo where name='lam';
update Employeeinfo set gender='female' where name='sam';
update Employeeinfo set gender='male' where name='ram';
update Employeeinfo set gender='male' where name='tam';
update Employeeinfo set gender='male' where name='nam';
update Employeeinfo set gender='male' where name='lam';
alter table Employeeinfo add gender varchar(10);
alter table Employeeinfo modify gender varchar (20);
alter table Employeeinfo drop gender;
create database sample;
use sample;
drop database sample;
insert into Employeeinfo values('lam',6,'washington',26,'male');
select * from Employeeinfo;
select distinct name from Employeeinfo;
select name from Employeeinfo where location = 'newyork' and age>13;
select * from Employeeinfo where(location = 'florida' and age>21) or location = 'charlotte';
select * from Employeeinfo where age in (22,23,24,25);
select * from Employeeinfo where location in ('newyork','florida')
select * from Employeeinfo where age between 21 and 24;
select * from Employeeinfo where age not between 21 and 24;
select * from Employeeinfo where name like '_a%';
select name from Employeeinfo where name like 's%';
select name from Employeeinfo where name like '__m';
select * from Employeeinfo order by name;
select * from Employeeinfo order by id;
select * from Employeeinfo order by id desc;



#aggregate function 
Create database Business;
use Business;
Create table Transactions (Month varchar(50), Day int (50), Amount int(50), branch varchar(50));
describe Transactions;
insert into Transactions values ('April', 5, 67, 'chicago');
insert into Transactions values ('April', 10, 2000, 'newyork');
insert into Transactions values ('April', 15, 4000, 'florida');
insert into Transactions values ('May', 13, 1327, 'moscow');
insert into Transactions values ('June', 18, 132, 'rome');
insert into Transactions values ('June', 28, 5000, 'milano');
insert into Transactions values ('July', 23, 76, 'barcelona');
insert into Transactions values ('Augest', 3, 986, 'paris');
select * from Transactions;
select * from Transactions group by Month;
show variables like 'sql_mode';
SET sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
select sum(Amount), Month from Transactions group by Month;
select sum(Amount), Month from Transactions;
select Max(Amount), Month from Transactions group by Month;
select Max(Amount), Month from Transactions;
select Min(Amount), Month from Transactions group by Month;
select Min(Amount), Month from Transactions;
select Avg(Amount), Month from Transactions group by Month;
select count(*), Month from Transactions; 
select count(*), Month from Transactions group by Month having count(*)<2;
select count(*), Month, branch from Transactions where branch in('moscow','barcelona') group by Month having count(*)<2;
select sum(Amount), Month, branch, Day from Transactions where branch in ('moscow', 'rome', 'milano') group by Month having sum(Amount)>1500;
select sum(Amount), Month, branch from Transactions where branch in ('paris', 'barcelona') group by Month having sum(Amount)<1000;
select sum(Amount), branch, Day from Transactions where Month='april' group by branch having sum(Amount)>200;


#case when then
use Qabdt;
create table college (id int(50), name varchar(50));
insert into college values (53, 'alla');
insert into college values (43, 'rom');
insert into college values (36, 'stiv');
insert into college values (88, 'bred');
insert into college values (17, 'pen');
select * from college;
create table results (id int(50), name varchar(50));
insert into results values (53, 'alla');
insert into results values (22, 'anna');
insert into results values (36, 'stiv');
insert into results values (67, 'geo');
insert into results values (13, 'ira');
insert into results values (9, 'tom');
select * from results;
select * from college union all (select * from results);
select * from college where id in  (select id from results);
select * from college where exists (select*from results where name = 'alla');
select id , case name
when 'alla' then id-20
when 'stiv' then id*2
when 'pen' then id+3 else id end 'newId', name from college;



#creating views
use Business;
Create table citizenloc  (Name varchar(30), Location varchar(30));
Create table citizen  (Name varchar(30), age int (50), exp int (50));
insert into citizenloc values ('rahul','california');
insert into citizenloc values ('george','california');
insert into citizenloc values ('flex','texas');
insert into citizenloc values ('stive','california');
insert into citizenloc values ('husain','chicago');
select * from citizenloc;
insert into citizen values ('rahul',43,6);
insert into citizen values ('george',34,8);
insert into citizen values ('flex',22,5);
insert into citizen values ('stive',67,3);
insert into citizen values ('husain',55,8);
insert into citizen values ('mara',25,7);
select * from citizen;
select age, Name from citizen where Name in (select Name from citizenloc where age = 43);
select c.Name, cl.Location from citizen as c join citizenloc as cl on c.Name = cl.Name;
select * from citizen c, citizenloc cl where c.Name= cl.Name;
create view citixenonfo as select * from citizenloc as cl where cl.Location = 'california';
select*from citixenonfo;
select concat (Name,age) as newName from citizen;
select substr(Name, 2,2) from citizen where Name ='rahul';
select replace(Name,'ra','ura') from citizen where Name = 'rahul';
select*from citizen;
select length(Name), Name from citizen where Name in ('rahul','mara');
select age, Name from citizen limit 3;


#primary key
use Qabdt;
create table constab (flightnumber varchar(50), flightid integer not null);
describe constab;
insert into constab values (null,null);
select * from constab;
create table constab2 (name varchar (20), age int default 25);
insert into constab2 (name) values ('jack');
select * from constab2;
create table constab3 (name varchar (20), id integer unique);
insert into constab3 (name,id) values ('jack', 21);
select * from constab3;
create table constab3 (name varchar (20), id integer unique);
insert into constab3 (name,id) values ('jim', 22);
create table constab4 (name varchar (20), id integer (integer)>10);
create table empdb (empid int, name varchar(20), branch varchar (20), primary key(empid));
describe empdb;
insert into empdb (empid, name, branch) values (7, null,null);
select *from empdb;