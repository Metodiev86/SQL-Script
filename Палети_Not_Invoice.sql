SELECT DISTINCT (pay.Acct) AS '������� No', god.Name As '�������', pargr.Name AS '�������� �����', par.Company AS '��������', par.Bulstat AS '���',  (oper.Qtty * oper.Sign)*(-1) as '������',
                obj.Name AS '�����', oper.Note As '���������', users.Name As '��������', oper.Date AS '����', operType.BG AS '��������'

				/* END SELECT */

FROM Payments as pay
	
	LEFT JOIN Documents AS doc ON pay.Acct = doc.Acct and doc.OperType = pay.OperType
	LEFT JOIN Partners AS par ON Pay.PartnerID = par.ID
	LEFT JOIN Operations AS oper ON pay.Acct = oper.Acct and oper.OperType = pay.OperType
	LEFT JOIN PartnersGroups AS parGR ON par.GroupID = parGR.ID
	LEFT JOIN OperationType AS operType ON pay.OperType = operType.ID
    LEFT JOIN Goods As god ON god.ID = oper.GoodID
    LEFT JOIN Objects as obj on obj.Id = oper.ObjectID
	LEFT JOIN Users On Users.Id = oper.UserID

WHERE  
	oper.OperType IN (2, 16, 26, 27)
AND
	doc.invoiceNumber IS NULL
AND 
	god.GroupID in (114)

Group By pay.Acct, god.Name, Obj.Name, god.Name,  par.Company, par.Bulstat, pargr.Name, oper.Qtty, oper.OperType, OperType.BG, oper.Date, users.Name, oper.Note, oper.UserRealTime, doc.InvoiceDate, doc.ExternalInvoiceDate, oper.Sign

HAVING	SUM(pay.Mode * pay.Qtty) <> 0


ORDER BY par.Company, oper.Date
