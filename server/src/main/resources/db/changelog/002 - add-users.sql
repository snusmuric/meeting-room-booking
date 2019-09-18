--liquibase formatted sql

--changeset serg:1568198447624-1
INSERT INTO authority (id, name)
VALUES (1, 'USER');
commit;

--changeset serg:1568198447624-2
-- passwor: 'passwd', encryption: bcrypt
INSERT INTO "app_user" (id, login, enabled, first_name, last_name, password)
VALUES (1, 'JohnDoe', true, 'John', 'Doe', '$2a$10$Uznw2Y3NPr8P/OMayrEG1.U5SHiYe6nFvCQRPv1n//hEgZ0yYrQ1O');
INSERT INTO "app_user" (id, login, enabled, first_name, last_name, password)
VALUES (2, 'Ivanov', true, 'Ivan', 'Ivanov', '$2a$10$Uznw2Y3NPr8P/OMayrEG1.U5SHiYe6nFvCQRPv1n//hEgZ0yYrQ1O');
INSERT INTO "app_user" (id, login, enabled, first_name, last_name, password)
VALUES (3, 'user', true, 'Some', 'User', '$2a$10$Uznw2Y3NPr8P/OMayrEG1.U5SHiYe6nFvCQRPv1n//hEgZ0yYrQ1O');
commit;

--changeset serg:1568198447624-3
INSERT INTO user_authority (user_id, authority_id)
VALUES (1, 1);
INSERT INTO user_authority (user_id, authority_id)
VALUES (2, 1);
INSERT INTO user_authority (user_id, authority_id)
VALUES (3, 1);
commit;
