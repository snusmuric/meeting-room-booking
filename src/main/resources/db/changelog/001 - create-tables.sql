-- liquibase formatted sql

--changeset serg:1568131036615-1
CREATE SEQUENCE hibernate_sequence START WITH 1 INCREMENT BY 1;

--changeset serg:1568131036615-2
CREATE TABLE "user" (
  id numeric NOT NULL,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  password_hash VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL,
  CONSTRAINT "userPK" PRIMARY KEY (id)
);

--changeset serg:1568131036615-3
CREATE TABLE user_role (user_id numeric NOT NULL, role VARCHAR(255));

--changeset serg:1568131036615-4
ALTER TABLE "user" ADD CONSTRAINT UC_USERUSERNAME_COL UNIQUE (username);

--changeset serg:1568131036615-5
ALTER TABLE user_role ADD CONSTRAINT "FK_user_role_user_id" FOREIGN KEY (user_id) REFERENCES "user" (id);

