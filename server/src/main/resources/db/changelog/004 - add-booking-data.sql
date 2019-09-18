--liquibase formatted sql

--changeset serg:1568566176118-1
INSERT INTO room (id, name, location)
VALUES (1, 'Meeting Room #12', 'Main Office');
INSERT INTO room (id, name, location)
VALUES (2, 'HR Room', '1st floor, ap. 123');
commit;
