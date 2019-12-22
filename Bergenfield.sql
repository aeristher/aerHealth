--Aristher Manalaysay
--April 21, 2019

--BERGENFIELD DATABASE PROJECT

use master
go
drop database Bergenfield
go
create database Bergenfield
go
use Bergenfield
go

create table patient (
patientID int identity primary key,
firstName nvarchar(50) not null,
lastName nvarchar(50) not null,
phoneNumber bigint not null,
birthDate date not null,
streetAddress nvarchar(60) not null,
City nvarchar(60) not null,
[state] nvarchar(60) not null,
zipCode int not null,
);

--please note that for facilities, there are only two. For the sake of being accurate to the actual Bergenfield facility, I will be creating a 
--check constraint for the only two facilities.
create table facility (
facilityID int identity primary key,
facilityName nvarchar(50) not null,
streetAddress nvarchar(60) not null,
[state] nvarchar(60) not null,
city nvarchar(60) not null,
zipCode int not null,
check(facilityName in ('Bergenfield','Bloomfield')),
);

create table physician (
physicianID int identity primary key,
firstName nvarchar(50) not null,
lastName nvarchar(50) not null,
birthDate date not null,
streetAddress nvarchar(60) not null,
[state] nvarchar(60) not null,
city nvarchar(60) not null,
zipCode int not null,
phoneNumber bigint not null,
facilityID int not null references facility(facilityID),
);

create table appointment (
appointmentID int identity primary key,
appointmentDate date not null,
issue nvarchar(50),
patientID int not null references patient(patientID),
physicianID int not null references physician(physicianID)
);

create table diagnosis (
diagnosisID int identity primary key,
treatment nvarchar(75),
category nvarchar(50),
appointmentID int not null references appointment(appointmentID)
);

create table insurance (
insuranceID int identity primary key,
companyName nvarchar(60) not null,
streetAddress nvarchar(60) not null,
[state] nvarchar(60) not null,
City nvarchar(60) not null,
zipCode int not null,
phoneNumber bigint not null,
category nvarchar(60) not null,
);

create table bill (
billID int identity primary key,
amount int,
issuedDate date not null,
dueDate date not null,
appointmentID int not null references appointment(appointmentID),
insuranceID int not null references insurance(insuranceID)
);

create table patientphysician (
patientID int not null references patient(patientID),
physicianID int not null references physician(physicianID)
primary key (patientID,physicianID)
);


--indexes
create index idx_patient_lastname on patient(lastname);
create index idx_physician_lastname on physician(lastname);
create index idx_appointment_issue on appointment(issue);
create unique index idx_facility_facilityname on facility(facilityname);
create unique index idx_insurance_companyname on insurance(companyname);

--inserting data
insert into facility (facilityName,streetAddress,[state],city,zipcode)
values ('Bergenfield','108 S Washington Ave','New Jersey','Bergenfield','07621');
insert into facility (facilityName,streetAddress,[state],city,zipcode)
values ('Bloomfield','135 Bloomfield Ave','New Jersey','Bloomfield','07003');

insert into physician (firstName,lastName,birthdate,streetAddress,[state],city,zipCode,phoneNumber,facilityID) 
values ('Adrian','Lozada','1998-07-19','15 E','Pennsylvania','East Stroudsburg','18301', '7324567891','1');

insert into physician (firstName,lastName,birthdate,streetAddress,[state],city,zipCode,phoneNumber,facilityID)
values ('Joe','Lozada','1973-07-03','15 E','Pennsylvania','East Stroudsburg','18301','7323491452','1');

insert into physician (firstName,lastName,birthdate,streetAddress,[state],city,zipCode,phoneNumber,facilityID)
values ('Neng','Lozada','1976-07-10','15 E','Pennsylvania','East Stroudsburg','18301','7320993643','1');

insert into physician (firstName,lastName,birthdate,streetAddress,[state],city,zipCode,phoneNumber,facilityID)
values ('Jen','Maron','1988-09-04','20 Wilcox Ave','New Jersey','Wharton','07885','7326281304','2');

insert into physician (firstName,lastName,birthdate,streetAddress,[state],city,zipCode,phoneNumber,facilityID)
values ('Nicolas','Dover','1985-03-02','34-4 Vinton Rd','New Jersey','Madison','07940','9087729986','2');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('Hawa Kati','Ido','4182254611','1997-08-08','Hillside Morningside','Fort Worth','Texas','76104');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('Aaron','Suranofsky','8145992126','1999-12-09','513 1st Ave','Johnsonburg','Pennsylvania','15845');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('Jon','Azcona','7126378399','1999-12-21','1 Tru','Nazareth','Pennsylvania','18064');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('Rayan','Abedin','778853567','2000-04-03','Wurch Drive','Cranberry Twp','Pennsylvania','16066');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('Alexa','Bachurski','8996276115','1999-05-07','344-306 Cloverdale Dr','Wexford','Pennsylvania','15090');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('James','Park','7128970098','1998-05-09','402 Can Drive','Perkasie','Pennsylvania','18944');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('Jason','Clark','8140049789','1997-04-06','401-499 E Walnut St','Titusville','Pennsylvania','16354');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('Cameron','Biel','8147745212','1999-12-19','400-498 Haines St','Kane','Pennsylvania','16735');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('Nathan','Morris','8149492097','1999-07-12','46-74 Burnside Ave','Bradford','Pennsylvania','16701');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('Calvin','Leung','8146432397','1999-09-12','14 Burnside','Bradford','Pennsylvania','16701');

insert into patient (firstName,lastName,phoneNumber,birthDate,streetAddress,City,[state],zipCode)
values ('Aristher','Manalaysay','8156332794','1999-04-08','401 Brad','Bradford','Pennsylvania','16701');

insert into patientphysician (physicianID,patientID)
values ('1','1');

insert into patientphysician (physicianID,patientID)
values ('2','2');

insert into patientphysician (physicianID,patientID)
values ('3','3');

insert into patientphysician (physicianID,patientID)
values ('4','4');

insert into patientphysician (physicianID,patientID)
values ('5','5');

insert into patientphysician (physicianID,patientID)
values ('5','6');

insert into patientphysician (physicianID,patientID)
values ('1','7');

insert into patientphysician (physicianID,patientID)
values ('2','8');

insert into patientphysician (physicianID,patientID)
values ('3','9');

insert into patientphysician (physicianID,patientID)
values ('4','10');

insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-19','Weak joints','3','5');

insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-20','concussion','1','4');

insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-20','osteoarthritis','2','3');

insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-22','carpal tunnel','5','4');

insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-22','back pain','4','5');

insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-23','muscular dystrophy','6','2');

insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-24','unsteadiness on feet','7','4');

insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-22','lack of coordination','8','5');

insert into appointment(appointmentDate,Issue,patientID,physicianID)
values ('2019-04-26','temporomandibular joint disorder','8','4');

insert into diagnosis(category,treatment,appointmentID)
values ('muscular weakness','muscle strenghtening exercises','1');

insert into diagnosis(category,treatment,appointmentID)
values ('sprains','ultrasound','2');

insert into diagnosis(category,treatment,appointmentID)
values ('injured tissue','electrical stimulation','3');

insert into diagnosis(category,treatment,appointmentID)
values ('sprains','neuromuscular electrical stimulation','4');

insert into diagnosis(category,treatment,appointmentID)
values ('back pain','traction','5');

insert into diagnosis(category,treatment,appointmentID)
values ('muscle tension','trigger point massage','6');

insert into diagnosis(category,treatment,appointmentID)
values ('swelling','ice','7');

insert into insurance(companyName,streetAddress,city,[state],zipcode,phoneNumber,category)
values ('Unitedhealth','12501 Whitewater Dr','Hopkins','Minnesota','55343','8885455205','MedicAid');

insert into insurance(companyName,streetAddress,city,[state],zipcode,phoneNumber,category)
values ('Centene Corp','1150 Connecticut Ave','Washington','D.C','20036','2022238010','Medicare');

insert into insurance(companyName,streetAddress,city,[state],zipcode,phoneNumber,category)
values ('Coventry','6720-B Rockledge Drive','Bethesda','Maryland','20817','3015810600','Medicare');

insert into insurance(companyName,streetAddress,city,[state],zipcode,phoneNumber,category)
values ('Blue Cross Blue Shield of Western New York','257 W Genesse St','Buffalo','New York','14202','7168876900','Medicare');

insert into insurance(companyName,streetAddress,city,[state],zipcode,phoneNumber,category)
values ('Highmark','120 Fifth Ave','Pittsburgh','Pennsylvania','15222','4125447000','Medicaid');

insert into bill(amount,issuedDate,dueDate,appointmentID,insuranceID)
values ('100','2019-03-06','2019-04-10','1','1');

insert into bill(amount,issuedDate,dueDate,appointmentID,insuranceID)
values ('2049','2019-04-28','2019-05-20','2','2');

insert into bill(amount,issuedDate,dueDate,appointmentID,insuranceID)
values ('3089','2019-05-05','2019-06-10','3','3');

insert into bill(amount,issuedDate,dueDate,appointmentID,insuranceID)
values ('408','2019-05-05','2019-04-10','4','4');

insert into bill(amount,issuedDate,dueDate,appointmentID,insuranceID)
values ('5012','2019-05-05','2019-04-10','5','5');

select * from physician
select * from patient
select * from bill
select * from appointment
select * from insurance
select * from facility
select * from patientphysician
select * from diagnosis

--CREATING PROCEDURES
--1.) this update procedure is to update a patient's treatment
go
create procedure updatetreatment1
@treatment nvarchar(80),
@firstname nvarchar(50),
@lastname nvarchar(50)
AS
BEGIN
update diagnosis
set treatment=@treatment
from diagnosis d
	join appointment a on a.appointmentid=d.appointmentid
	join patient p on p.patientID=a.patientID
where p.firstName=@firstname and p.lastName=@lastname
END;
go

exec updatetreatment1 @treatment='Back Massage',@firstname='Rayan',@lastname='Abedin';
exec updatetreatment1 @treatment='physical exercise',@firstname='Jon',@lastname='Azcona';


--2.) this is a select procedure that lets the physician know what is the patient's first name and last name if given a patientID

go
create procedure patientidlookup5
@patientID int,
@first_name nvarchar(50) OUTPUT,
@last_name nvarchar(50) OUTPUT
as
begin
select p.firstname,p.lastname,pp.patientID from patient p join patientphysician pp
on pp.patientID=p.patientID
where p.patientID=@patientID
END;
go

Declare @first_name nvarchar(50);
Declare @last_name nvarchar(50);
exec patientidlookup5 @patientID='6', @first_name=@first_name,@last_name=@last_name;

go
create procedure removepatient3
@pppatient_id int
AS
BEGIN
delete from patientphysician where patientID=@pppatient_id
END;
go
exec removepatient3 @pppatient_id='149'
select * from patient;
select * from patientphysician

--3.) this delete procedure is to delete any patients who are
--not part of the system anymore. Either deceased, or have 
--found a new caretaker
go
create procedure removepatientpeople
@first_name nvarchar(50),
@last_name nvarchar(50)
AS
BEGIN
delete from patient where firstname=@first_name and lastName=@last_name
END;
go

exec removepatientpeople @first_name='Aristher', @last_name='Manalaysay';

--4.) Inserting new patient data along to their new physician
go
create procedure loadpatient4
@PA_firstName nvarchar(50),
@PA_lastName nvarchar(50),
@PA_PHONE bigint,
@PA_birthDate date,
@PA_streetAddress nvarchar(60),
@PA_City nvarchar(60),
@PA_state nvarchar(60),
@PA_zipCode int,
@PH_physicianID int,
@PH_patientID int
AS
BEGIN
insert into patient (firstName,lastName,phoneNumber,
birthDate,streetAddress,City,state,zipCode)
values (@PA_firstName,@PA_lastName,@PA_PHONE,@PA_birthDate,@PA_streetAddress,@PA_City,@PA_state,@PA_zipCode)
insert into patientphysician(physicianID,patientID)
values (@PH_physicianID,SCOPE_IDENTITY());
END;
go

Declare @PH_patientID int;
exec loadpatient4 @PA_firstname = 'Sebastian',@PA_lastname='Scout',@PA_PHONE = '8155471088',@PA_Birthdate ='1997-04-05',
@PA_StreetAddress='54 Fury',@PA_City='Rixford',@PA_state='Pennsylvania',@PA_Zipcode='16745',@PH_patientID=@PH_patientID
,@PH_PhysicianID='3';
select * from patient;

-- CREATING VIEWS
--1.) create view for viewing patient treatments
go
create view patienttreatment as
select p.firstName, d.treatment
from patient p join appointment a on a.patientID=p.patientID
join diagnosis d on d.appointmentID=a.appointmentID
go

select * from patienttreatment

--2.) create view for viewing patient's issue and their appointment date along with their corresponding physician
go
create view patientappointments as
select p.firstName as 'Patient First Name', p.lastName as 'Patient Last Name', ph.firstName as 'Physician First Name', ph.lastName as 'Physician Last Name',
a.appointmentDate as 'Appointment Date', a.Issue as 'Patient Issue'
from appointment a 
join patient p on p.patientID=a.patientID
join physician ph on ph.physicianID=a.physicianID
go

select * from patientappointments;

--3.) create view for viewing the amount the insurance owe while also including the patient's name and the corresponding physician.
go
create view insuranceowe as
select b.amount,i.companyName as Insurance,p.firstName as 'Patient First Name',p.lastName as 'Patient Last Name',ph.firstname as 'Physician First Name',ph.lastname as 'Physician Last Name'from appointment a
join bill b on b.appointmentID=a.appointmentID
join insurance i on i.insuranceID=a.appointmentID
join patient p on p.patientID=a.patientID
join physician ph on ph.physicianID=a.physicianID
go

select * from insuranceowe

--4.) create view for viewing Bergenfield physicians
go
create view BergenfieldPhysicians as
select f.facilityname, p.firstname, p.lastname as physician
from facility f join physician p on f.facilityID=p.facilityID
where f.facilityName='Bergenfield';
go

select * from bergenfieldphysicians

--5.) create view for viewing Bloomfield physicians
go
create view BloomfieldPhysicians as
select f.facilityname, p.firstname, p.lastname as physician
from facility f join physician p on f.facilityID=p.facilityID
where f.facilityName='Bloomfield';
go

select * from BloomfieldPhysicians

--6.) create view for viewing which patients go to which facility
go
create view bergenfieldpatient as
select p.firstName as 'Patient First Name',p.lastName as 'Patient Last Name',ph.firstName AS 'Physician First Name', ph.lastName AS 'Physician Last Name',
f.facilityName as 'Facility Name'
from patient p join patientphysician pp on pp.patientID=p.patientID
join physician ph on ph.physicianID=pp.physicianID
join facility f on f.facilityID=ph.facilityID
go

select * from bergenfieldpatient

