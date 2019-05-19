CREATE TABLE IF NOT EXISTS Room
(
    RoomNumber   INTEGER NOT NULL,
    MaxOccupants INTEGER,
    Type         VARCHAR(50),
    Decor        VARCHAR(255),
    Price        FLOAT,
    Beds         INTEGER,
    Length       FLOAT,
    Popularity   FLOAT,
    PRIMARY KEY (RoomNumber)
);

CREATE TABLE IF NOT EXISTS CreditCard
(
    CrNumber BIGINT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (CrNumber)
);

CREATE TABLE IF NOT EXISTS Reservation
(
    Code      INTEGER NOT NULL AUTO_INCREMENT,
    Room      INTEGER,
    CheckIn   DATE,
    CheckOut  DATE,
    Rate      FLOAT,
    LastName  VARCHAR(50),
    FirstName VARCHAR(50),
    Adults    INTEGER,
    Kids      INTEGER,
    Cancelled TINYINT(1) DEFAULT 0,
    CrNumber  BIGINT,
    PRIMARY KEY (Code),
	FOREIGN KEY (CrNumber) REFERENCES CreditCard (CrNumber),
    FOREIGN KEY (Room) REFERENCES Room (RoomNumber)
);

CREATE TABLE IF NOT EXISTS Payment
(
    ReservationCode INTEGER NOT NULL,
    CrNumber        BIGINT,
    Charged         FLOAT,
    PRIMARY KEY (ReservationCode),
    FOREIGN KEY (ReservationCode) REFERENCES Reservation (Code),
    FOREIGN KEY (CrNumber) REFERENCES CreditCard (CrNumber)
);