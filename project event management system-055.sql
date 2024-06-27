CREATE DATABASE EventScheduleSystem; 
USE EventScheduleSystem; 
 
-- Create Tables 
 
CREATE TABLE Organizer ( 
OrganizerID INT PRIMARY KEY, 
OrganizerName VARCHAR(255) UNIQUE, 
ContactPerson VARCHAR(100), 
Email VARCHAR(100) UNIQUE, 
Phone VARCHAR(20) UNIQUE 
); 
 
CREATE TABLE Venue ( 
VenueID INT PRIMARY KEY, 
VenueName VARCHAR(255) UNIQUE, 
Address VARCHAR(255), 
Capacity INT, 
ContactPerson VARCHAR(100), 
Phone VARCHAR(20) UNIQUE 
); 
select*from Venue; 
 
 
CREATE TABLE Attendee ( 
AttendeeID INT PRIMARY KEY, 
FirstName VARCHAR(100), LastName VARCHAR(100), 
Email VARCHAR(100) UNIQUE, 
Phone VARCHAR(20) UNIQUE, 
RegistrationDate DATE 
); 
select*from Attendee; 
 
 
CREATE TABLE Speaker ( 
SpeakerID INT PRIMARY KEY, 
FirstName VARCHAR(100), 
LastName VARCHAR(100), 
Email VARCHAR(100) UNIQUE, 
Phone VARCHAR(20) UNIQUE, 
Bio TEXT 
); 
 
CREATE TABLE Sponsor ( 
SponsorID INT PRIMARY KEY, 
SponsorName VARCHAR(255) UNIQUE, 
ContactPerson VARCHAR(100), 
Email VARCHAR(100) UNIQUE, 
Phone VARCHAR(20) UNIQUE, 
SponsorshipLevel VARCHAR(50) 
); 
 
-- Inserting  Data 
 
INSERT INTO Organizer (OrganizerID, OrganizerName, ContactPerson, Email, Phone) 
VALUES 
(1, 'Tech Events Inc.', 'Sarah Johnson', 'info@techevents.com', '+1122334455'), 
(2, 'Music Group LLC', 'Mark Anderson', 'info@musicgroup.com', '+9988776655'), (3, 'Conference Masters', 'Emily Chen', 'info@conferencemasters.com', '+4455667788'); select*from Organizer; 
 
INSERT INTO Venue (VenueID, VenueName, Address, Capacity, ContactPerson, Phone) VALUES 
(1, 'Convention Center', '123 Main St, Anytown', 1000, 'Anna White', '+1122334455'), 
(2, 'Central Park', 'Central Park Ave, City', 5000, 'Michael Brown', '+9988776655'), 
(3, 'Exhibition Hall', '456 Exhibition Blvd, Town', 2000, 'David Lee', '+7788996655'); 
 
UPDATE Attendee SET 
FirstName = 'John', 
LastName = 'Smith', 
Email = 'john.smith@example.com', 
Phone = '+1234567890', 
RegistrationDate = '2024-06-20' WHERE AttendeeID = 1; select*from Attendee; 
INSERT INTO Attendee (AttendeeID, FirstName, LastName, Email, Phone, RegistrationDate) 
VALUES 
 
(1, 'John', 'Smith', 'john.smith@example.com', '+1234567890', '2024-06-20'), 
(2, 'Emily', 'Davis', 'emily.davis@example.com', '+1987654321', '2024-06-21'), (3, 'Michael', 'Brown', 'michael.brown@example.com', '+4455667788', '2024-06-22'); drop table Attendee; 
 
 
INSERT INTO Speaker (SpeakerID, FirstName, LastName, Email, Phone, Bio) 
VALUES 
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '+1122334455', 'Expert in AI and Machine Learning'), 
(2, 'David', 'Lee', 'david.lee@example.com', '+9988776655', 'Music producer and performer'), 
(3, 'Emily', 'Chen', 'emily.chen@example.com', '+4455667788', 'Business consultant and coach'); 
Select *from Speaker; 
 
INSERT INTO Sponsor (SponsorID, SponsorName, ContactPerson, Email, Phone, SponsorshipLevel) VALUES 
(1, 'Tech Solutions', 'Michael Brown', 'info@techsolutions.com', '+1122334455', 'Gold'); 
Select *from Sponsor; 
DROP DATABASE IF EXISTS EventScheduleSystem; 
 
 
USE EventScheduleSystem; 
GO 
 
-- Show total number of events for each organizer 
CREATE PROCEDURE ShowTotalEventsPerOrganizer 
AS 
BEGIN 
    SELECT OrganizerID, COUNT(EventID) AS TotalEvents 
    FROM Event 
    GROUP BY OrganizerID; 
END; 
GO 
 
-- Show total number of events for each venue 
CREATE PROCEDURE ShowTotalEventsPerVenue 
AS 
BEGIN 
    SELECT VenueID, COUNT(EventID) AS TotalEvents 
    FROM Schedule 
    GROUP BY VenueID; 
END; 
GO 
 
-- Show total number of events attended by each attendee 
CREATE PROCEDURE ShowTotalEventsPerAttendee 
AS 
BEGIN 
    SELECT AttendeeID, COUNT(EventID) AS TotalEvents 
    FROM Attendance 
    GROUP BY AttendeeID; 
END; GO 
select*from Attendee; 

-- Show total number of events per speaker 
CREATE PROCEDURE ShowTotalEventsPerSpeaker 
AS 
BEGIN 
    SELECT SpeakerID, COUNT(EventID) AS TotalEvents 
    FROM SpeakerEvents 
    GROUP BY SpeakerID; 
END; 
GO 
 
-- Show total sponsorship amount per sponsor 
CREATE PROCEDURE ShowTotalSponsorshipAmountPerSponsor 
AS 
BEGIN 
    SELECT SponsorID, SUM(SponsorshipAmount) AS TotalSponsorship 
    FROM Sponsorships 
    GROUP BY SponsorID; 
END; GO 
select *from Sponsor; 
- Execute Procedures 
 
-- Execute procedure to show total events per organizer 
EXEC ShowTotalEventsPerOrganizer; 
GO 
 
-- Execute procedure to show total events per venue 
EXEC ShowTotalEventsPerVenue; 
GO 
 
-- Execute procedure to show total events attended per attendee 
EXEC; 
GO 
 
-- Execute procedure to show total events per speaker 
EXEC ShowTotalEventsPerSpeaker; 
GO 
 
-- Execute procedure to show total sponsorship amount per sponsor 
EXEC ShowTotalSponsorshipAmountPerSponsor; 
GO 
USE EventScheduleSystem; 
GO 
 
 
-- Create Procedures to Update Data in Each Table 
 
-- Update Organizer's ContactPerson 
CREATE PROCEDURE UpdateOrganizerContactPerson 
    @OrganizerID INT, 
    @NewContactPerson VARCHAR(100) 
AS 
BEGIN 
    UPDATE Organizer 
    SET ContactPerson = @NewContactPerson 
    WHERE OrganizerID = @OrganizerID; 
END; 
GO 
 
-- Update Venue's Capacity 
CREATE PROCEDURE UpdateVenueCapacity 
    @VenueID INT, 
    @NewCapacity INT 
AS 
BEGIN 
    UPDATE Venue 
    SET Capacity = @NewCapacity 
    WHERE VenueID = @VenueID; 
END; GO select *from Venue; -- Update Attendee's Phone 
CREATE PROCEDURE UpdateAttendeePhone 
    @AttendeeID INT, 
    @NewPhone VARCHAR(20) 
AS 
BEGIN 
    UPDATE Attendee 
    SET Phone = @NewPhone 
    WHERE AttendeeID = @AttendeeID; 
END; GO 
select * from attendee -- Update Schedule's EndTime 

 
-- Update Speaker's Bio 
CREATE PROCEDURE UpdateSpeakerBio 
    @SpeakerID INT, 
    @NewBio TEXT 
AS 
BEGIN 
    UPDATE Speaker 
    SET Bio = @NewBio 
    WHERE SpeakerID = @SpeakerID; 
END; GO 
 
-- Update Sponsor's SponsorshipLevel 
CREATE PROCEDURE UpdateSponsorSponsorshipLevel 
    @SponsorID INT, 
    @NewSponsorshipLevel VARCHAR(50) 
AS 
BEGIN 
    UPDATE Sponsor 
    SET SponsorshipLevel = @NewSponsorshipLevel 
    WHERE SponsorID = @SponsorID; 
END; 
GO 
 
-- Execute Procedures to Update Data in Each Table 
 
-- Update Organizer 
EXEC UpdateOrganizerContactPerson 
 @OrganizerID = 1, @NewContactPerson = 'Updated Contact'; 
GO 
-- Update Venue 
EXEC UpdateVenueCapacity @VenueID = 1, @NewCapacity = 2000; 
GO 
 
-- Update Attendee 
EXEC UpdateAttendeePhone @AttendeeID = 1, @NewPhone = '+1234567899'; 
GO 
select * from attendee 

-- Update Speaker 
EXEC UpdateSpeakerBio @SpeakerID = 1, @NewBio = 'Updated Bio for AI Expert'; 
GO 
select * from Speaker 
-- Update Sponsor 
EXEC UpdateSponsorSponsorshipLevel @SponsorID = 1, @NewSponsorshipLevel = 'Platinum'; 
GO 
select * from Sponsor 
drop database EventScheduleSystem 
