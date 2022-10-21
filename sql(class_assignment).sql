create table hospital(
Pno int,Name varchar(20),
Age int,Department varchar(100),
Dateofadm date,
charges int,
sex char(1),
primary key(Pno)
);
insert into hospital values(1,"Arpita",62,"Surgery","1998-01-12",300,"M");
insert into hospital values(2,"Zarina",22,"ENT","1998-12-12",250,"F");
insert into hospital values(3,"Kareem",32,"Orthopedic","1998-02-19",200,"M");
insert into hospital values(4,"Arun",12,"Surgery","1998-01-11",300,"M");
insert into hospital values(5,"Zubin",30,"ENT","1998-01-12",250,"M");
insert into hospital values(6,"Ketaki",16,"ENT","1998-02-24",250,"F");
insert into hospital values(7,"Ankita",29,"Cardiology","1998-02-20",800,"F");
insert into hospital values(8,"Zareen",45,"Gynaecologist","1998-02-22",300,"F");
insert into hospital values(9,"Kush",19,"Cardiology","1998-01-13",800,"M");
insert into hospital values(10,"Shilpa",23,"Nuclear Medicine","1998-01-20",400,"F");

desc hospital;

select concat(name,' age of ',age,' admitted on ',dateofadm) as "Details of patient"from hospital;

alter table hospital add Address char(20);

alter table hospital change Address Address char(25);

alter table hospital change Address Address varchar(25);

-- alter table hospital rename column Address to Home_Address;

Alter table Hospital drop column Home_Address ;

alter table hospital rename to  Hospital_data;

delete from hospital;

drop table hospital;