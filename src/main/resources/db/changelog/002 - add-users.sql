--liquibase formatted sql

--changeset serg:1568198447624-1
INSERT INTO authority (id, name)
VALUES (1, 'USER');
commit;

--changeset serg:1568198447624-2
-- passwor: 'passwd', encryption: bcrypt
INSERT INTO "user" (id, login, enabled, first_name, last_name, password)
VALUES (1, 'JohnDoe', true, 'John', 'Doe', '$2y$12$3ywaZ1TNNHznqmajkCTV0.UIAu7ffU6H7L65VCMoI5BDthY0jNdTe');
INSERT INTO "user" (id, login, enabled, first_name, last_name, password)
VALUES (2, 'Ivanov', true, 'Ivan', 'Ivanov', '$2y$12$3ywaZ1TNNHznqmajkCTV0.UIAu7ffU6H7L65VCMoI5BDthY0jNdTe');
INSERT INTO "user" (id, login, enabled, first_name, last_name, password)
VALUES (3, 'user', true, 'Some', 'User', '$2y$12$3ywaZ1TNNHznqmajkCTV0.UIAu7ffU6H7L65VCMoI5BDthY0jNdTe');
commit;

--changeset serg:1568198447624-3
INSERT INTO user_authority (user_id, authority_id)
VALUES (1, 1);
INSERT INTO user_authority (user_id, authority_id)
VALUES (2, 1);
INSERT INTO user_authority (user_id, authority_id)
VALUES (3, 1);
commit;