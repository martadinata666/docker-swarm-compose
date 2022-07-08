1. Create an admin user where nothing will match ldap directory
2. enable and setup LDAP
3. login into mysql
4. select * from oc_users;
5. copy out the data to another place.
6. delete from oc_users where uid<>'the-admin-in-steps-1';
7. if you accidentally deleted the admin user, remember we copied out data at steps 5
8. insert back the data
insert into oc_users (uid,passwords,uid_lower) values ("theadmin","thepass","the-uid-lowername");