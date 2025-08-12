SELECT DISTINCT pay.Acct AS '������� No', pargr.Name AS '�������� �����', par.Company AS '��������', par.Bulstat AS '���', pay.qtty AS '���� ��������',
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
AND god.Id = 228
Group By pay.Acct, pay.qtty, Obj.Name, god.Name, par.Company, par.Bulstat, pargr.Name, oper.OperType, OperType.BG, oper.Date, users.Name, doc.Description, oper.Note
ORDER BY Users.Name
