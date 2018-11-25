--SQL Create

CREATE TABLE Role (
RoleID numeric(10) NOT NULL,
RoleName varchar(25)NOT NULL,

Constraint Role_PK primary key (RoleID)
);


CREATE TABLE Users (
UserID numeric(10) NOT NULL,
UserName varchar(25)NOT NULL,
UserPassword varchar(50)NOT NULL,
RoleID numeric(10) NOT NULL,
FirstName varchar(25) NOT NULL,
LastName varchar(25) NOT NULL,
UserEmail varchar(50) NOT NULL,

Constraint Users_PK primary key (UserID),
Constraint Users_FK_Role foreign key (RoleID) references Role
);



CREATE TABLE SystemReports (
ReportID numeric(10) NOT NULL,
RoleLevel numeric(10) NOT NULL,
ReportName varchar(25) NOT NULL,
QueryReport varchar(255)NOT NULL,

Constraint SystemReports_PK primary key (ReportID),
Constraint SystemReports_FK_Role foreign key (RoleLevel) references Role(RoleID)
);




CREATE TABLE ScanType (
ScanID numeric(10) NOT NULL,
ScanDescription varchar(255)NOT NULL,   
InitPort numeric(10) NOT NULL,
FinalPort numeric(10) NOT NULL,
InitIP varchar(25) NOT NULL,
FinalIP varchar(25) NOT NULL,
SetCommand varchar(25),

Constraint ScanType_PK primary key (ScanID)
);



CREATE TABLE ScanHistory (
ScanRecordID numeric(10) NOT NULL,
ScanID numeric(10) NOT NULL,
UserID numeric(10) NOT NULL,
ScanDate datetime NOT NULL default getdate(),
Description varchar(50)NOT NULL, 
Recomendations varchar(255)NOT NULL,   

Constraint ScanHistory_PK primary key (ScanRecordID),
Constraint ScanHistory_FK_ScanType foreign key (ScanID) references ScanType,
Constraint ScanHistory_FK_Users foreign key (UserID) references Users
);


CREATE TABLE ScanDetails (
ResultID numeric(10) NOT NULL,
ScanRecordID numeric(10) NOT NULL,
IPV4 varchar(25) NOT NULL,
Port numeric(10) NOT NULL,
Status varchar(10) NOT NULL,
Description varchar(50),

Constraint ScanDetails_PK primary key (ResultID),
Constraint ScanDetails_FK_ScanHistory foreign key (ScanRecordID) references ScanHistory
);


--SQL Inserts


INSERT INTO Role (RoleID, RoleName) VALUES (1,'BasicUser');
INSERT INTO Role (RoleID, RoleName) VALUES (2,'AdvanceUser');
INSERT INTO Role (RoleID, RoleName) VALUES (3,'Administrator');

INSERT INTO Users (UserID,UserName,UserPassword,RoleID,FirstName,LastName,UserEmail) 
	VALUES (1,'admin','1234',3,'Marcelo','Ferreira','mcf2018@gmail.com');
