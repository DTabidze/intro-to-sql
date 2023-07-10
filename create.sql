drop table if exists instructors;
Create table instructors(
    id integer primary key,
    fname text not null,
    middle_initial text,
    lname text not null,
    tenured integer check(tenured==0 or tenured==1) default 0
);
drop table if exists students;
create table students(
    id integer primary key,
    fname text not null check(length(fname)>2 and length(fname)<50),
    middle_initial text check(length(middle_initial)==1),
    lname text not null,
    registered integer check(registered==0 or registered==1) default 0
);
drop table if exists courses;
create table courses(
    id integer primary key,
    title text not null unique,
    date_created text default CURRENT_TIMESTAMP,
    date_updated text
);
CREATE TRIGGER update_date_updated UPDATE OF title ON courses
    BEGIN
        UPDATE courses set date_updated=CURRENT_TIMESTAMP WHERE title=old.title;
    END