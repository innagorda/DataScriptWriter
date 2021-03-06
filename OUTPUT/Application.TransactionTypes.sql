CREATE PROCEDURE [dbo].[Populate_Application_TransactionTypes]
AS
BEGIN
/*
	Table's data:    [Application].[TransactionTypes]
	Data Source:     [DEV19].[WideWorldImporters]
	Created on:      02/12/2020 00:13:12
	Scripted by:     DEV19\Administrator
	Generated by:    Data Script Writer - ver. 2.3.0.0
	GitHub repo URL: https://github.com/SQLPlayer/DataScriptWriter/
*/
PRINT 'Populating data into [Application].[TransactionTypes]';

IF NOT EXISTS (SELECT TOP (1) * FROM [Application].[TransactionTypes])
BEGIN

	;WITH cte_data
	as (SELECT [TransactionTypeID], [TransactionTypeName], [LastEditedBy] FROM 
	(VALUES
	  (1,	N'Customer Invoice',	1)
	, (2,	N'Customer Credit Note',	1)
	, (3,	N'Customer Payment Received',	1)
	, (4,	N'Customer Refund',	1)
	, (5,	N'Supplier Invoice',	1)
	, (6,	N'Supplier Credit Note',	1)
	, (7,	N'Supplier Payment Issued',	1)
	, (8,	N'Supplier Refund',	1)
	, (9,	N'Stock Transfer',	1)
	, (10,	N'Stock Issue',	1)
	, (11,	N'Stock Receipt',	1)
	, (12,	N'Stock Adjustment at Stocktake',	1)
	, (13,	N'Customer Contra',	9)
	) as v ([TransactionTypeID], [TransactionTypeName], [LastEditedBy])
)
	INSERT INTO [Application].[TransactionTypes]
	([TransactionTypeID], [TransactionTypeName], [LastEditedBy])
	SELECT [TransactionTypeID], [TransactionTypeName], [LastEditedBy]
	FROM cte_data;

END

-- End data of table: [Application].[TransactionTypes] --
END
GO
