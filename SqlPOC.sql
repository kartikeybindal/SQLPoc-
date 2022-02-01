
-- Author Table
create table author (
id int primary key auto_increment,
name varchar(100)
);

-- Post Table

create table post(
id int primary key auto_increment,
name varchar(100),
authorid int ,
createdts datetime,
foreign key (authorid) references author(id)

);

-- Comment Table
create table comment (
id int primary key auto_increment,
content varchar(1000),
postid int ,
createdts datetime,
userid int ,
foreign key (postid)  references post(id),
foreign key (userid)  references user(id)


);
-- User Table
create table user (
id int primary key auto_increment,
name varchar(100)
);

-- Query: Get list of Posts with latest 10 comments of each post authored by 'James Bond'


SELECT * FROM comment
WHERE id IN (SELECT id FROM comment WHERE createdts = (SELECT MAX(createdts) FROM comment))
ORDER BY createdts
 in(select id  from post where name in(select name from author where name="james bond" group by name)) limit 10;




