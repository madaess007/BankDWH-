SELECT
c.Customer_ID, c.[First Name], c.[Last Name],
c.Email, c.BD, c.State, c.Gender,
cph.[Mobile Number],
a.[Account Number], a.[Account Type], a.Balance, a.Status, a.[Branch ID], 
ca.CardNumber, ca.Card_Type, ca.Card_Status, ca.Expiry_Date,ca.CSV

FROM [Union_Bank].[dbo].Customer as c
LEFT JOIN [Union_Bank].[dbo].Customer_Phones as cph
ON c.Customer_ID = cph.Customer_ID
LEFT JOIN [Union_Bank].[dbo].Account as a
ON a.[Customer ID] = c.Customer_ID
LEFT JOIN [Union_Bank].[dbo].Card as ca
ON ca.Account_Number = a.[Account Number]


Print @@ROWCOUNT