CREATE TABLE Room
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

CREATE TABLE Reservation
(
    Code      INTEGER NOT NULL,
    Room      INTEGER,
    CheckIn   DATE,
    CheckOut  DATE,
    Rate      FLOAT,
    LastName  VARCHAR(50),
    FirstName VARCHAR(50),
    Adults    INTEGER,
    Kids      INTEGER,
    Cancelled TINYINT(1) DEFAULT 0,
    CrNumber  LONG,
    PRIMARY KEY (RoomNumber),
    FOREIGN KEY (Room) REFERENCES Room (Room)
);

CREATE TABLE CreditCard
(
    CrNumber LONG NOT NULL,
    PRIMARY KEY (CrNumber)
);

CREATE TABLE Payment
(
    ReservationCode INTEGER NOT NULL,
    CrNumber        LONG,
    Charged         FLOAT,
    PRIMARY KEY (ReservationCode),
    FOREIGN KEY (ReservationCode) REFERENCES Reservation (Code),
    FOREIGN KEY (CrNumber) REFERENCES CreditCard (CrNumber)
);