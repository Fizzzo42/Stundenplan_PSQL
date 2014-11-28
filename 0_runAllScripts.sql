-- Author Schmidiger, Kevin and Kaya, Oezhan

\echo Running all scripts


\set user derchef
\set password '\'derchef\''
\set database stundenplanung


DROP DATABASE if exists :database;
DROP USER if exists :user;

\echo -------------------------------------
\echo Your Username: :user
\echo Your Password: :password
\echo -------------------------------------

CREATE USER :user WITH PASSWORD :password;
CREATE DATABASE :database WITH OWNER :user ENCODING 'UTF8';
\c :database :user

-- specify encoding to match your files encoding, usually UTF8
-- valid values are: 'UTF8', 'LATIN1', 'WIN1252'
\encoding 'UTF8'

-- create extensions
--\ir 1_extensions.sql

-- create schema
\ir 2_schema.sql

-- insert data
\ir 3_inserts.sql

-- create primary keys, constraints, indexes
\ir 4_constraints.sql

\encoding 'auto'

\set ECHO queries
-- query the database
\ir 5_queries.sql

