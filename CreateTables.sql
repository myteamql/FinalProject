CREATE TABLE IF NOT EXISTS Room
(
    room_number   INTEGER NOT NULL AUTO_INCREMENT,
    max_occupants INTEGER,
    type         VARCHAR(50),
    decor        VARCHAR(255),
    price        FLOAT,
    beds         INTEGER,
    length       FLOAT,
    popularity   FLOAT,
    pictureurl   VARCHAR(2000),
    next_available Date,
    PRIMARY KEY (room_number)
);

CREATE TABLE IF NOT EXISTS CreditCard
(
    cr_number BIGINT NOT NULL,
    first     VARCHAR(50),
    last      VARCHAR(50),
    PRIMARY KEY (cr_number)
);

CREATE TABLE IF NOT EXISTS Reservation
(
    code      INTEGER NOT NULL AUTO_INCREMENT,
    room      INTEGER,
    check_in   DATE,
    check_out  DATE,
    last_name  VARCHAR(50),
    first_name VARCHAR(50),
    adults    INTEGER,
    kids      INTEGER,
    canceled TINYINT(1) DEFAULT 0,
    cr_number  BIGINT,
    PRIMARY KEY (code),
	FOREIGN KEY (cr_number) REFERENCES CreditCard (cr_number),
    FOREIGN KEY (room) REFERENCES Room (room_number)
);

CREATE TABLE IF NOT EXISTS Payment
(
    reservation_code INTEGER NOT NULL,
    first           VARCHAR(50),
    last            VARCHAR(50),
    cr_number        BIGINT,
    charged         FLOAT,
    PRIMARY KEY (reservation_code),
    FOREIGN KEY (reservation_code) REFERENCES Reservation (code),
    FOREIGN KEY (cr_number) REFERENCES CreditCard (cr_number)
);
