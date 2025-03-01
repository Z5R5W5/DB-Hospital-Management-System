-- -------------------------------------------------------------------------------------------------------
-------------------------------------- (1) Aggregation Functions --------------------------------------------
-------------------------------------------------------------------------------------------------------

--Counts the total number of patients in the system.

select count(*) as "Total Number of Patient" from Patient p 

--Finds the average salary of all employees except  (doctors, nurses).

select avg(e.Salary) as "avarage salary " from Employee e 

--Counts how many patients are assigned to each room.

select par.Ro_ID, count(par.Pat_ID) AS Patient_Count 
from Patient_Ass_Roon par
group by par.Ro_ID;

--Finds the highest-paid of employee manager  .

select max(m.Salary) as "high salary of Mng_Emp" from Employee e ,Employee m 
where e.Mng_Emp=m.Emp_ID

--Finds the lowest salary and salary >200 for each job title not in IT Support or Maintenance Supervisor.

select e.Jop_Titile , min(e.Salary) as "min Salary" from Employee e
where e.Salary>200
group by e.Jop_Titile
having e.Jop_Titile not in ('Maintenance Supervisor','IT Support')

--Calculates the total amount of money received from invoices.

select sum(p.Amount) as "total amount of money" from Patient p 

--Counts how many patients each doctor has examined.

select d.Dr_ID,d.Fname , count(p.Pat_ID)as "num patients each doctor has examined"  from Patient_EX_Dr px inner join Patient p
on px.Pat_Id=p.Pat_ID inner join Doctor d 
on d.Dr_ID=px.Dr_ID
group by d.Dr_ID,d.Fname 

--Finds full name of patient, the first and last recorded patient-doctor interactions for each patient 

select p.Fname + ' '+ p.Lname as "full name patient " ,min(pdg.Date) as "min Date" , max(pdg.Date) as "max Date" from Patient_Doctor_Drug pdg inner join Patient p
on pdg.Pat_ID=p.Pat_ID
group by p.Fname + ' '+ p.Lname

--Calculates the average number of drugs prescribed per patient. 

select avg(Drug_Count) as Avg_Drugs_Per_Patient
from (
    select Pat_ID, count(Dg_ID) as Drug_Count
    from Patient_Doctor_Drug
    group by Pat_ID
) as DrugCounts;


-- -------------------------------------------------------------------------------------------------------
-------------------------------------- (2) views --------------------------------------------
-------------------------------------------------------------------------------------------------------

--Shows patient details along with their invoices.
create view PatientInvoices 
as
select p.* from Patient p

select * from PatientInvoices

--Lists doctors along with their respective departments.

create or alter view DoctorDepartments 
as
select d.* ,m.Name as "Department Name" from Doctor d inner join Department m on d.Dep_ID=m.Dep_ID

select * from DoctorDepartments

--Find Department Id and his Manager Doctor 

create or alter view DoctorManagerDepartment
as
select m.Dep_ID, d.Fname +' '+d.Lname as"full name doctor"  from Department m inner join Doctor d
on m.Dr_ID=d.Dr_ID

select * from DoctorManagerDepartment

--Shows which patients are assigned to which rooms.

create view PatientRoomAssignment 
as
select p.Pat_ID,p.Fname as "patient name",r.Ro_ID,r.Name as "room name" from Patient p inner join Patient_Ass_Roon par 
on p.Pat_ID =par.Pat_ID inner join Room r 
on r.Ro_ID =par.Ro_ID

select * from PatientRoomAssignment

--Displays which nurses are assigned to which wards.

create or alter view NurseWardAssignment 
as
select n.* , w.Name as "wrad name" from Nurse n inner join Wrad w on n.Wr_ID=w.Wr_ID

select * from NurseWardAssignment

--Displays which nurses are supervise to which wards.

create or alter view NurseWardSuper 
as
select n.* , w.Name as "wrad name" from Nurse n inner join Wrad w on n.Nrs_ID=w.Nrs_ID

select * from NurseWardSuper

--Shows employee contact details

create view EmployeeContacts 
as
select * from Employee

select * from EmployeeContacts

--Lists medical records including treatments and diagnoses.

create view MedicalRecords 
as
select p.Pat_ID,mr.Med_Re_ID,p.Fname as "patient name" ,mr.Tratment,mr.Date from Medical_Record mr inner join Patient p 
on mr.Pat_ID=p.Pat_ID

select * from MedicalRecords

--Displays which doctors have examined which patients.

create or alter view PatientDoctorInteraction 
as
select p.Pat_ID,d.Dr_ID, p.Fname as "pat name", d.Fname as "dr name",d.Specialty from Patient p inner join Patient_EX_Dr ped 
on ped.Pat_Id=p.Pat_ID inner join Doctor d
on d.Dr_ID=ped.Dr_ID

select * from PatientDoctorInteraction

--Shows what drugs have been prescribed to patients and by which doctors.

create view PatientDrugPrescriptions 
as
select PDD.Pat_ID, P.Fname, P.Lname, PDD.Dr_ID, D.Fname as Dr_Fname, 
       PDD.Dg_ID, DR.Name as Drug_Name, PDD.Date, PDD.Time
from Patient_Doctor_Drug PDD
inner join Patient P on PDD.Pat_ID = P.Pat_ID
inner join Doctor D on PDD.Dr_ID = D.Dr_ID
inner join Drug DR on PDD.Dg_ID = DR.Dg_ID

select * from PatientDrugPrescriptions

--Displays available rooms.

create view AvailableRooms 
as
select r.Ro_ID, r.Name, r.Avaliblity
from Room r
where r.Avaliblity= 'Available';

select * from AvailableRooms


--Shows nurse contact details.

create view NurseContacts
as
select * from Nurse

select * from NurseContacts

-- -------------------------------------------------------------------------------------------------------
-------------------------------------- (3) Functions --------------------------------------------
-------------------------------------------------------------------------------------------------------

--This function counts the total number of patients in the hospital.

create or alter function GetTotalPatients()
returns int
as
begin
    declare @TotalPatients int
    select @TotalPatients = count(*) from Patient
    return @TotalPatients
end

select dbo.GetTotalPatients() as "number of patient";

--This function returns the full name of an employee based on their Emp_ID

create or alter function GetEmployeeFullName(@Emp_ID int)
returns varchar(100)
as
begin
	declare @FullName varchar(100)
    select @FullName = CONCAT(Fname, ' ', Lname) from Employee where Emp_ID = @Emp_ID
    return @FullName
end

select dbo.GetEmployeeFullName(3) as Employee_Name;

--This function returns the total invoice amount for a specific patient.

create or alter function dbo.GetTotalInvoiceAmount(@Pat_ID int)
returns decimal(10,2)
as
begin
    declare @TotalAmount decimal(10,2)
    select @TotalAmount = sum(p.Amount) from Patient p where p.Pat_ID = @Pat_ID
    return @TotalAmount
end;


select dbo.GetTotalInvoiceAmount(101) as Total_Invoice_Amount;



--This function returns all employees with a specific job title.

create or alter function GetEmployeesByJobTitle(@JobTitle varchar(50))
returns table
as
return (
    select Emp_ID, Fname, Lname, Salary, Email
    from Employee e
    where e.Jop_Titile = @JobTitle
);


declare @val varchar(50)
set @val = 'IT Support'
select * from dbo.GetEmployeesByJobTitle(@val) 

--This function returns all invoices based on their payment state (Admitted/Discharged).
select * from Patient

create or alter function dbo.GetInvoicesByState(@State varchar(50))
returns table
as
return (
    select Invoices_ID, Pat_ID, Amount, Date, State
    from Patient
    where State = @State
);

select * from GetInvoicesByState('Admitted')


--This function returns all drugs prescribed to a patient, along with the doctor who prescribed them.

create or alter function dbo.GetPatientDrugs(@Pat_ID int)
returns @PatientDrugs table (
    Drug_Name varchar(100),
    Doctor_Name varchar(100),
    DatePrescribed date
)
as
begin
    insert into @PatientDrugs
    select D.Name, CONCAT(Dr.Fname, ' ', Dr.Lname) as Doctor_Name, PDD.Date
    from Patient_Doctor_Drug PDD
    inner join Drug D on PDD.Dg_ID = D.Dg_ID
    inner join Doctor Dr on PDD.Dr_ID = Dr.Dr_ID
    where PDD.Pat_ID = @Pat_ID;
    
    return;
end;

select * from dbo.GetPatientDrugs(101);


--This function returns all rooms assigned to a specific patient.

create or alter function dbo.GetPatientRooms(@Pat_ID int)
returns @PatientRooms table (
    Room_ID int,
    Room_Name varchar(100),
    Avalability varchar(50)
)
as
begin
    insert into @PatientRooms
    select R.Ro_ID, R.Name, R.Avaliblity
    from Patient_Ass_Roon PAR
    inner join Room R on PAR.Ro_ID = R.Ro_ID
    where PAR.Pat_ID = @Pat_ID;
    
    return;
end;

select * from GetPatientRooms(107);


-- -------------------------------------------------------------------------------------------------------
-------------------------------------- (4) Stored Procedurse --------------------------------------------
-------------------------------------------------------------------------------------------------------

--This procedure inserts a new patient into the Patient table.

create or alter procedure AddPatient
	@Pat_ID int,
    @Fname varchar(50),
    @Lname varchar(50),
    @Sex varchar(10),
    @Address varchar(255),
    @BD date,
    @Invoices_ID int,
    @Date date,
    @State varchar(50),
    @Amount decimal(10,2),
    @Email varchar(100)
as
begin
    insert into Patient (Pat_ID,Fname, Lname, Six, Address, BD, Invoices_ID, Date, State, Amount, Email)
    values (@Pat_ID, @Fname, @Lname, @Sex, @Address, @BD, @Invoices_ID, @Date, @State, @Amount, @Email);
end;

exec AddPatient 121,'ziad', 'ayman', 'M', '123 Street', '1990-01-01', 111, '2025-02-27', 'Active', 500.00, 'ziad@example.com';

--This procedure links a doctor to a patient in the Patient_EX_Dr table.

create or alter procedure AssignDoctorToPatient
    @Dr_ID int,
    @Pat_ID int
as
begin
    insert into Patient_EX_Dr (Dr_ID, Pat_ID)
    values (@Dr_ID, @Pat_ID);
end;

exec AssignDoctorToPatient 101, 101;


--This procedure retrieves all medical records for a given patient name.

create or alter procedure GetPatientMedicalRecord
    @Pat_Name varchar(50)
as
begin
    select d.Med_Re_ID, d.Tratment, d.Date, d.Diagnsis
    FROM Medical_record d inner join Patient p 
	on d.Pat_ID=p.Pat_ID
    where p.Fname = @Pat_Name;
end;

EXEC GetPatientMedicalRecord 'John';

--This procedure assigns a patient to a room in the Patient_Ass_Room table.

create or alter procedure AssignPatientToRoom
    @Ro_ID int,
    @Pat_ID int
as
begin
    insert into Patient_Ass_Roon (Ro_ID, Pat_ID)
    values (@Ro_ID, @Pat_ID);
end;

exec AssignPatientToRoom 12,102

--This procedure whate patient name of special phones.

create or alter procedure PatientPhones
	@phone varchar(50) 
as
begin
	select p.Fname +' '+p.Lname as "Full name" from Patient p inner join Patient_Phones pf
	on p.Pat_ID=pf.Pat_ID
	where pf.Phone=@phone
end;

exec PatientPhones '123-456-7890'

-- -------------------------------------------------------------------------------------------------------
-------------------------------------- (4) Triggers --------------------------------------------
-------------------------------------------------------------------------------------------------------

------------------------------------Main Triggers ------------------------------------------------------
create trigger t1 on Patient 
after insert
as
select CONCAT(i.Fname , ' ', i.Lname ), 'Successfully added as patient' 
from inserted i

create trigger t2 on drug  
after insert
as
select i.Name , 'Successfully added as new drug' 
from inserted i


create trigger t4 on Medical_Record
instead of delete 
as
select  'not allow delete Medical_Records ' 

create trigger t5 on Patient 
after delete
as
select CONCAT(d.Fname , ' ', d.Lname ), 'Successfully deleted' 
from deleted d 

create trigger t6 on Department
after insert
as
select  'Successfully added Department ' , i.Name 
from inserted i 

create trigger t7 on Doctor
after insert
as
select  'Successfully added Doctor' , CONCAT(i.Fname , ' ', i.Lname )
from inserted i 

create trigger t8 on Employee
after insert
as
select  'Successfully added Employee' , CONCAT(i.Fname , ' ', i.Lname )
from inserted i

create trigger t9 on Nurse
after insert
as
select  'Successfully added Nurse' , CONCAT(i.Fname , ' ', i.Lname )
from inserted i


create trigger t10 on Nurse
after delete
as
select  'Successfully added Nurse' , CONCAT(d.Fname , ' ', d.Lname ) 
from deleted d 

create trigger t11 on Employee
after delete
as
select  'Successfully added Employee' , CONCAT(d.Fname , ' ', d.Lname ) 
from deleted d 

create trigger t12 on Doctor
after delete
as
select  'Successfully added Doctor' , CONCAT(d.Fname , ' ', d.Lname ) 
from deleted d 

create trigger t13 on Department
after delete
as
select  'Successfully added Department ' , d.Name 
from deleted d

create trigger t14 on drug  
after delete
as
select d.Name , 'Successfully deleted' 
from deleted d 


--This trigger updates the patient's state when an invoice is fully paid.

create or alter trigger UpdatePatientState
on Patient
after UPDATE
as
begin
    if UPDATE(Amount)
    begin
        UPDATE Patient
        set State = 'Admitted'
        where Amount = 0;
    end
end;

update Patient 
set Amount =0
where Pat_ID=102

select * from Patient

--This trigger prevents decreasing a doctor's salary

create trigger PreventSalaryDecrease
on Doctor
instead of UPDATE
as
begin
    if exists (
        select 1 from inserted i
        inner join deleted d on i.Dr_ID = d.Dr_ID
        where i.Salary < d.Salary
    )
    begin
        print 'Error: Salary decrease is not allowed!';
        rollback transaction;
    end
    else
    begin
        UPDATE Doctor
        set Salary = (select Salary from inserted where Doctor.Dr_ID = inserted.Dr_ID)
        from Doctor
        inner join inserted on Doctor.Dr_ID = inserted.Dr_ID;
    end
end;

select * from Doctor 
update Doctor 
set Salary =10100
where Dr_ID=101
--Error: Salary decrease is not allowed!
update Doctor 
set Salary =90100
where Dr_ID=101

--This trigger restricts deleting an employee if they manage others.

create or alter trigger PreventManagerDeletion
on Employee
instead of delete
as
begin
	if exists (
        select 1 from Employee e
        inner join deleted d on e.Mng_Emp = d.Emp_ID
    )
    begin
        print 'Error: Cannot delete a manager who supervises employees.';
        rollback transaction;
    end
    else
    begin
        delete from Employee where Emp_ID in (select Emp_ID FROM deleted);
    end
end;

select * from Employee
delete from Employee 
where Emp_ID=1
--Error: Cannot delete a manager who supervises employees.

delete from Employee 
where Emp_ID=7

--This trigger logs when a new drug is added to the Drug table.

create or alter trigger LogNewDrug
on Drug
after insert
as
begin
	--declare @Drug_Log table (Dg_ID int,Name varchar(50),Action varchar(50),Date date)
    --insert into Drug_Log (Dg_ID, Name, Action, Date)
    select i.Dg_ID, i.Name, 'Inserted' as "Action", GETDATE() as "date"
    from inserted i inner join Drug d on d.Dg_ID=i.Dg_ID;
end;

select * from Drug
insert into Drug values(15,'Panadole','Dry mon')

-- -------------------------------------------------------------------------------------------------------
-------------------------------------- (5) Index --------------------------------------------
-------------------------------------------------------------------------------------------------------

--This speeds up patient lookup queries.

create unique index idx_Patient_ID on Patient (Pat_ID);


--Since doctors are often searched by specialty.

create index idx_Doctor_Specialty on Doctor (Specialty);

--For queries filtering by both salary and job title.

create index idx_Employee_Salary_JobTitle on Employee (Salary, Jop_Titile);

--For quick retrieval of drug information.

create index idx_Drug_Name on Drug (Name);

--Since medical records are often filtered by date

create index idx_MedicalRecord_Date on Medical_Record (Date);

--For financial reports and filtering invoices by amount.

create index idx_Invoice_Amount on Patient (Amount);


