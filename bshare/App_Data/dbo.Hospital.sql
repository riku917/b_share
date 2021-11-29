CREATE TABLE [dbo].[Hospital] (
    [Hospitalname] NVARCHAR (50) NOT NULL,
    [Callnumber]   INT           NULL,
    [Bedcount]     INT           NULL,
    [log]          DATETIME      NULL,
    [Address]      NVARCHAR (50) NULL,
    [Bedtype]      INT           NULL,
    [Bedinfected]  INT           NULL,
    [Bedmental]    INT           NULL,
    [Bedcovid]     INT           NULL,
    [Bedsevere]    INT           NULL,
    [HospitalID] INT NULL, 
    [prefecture] VARCHAR(50) NULL, 
    PRIMARY KEY CLUSTERED ([Hospitalname] ASC)
);

