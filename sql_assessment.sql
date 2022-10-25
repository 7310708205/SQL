use LMS_DB;

create table lms_members(
	member_id varchar(10),
    member_name varchar(30),
    city varchar(20),
    date_register date,
    date_expire date,
    membership_status varchar(15),
    primary key(member_id)
);

insert into lms_members values('LM001', 'AMIT', 'CHENNAI', '2012-02-12', '2013-02-11', 'Temporary');
insert into lms_members values('LM002', 'ABHDUL', 'DELHI', '2012-04-10', '2013-04-09', 'Temporary');
insert into lms_members values('LM003', 'GAYAN', 'CHENNAI', '2012-05-13', '2013-05-12', 'Permanent');
insert into lms_members values('LM004', 'RADHA', 'CHENNAI', '2012-04-22', '2013-04-21', 'Temporary');
insert into lms_members values('LM005', 'GURU', 'BENGALORE', '2012-03-30', '2013-05-16', 'Temporary');
insert into lms_members values('LM006', 'MOHAN', 'CHENNAI', '2012-04-12', '2013-04-12', 'Temporary');

create table lms_suppliers_details(
	supplier_id varchar(3),
    supplier_name varchar(30),
    address varchar(50),
    contact int,
    email varchar(25),
    primary key(supplier_id)
);

insert into lms_suppliers_details values('S01', 'SINGAPORE SHOPPEE', 'CHENNAI', 98941235, 'sing@gmail.com');
insert into lms_suppliers_details values('S02', 'Jk Stores', 'MUMBAI', 99401234, 'jks@gmail.com');
insert into lms_suppliers_details values('S03', 'ROSE BOOK STORE', 'TRIVANDRUM', 94444112, 'rose@gmail.com');
insert into lms_suppliers_details values('S04', 'KAVARI STORE', 'DELHI', 86300014, 'kavi@gmail.com');
insert into lms_suppliers_details values('S05', 'EINSTIEN BOOK GALLARY', 'US', 95420000, 'eingal@gmail.com');
insert into lms_suppliers_details values('S06', 'AKBAR STORE', 'MUMBAI', 78556231, 'akbakst@gmail.com');

create table lms_fine_details(
	fine_range varchar(3),
    fine_amount int,
    primary key(fine_range)
);

insert into lms_fine_details values ('R0', 0);
insert into lms_fine_details values ('R1', 20);
insert into lms_fine_details values ('R2', 50);
insert into lms_fine_details values ('R3', 75);
insert into lms_fine_details values ('R4', 100);
insert into lms_fine_details values ('R5', 150);
insert into lms_fine_details values ('R6', 200);

create table lms_book_details(
	book_code varchar(10),
    book_title varchar(50),
    category varchar(15),
    author varchar(30),
    publication varchar(30),
    publish_date date,
    book_edition int,
    price int,
    rack_no varchar(3),
    date_arrival date,
    supplier_id varchar(3) references lms_suppliers_details(supplier_id),
    primary key(book_code)
);

insert into lms_book_details values('BL000010', 'Java ForvDummies', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-12-10', 6, 575, 'A1', '2011-05-10', 'S01');
insert into lms_book_details values('BL000002', 'Java: The Complete R..', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill', '2011-10-10', 5, 750, 'A1', '2011-05-10', 'S03');
insert into lms_book_details values('BL000003', 'Java How to do Prog..', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1995-05-10', 6, 600, 'A1', '2012-05-10', 'S01');
insert into lms_book_details values('BL000004', 'Java: The Complete R..', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill', '2011-10-10', 5, 750, 'A1', '2011-05-12', 'S01');
insert into lms_book_details values('BL000005', 'Java How to do Prog..', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-12-10', 6, 600, 'A1', '2012-05-11', 'S01');
insert into lms_book_details values('BL000006', 'Java: The Complete R..', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill', '2011-10-10', 5, 750, 'A1', '2012-05-12', 'S03');
insert into lms_book_details values('BL000007', 'Let Us C', 'C', 'Yashavant Kanetkar', 'BPB Publications', '2010-12-11', 9, 500, 'A3', '2010-11-03', 'S03');
insert into lms_book_details values('BL000008', 'Let Us C', 'C', 'Yashavant Kanetkar', 'BPB Publications', '2010-05-12', 9, 500, 'A3', '2011-08-09', 'S04');
insert into lms_book_details values('BL000009', 'Let Us C#', 'C', 'Yashavant Kanetkar', 'BPB Publications', '2010-05-12', 9, 550, 'A3', '2011-08-09', 'S04');
insert into lms_book_details values('BL000011', 'Let Us C++', 'C', 'Yashavant Kanetkar', 'BPB Publications', '2010-05-12', 9, 650, 'A3', '2011-08-09', 'S04');

create table lms_book_issue(
	book_issue_no int,
    member_id varchar(10) references lms_member(member_id),
    book_code varchar(10) references lms_book_details(book_code),
    date_isssue date,
    date_returned date,
    book_issue_status varchar(20),
    fine_range varchar(3) references fine_details(fine_range),
    primary key (book_issue_no)
);

insert into lms_book_issue value(1, 'LM001', 'BL000010', '2012-05-01', '2012-05-16', '2012-05-16', 'R0');
insert into lms_book_issue value(2, 'LM002', 'BL000002', '2012-05-01', '2012-05-06', '2012-05-16', 'R2');
insert into lms_book_issue value(3, 'LM003', 'BL000007', '2012-04-01', '2012-04-16', '2012-04-20', 'R1');
insert into lms_book_issue value(4, 'LM004', 'BL000005', '2012-04-01', '2012-04-16', '2012-04-20', 'R1');
insert into lms_book_issue value(5, 'LM005', 'BL000008', '2012-03-30', '2012-04-15', '2012-04-20', 'R1');
insert into lms_book_issue value(6, 'LM005', 'BL000008', '2012-04-20', '2012-05-05', '2012-05-05', 'R0');
insert into lms_book_issue value(7, 'LM003', 'BL000007', '2012-04-22', '2012-05-07', '2012-05-25', 'R4');


DESC lms_book_details;

select * from lms_fine_details;

select member_name from lms_members where city='CHENNAI';

select member_id, member_name, city, membership_status from lms_members where membership_status='Permanent';

select b1. member_id,b1.member_name from lms_members b1,lms_book_issue b2 where b2.book_code='BL000002';

select member_id, member_name from lms_members where book_code=(select book_title from lms_book_details where book_code='BL000002');

select book_code, book_title, author from lms_book_details where author like 'P%';

select count(category) as NO_OF_BOOKS from lms_book_details where category='JAVA';

select category, count(category)as NO_OF_BOOKS from lms_book_details group by category;

select count(publication) as NO_OF_BOOKS from lms_book_details where publication='Prentice Hall';

select b1.book_code, b2.book_title from lms_book_issue b1 inner join lms_book_details b2 on b1.book_code=b2.book_code where b1.date_isssue='2012-04-01';

select member_id, member_name, date_register, date_expire from lms_members where date_expire < '2013-04-01';

select member_id, member_name, date_register, membership_status from lms_members where date_register < '2012-03-01' and membership_status='Temporary';

select member_id, member_name from lms_members where city='CHENNAI' or city='DELHI';

select concat(book_title, '_Is_Written_by_', author) from lms_book_details;

select avg(price) as 'AVERAGEPRICE' from lms_book_details where category='JAVA';

select supplier_id, supplier_name, email from lms_suppliers_details where email like '%gmail.com';

select book_code, book_title, rack_no from lms_book_details where rack_no='A1' order by book_title asc;

select rack_no, count(book_code) as NOOFBOOKS from lms_book_details group by rack_no;


select * from lms_suppliers_details where supplier_id < 'S04';

select * from lms_suppliers_details where supplier_id > 'S03';

alter table lms_members rename to lms_members_details;

Delimiter $
create procedure getAllDetails()
begin
select * from lms_members;
select * from lms_suppliers_details;
select * from lms_fine_details;
select * from lms_book_details;
select * from lms_book_issue;
end$
Delimiter ;
call getAllDetails();

