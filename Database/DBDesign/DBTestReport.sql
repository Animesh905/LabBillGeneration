CREATE TABLE [tbl_Testdata] (
	ID integer(3) NOT NULL,
	TestName varchar(MAX) NOT NULL,
	TestPrice decimal(5) NOT NULL,
	isActive boolean NOT NULL DEFAULT '1',
  CONSTRAINT [PK_TBL_TESTDATA] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [tbl_Doctor] (
	ID integer(3) NOT NULL,
	DoctorName varchar(MAX) NOT NULL,
	DoctorDomain varchar(MAX) NOT NULL,
	Address varchar(MAX),
	isActive boolean DEFAULT 'true',
  CONSTRAINT [PK_TBL_DOCTOR] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [tbl_PatientDetail] (
	ID integer(5) NOT NULL,
	Name varchar(MAX) NOT NULL,
	Address varchar(MAX) NOT NULL,
	ContactNo integer(10) NOT NULL UNIQUE,
	Age integer(1) NOT NULL UNIQUE,
	Sex varchar(1) NOT NULL,
	Createddate timestamp NOT NULL,
  CONSTRAINT [PK_TBL_PATIENTDETAIL] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [tbl_Refer] (
	ID integer(5) NOT NULL,
	DoctorID integer(5) NOT NULL,
	PatientID integer(5) NOT NULL,
  CONSTRAINT [PK_TBL_REFER] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [tbl_CDDeposit] (
	TransID integer(7) NOT NULL,
	TransactionID varchar(MAX) NOT NULL UNIQUE,
	Mode varchar(20) NOT NULL UNIQUE,
	Amount integer(5) NOT NULL,
	ChequeNo integer(20) NOT NULL,
	ChequeDate date NOT NULL,
	CDStatus boolean NOT NULL DEFAULT 'true',
	TransactionDate timestamp NOT NULL,
  CONSTRAINT [PK_TBL_CDDEPOSIT] PRIMARY KEY CLUSTERED
  (
  [TransID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [tbl_PatientTestDetails] (
	ID integer(5) NOT NULL,
	TestID integer(5) NOT NULL,
	DoctorID integer(5) NOT NULL,
	PatientID integer(5) NOT NULL,
	AmountDetailsID integer(5) NOT NULL,
  CONSTRAINT [PK_TBL_PATIENTTESTDETAILS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [tbl_AmountDetails] (
	ID integer(5) NOT NULL,
	FinalAmount integer(5) NOT NULL,
	TransactionID varchar(MAX) NOT NULL,
	PatientTestID integer(5) NOT NULL,
	Discount integer(5) NOT NULL,
	UpdateOn timestamp NOT NULL,
  CONSTRAINT [PK_TBL_AMOUNTDETAILS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [tbl_BillDetails] (
	ID integer(5) NOT NULL,
	Bill_ID varchar(MAX) NOT NULL,
	GenerateOn timestamp NOT NULL,
	TransactionID varchar(MAX) NOT NULL,
  CONSTRAINT [PK_TBL_BILLDETAILS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO



ALTER TABLE [tbl_Refer] WITH CHECK ADD CONSTRAINT [tbl_Refer_fk0] FOREIGN KEY ([DoctorID]) REFERENCES [tbl_Doctor]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [tbl_Refer] CHECK CONSTRAINT [tbl_Refer_fk0]
GO
ALTER TABLE [tbl_Refer] WITH CHECK ADD CONSTRAINT [tbl_Refer_fk1] FOREIGN KEY ([PatientID]) REFERENCES [tbl_PatientDetail]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [tbl_Refer] CHECK CONSTRAINT [tbl_Refer_fk1]
GO


ALTER TABLE [tbl_PatientTestDetails] WITH CHECK ADD CONSTRAINT [tbl_PatientTestDetails_fk0] FOREIGN KEY ([TestID]) REFERENCES [tbl_Testdata]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [tbl_PatientTestDetails] CHECK CONSTRAINT [tbl_PatientTestDetails_fk0]
GO
ALTER TABLE [tbl_PatientTestDetails] WITH CHECK ADD CONSTRAINT [tbl_PatientTestDetails_fk1] FOREIGN KEY ([DoctorID]) REFERENCES [tbl_Doctor]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [tbl_PatientTestDetails] CHECK CONSTRAINT [tbl_PatientTestDetails_fk1]
GO
ALTER TABLE [tbl_PatientTestDetails] WITH CHECK ADD CONSTRAINT [tbl_PatientTestDetails_fk2] FOREIGN KEY ([PatientID]) REFERENCES [tbl_PatientDetail]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [tbl_PatientTestDetails] CHECK CONSTRAINT [tbl_PatientTestDetails_fk2]
GO
ALTER TABLE [tbl_PatientTestDetails] WITH CHECK ADD CONSTRAINT [tbl_PatientTestDetails_fk3] FOREIGN KEY ([AmountDetailsID]) REFERENCES [tbl_AmountDetails]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [tbl_PatientTestDetails] CHECK CONSTRAINT [tbl_PatientTestDetails_fk3]
GO

ALTER TABLE [tbl_AmountDetails] WITH CHECK ADD CONSTRAINT [tbl_AmountDetails_fk0] FOREIGN KEY ([TransactionID]) REFERENCES [tbl_CDDeposit]([TransactionID])
ON UPDATE CASCADE
GO
ALTER TABLE [tbl_AmountDetails] CHECK CONSTRAINT [tbl_AmountDetails_fk0]
GO
ALTER TABLE [tbl_AmountDetails] WITH CHECK ADD CONSTRAINT [tbl_AmountDetails_fk1] FOREIGN KEY ([PatientTestID]) REFERENCES [tbl_PatientTestDetails]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [tbl_AmountDetails] CHECK CONSTRAINT [tbl_AmountDetails_fk1]
GO

ALTER TABLE [tbl_BillDetails] WITH CHECK ADD CONSTRAINT [tbl_BillDetails_fk0] FOREIGN KEY ([TransactionID]) REFERENCES [tbl_CDDeposit]([TransactionID])
ON UPDATE CASCADE
GO
ALTER TABLE [tbl_BillDetails] CHECK CONSTRAINT [tbl_BillDetails_fk0]
GO

