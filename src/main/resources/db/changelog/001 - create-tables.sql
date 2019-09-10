--liquibase formatted sql

--changeset serg:1568134444664-1
CREATE TABLE "user" (
  id            SERIAL       NOT NULL,
  first_name    VARCHAR(255),
  last_name     VARCHAR(255),
  password_hash VARCHAR(255) NOT NULL,
  username      VARCHAR(255) NOT NULL,
  CONSTRAINT "userPK" PRIMARY KEY (id)
);

--changeset serg:1568134444664-2
CREATE TABLE user_role (
  user_id SERIAL NOT NULL,
  role    VARCHAR(255)
);

--changeset serg:1568134444664-3
ALTER TABLE "user"
  ADD CONSTRAINT UC_USERUSERNAME_COL UNIQUE (username);

--changeset serg:1568134444664-4
ALTER TABLE user_role
  ADD CONSTRAINT "FK_user_role_user" FOREIGN KEY (user_id) REFERENCES "user" (id);

