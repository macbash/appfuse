alter table user_role drop constraint FK143BF46AF503D155;
alter table user_role drop constraint FK143BF46A4FD90D75;
drop table app_user if exists;
drop table role if exists;
drop table user_role if exists;
create table app_user (id bigint generated by default as identity, address varchar(150), country varchar(100), city varchar(50) not null, province varchar(100), postal_code varchar(15) not null, version integer, account_enabled bit, username varchar(50) not null unique, password varchar(255) not null, email varchar(255) not null unique, password_hint varchar(255), first_name varchar(50) not null, last_name varchar(50) not null, phone_number varchar(255), website varchar(255), account_expired bit not null, account_locked bit not null, credentials_expired bit not null, primary key (id));
create table role (id bigint generated by default as identity, name varchar(20), description varchar(64), primary key (id));
create table user_role (user_id bigint not null, role_id bigint not null, primary key (user_id, role_id));
alter table user_role add constraint FK143BF46AF503D155 foreign key (user_id) references app_user;
alter table user_role add constraint FK143BF46A4FD90D75 foreign key (role_id) references role;
