SELECT 
b.BranchID, b.BranchName, b.Branch_Location, 
a.[ATM ID], a.[ATM Status],
e.[Employee ID], e.[First Name], e.[Last Name], 
e.Salary, e.Position, e.SuperVisor_ID,
d.Dnumber, d.Dname, d.MGRID
FROM [Union_Bank].[dbo].Branch as b 
LEFT JOIN [Union_Bank].[dbo].employee as e
ON b.BranchId = e.[Branch ID]
LEFT JOIN [Union_Bank].[dbo].Department as d
ON e.DNO = d.Dnumber
LEFT JOIN [Union_Bank].[dbo].ATM as a
ON a.[Branch ID] = b.BranchId


PRINT @@ROWCOUNT