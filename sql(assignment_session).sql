use sql_db;
create table garment(
	Gcode int,
    Description varchar(30),
    Price int,
    Fcode varchar (10),
    ReadyDate date
);
insert into garment values(10023, 'Pencil Skirt', 1150, 'F03', '10-12-19');
insert into garment values(10001, 'Formal Shirt', 1250, 'F01', '10-01-12');
insert into garment values(10012, 'Informal Shirt', 1550, 'F02', '10-01-06');
insert into garment values(10024, 'Baby Top', 750, 'F03', '07-04-09');
insert into garment values(10090, 'Tulip Skirt', 850, 'F02', '09-03-31');
insert into garment values(10019, 'Evening Gown', 850, 'F03', '10-06-06');
insert into garment values(10009, 'Informal Pant', 1500, 'F02', '10-09-20');
insert into garment values(10017, 'Formal Pant', 1350, 'F01', '09-03-09');
insert into garment values(10020, 'Frock', 850, 'F04', '09-08-09');
insert into garment values(10089, 'Slacks', 750, 'F03', '10-09-31');


create table fabric(
	Fcode varchar(10),
    Type varchar(20)
);
insert into fabric values('F04', 'Polyster');
insert into fabric values('F02', 'Cotton');
insert into fabric values('F03', 'Silk');
insert into fabric values('F01', 'Terelene');

Delimiter $
create procedure getDetails()
begin
select * from garment where ReadyDate between '09-12-08' and '10-06-16';
end$
Delimiter ;
call getDetails;