

/* Create Tables */

CREATE TABLE `Books`
(
	`bookingId` INT NOT NULL,
	`roomNumber` VARCHAR(3) NOT NULL,
	`CustomerId` INT NULL,
	`PayedAmount` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_Books` PRIMARY KEY (`bookingId` ASC),
FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`),
FOREIGN KEY (`roomNumber`) REFERENCES `Rooms` (`roomNumber`)  
)

;

CREATE TABLE `Customer`
(
	`CustomerId` INT NOT NULL,
	`Customer name` VARCHAR(30) NOT NULL,
	`gender` VARCHAR(6) NOT NULL,
	`IdentityCode` VARCHAR(20) NOT NULL,
	`phoneNumber` VARCHAR(20) NOT NULL,
	`email` VARCHAR(50) NULL,
	`bookingId` INT NULL,
	CONSTRAINT `PK_Customer` PRIMARY KEY (`CustomerId` ASC)
)

;

CREATE TABLE `Customer Feedbacks`
(
	`Feedback Id` INT NOT NULL,
	`DateOfPosting` DATE NOT NULL,
	`CustomerId` INT NULL,
	`Text` VARCHAR(200) NOT NULL,
	CONSTRAINT `PK_Customer Feedbacks` PRIMARY KEY (`Feedback Id` ASC),
FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`)
)

;

CREATE TABLE `Employees `
(
	`name` VARCHAR(30) NOT NULL,
	`email` VARCHAR(50) NULL,
	`DateOfBirth` DATE NOT NULL,
	`Address` VARCHAR(100) NOT NULL,
	`PhoneNumber` VARCHAR(20) NOT NULL,
	`jobTitle` VARCHAR(20) NOT NULL,
	`id` INT NOT NULL,
	CONSTRAINT `PK_Employees ` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Payment`
(
	`paymentId` INT NOT NULL,
	`amount` DECIMAL(19,4) NOT NULL,
	`CustomerId` INT NULL,
	CONSTRAINT `PK_Payment` PRIMARY KEY (`paymentId` ASC),
FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`)
)

;

CREATE TABLE `Rooms`
(
	`roomNumber` VARCHAR(3) NOT NULL,
	`NumberOfBeds` VARCHAR(1) NOT NULL,
	`isReserved` BOOL NOT NULL,
	CONSTRAINT `PK_Rooms` PRIMARY KEY (`roomNumber` ASC)
)

;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE `Books` 
 ADD CONSTRAINT `payedAmount` CHECK (value >=0)
;

ALTER TABLE `Customer` 
 ADD CONSTRAINT `gender` CHECK (values in ('male','female', 'etc'))
;

ALTER TABLE `Customer Feedbacks` 
 ADD CONSTRAINT `CustomerName` CHECK (value in (select customerName from Customer))
;

ALTER TABLE `Employees ` 
 ADD CONSTRAINT `BirthDate` CHECK (value >= '1997-01-01')
;

ALTER TABLE `Payment` 
 ADD CONSTRAINT `amount` CHECK (value >=0)
;






