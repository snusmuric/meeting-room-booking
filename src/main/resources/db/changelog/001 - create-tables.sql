--liquibase formatted sql

--changeset serg:1568196277766-1
CREATE TABLE authority (
  id   SERIAL      NOT NULL,
  name VARCHAR(50) NOT NULL,
  CONSTRAINT "authorityPK" PRIMARY KEY (id)
);

--changeset serg:1568196277766-2
CREATE TABLE "app_user" (
  id         SERIAL      NOT NULL,
  enabled    BOOLEAN     NOT NULL,
  first_name VARCHAR(255),
  last_name  VARCHAR(255),
  login      VARCHAR(50) NOT NULL,
  password   VARCHAR(255) NOT NULL,
  CONSTRAINT "appUserPK" PRIMARY KEY (id)
);

--changeset serg:1568196277766-3
CREATE TABLE user_authority (
  user_id      SERIAL NOT NULL,
  authority_id SERIAL NOT NULL,
  CONSTRAINT USER_AUTHORITY_PKEY PRIMARY KEY (user_id, authority_id)
);

--changeset serg:1568196277766-5
ALTER TABLE user_authority
  ADD CONSTRAINT "FK_user_authority_authority" FOREIGN KEY (authority_id) REFERENCES authority (id);

--changeset serg:1568196277766-6
ALTER TABLE user_authority
  ADD CONSTRAINT "FK_user_authority_app_user" FOREIGN KEY (user_id) REFERENCES "app_user" (id);

