-- Assignment: 07
-- Write a database trigger on Library table. The System should keep track
-- of the records that are being updated or deleted. The old value of updated
-- or deleted records should be added in Library_ Audit table. Frame the
-- problem statement for writing Database Triggers of all types, in-line with
-- above statement. The problem statement should clearly state the requirements.
create table library
(
    book_id int primary key,
    title varchar(20),
    author varchar(20),
    edition int,
    no_of_copies int
);
desc library;

create table library_audit
(
    book_id int,
    title varchar(20),
    author varchar(20),
    edition int,
    no_of_copy int,
    date_of_mod date,
    type_of_operation varchar(30),
    user_of_operation varchar(30)
);

desc library_audit;

create table transaction
(
    trans_id int,
    book_id int,
    issue_return varchar(10),
    no_of_copy int
);

desc transaction;

insert into library values
    (1, 'TOC', 'vvRichard', 4, 5),
    (2, 'CN', 'Foruzan', 2, 6),
    (3, 'ISEE', 'Rahul De', 6, 10),
    (4, 'DBMS', 'Silberchatz', 6, 8),
    (5, 'SEPM', 'Pressman', 7, 4),
    (6, 'DS', 'Horitzsahani', 9, 6),
    (7, 'Java', 'Powell', 8, 7),
    (8, 'Learning Scala', 'Swartz', 7, 4),
    (9, 'Cpp', 'Bjarne', 7, 2),
    (10, 'python', 'Thoma', 5, 9);

select * from library;

-- 1. Create a trigger to keep the track of records that are updated or
-- deleted from the library table .Theold values of updated or deleted
-- record should be added in library audit table along with the date of
-- modification ,type of modification and the user who performed the
-- modification.

delimiter //
create trigger t after update on library for each row
    begin
        declare a varchar(10);
        set a = 'updated';
        insert into library_audit values
        (
         old.book_id,
         old.title,
         old.author,
         old.edition,
         old.no_of_copies,
         curdate(),
         a,
         current_user()
        );
    end //

-- Verifying trigger:
update library
set author = 'Mishra'
where book_id = 1;

select *
from library_audit;