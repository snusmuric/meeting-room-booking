--liquibase formatted sql

--changeset serg:1568565557658-1
CREATE TABLE booking (
  id                 SERIAL                 NOT NULL,
  booking_end_time   TIME WITHOUT TIME ZONE NOT NULL,
  booking_start_time TIME WITHOUT TIME ZONE NOT NULL,
  description        VARCHAR(255),
  CONSTRAINT "bookingPK" PRIMARY KEY (id)
);

--changeset serg:1568565557658-2
CREATE TABLE participant (
  booking_id SERIAL NOT NULL,
  user_id    SERIAL NOT NULL,
  CONSTRAINT PARTICIPANT_PKEY PRIMARY KEY (booking_id, user_id)
);

--changeset serg:1568565557658-3
CREATE TABLE room (
  id       SERIAL      NOT NULL,
  location VARCHAR(255),
  name     VARCHAR(50) NOT NULL,
  CONSTRAINT "roomPK" PRIMARY KEY (id)
);

--changeset serg:1568565557658-6
ALTER TABLE participant
  ADD CONSTRAINT "FK_participant_booking" FOREIGN KEY (booking_id) REFERENCES booking (id);

--changeset serg:1568565557658-7
ALTER TABLE participant
  ADD CONSTRAINT "FK_participant_user" FOREIGN KEY (user_id) REFERENCES app_user (id);

