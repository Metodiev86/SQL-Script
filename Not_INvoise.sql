/* Payment */
SELECT DISTINCT pay.ID AS 'ID на Плащане',pay.Acct, pay.EndDate AS 'Дата на Падеж',  pay.mode AS 'Платил/Неплатил', pay.qtty AS 'Обща Стойност',
                obj.Name AS 'Обект', god.Name As 'Продукт',
 
					/* Document */
	doc.ExternalInvoiceNumber AS 'Фактура 2', doc.InvoiceDate AS 'Дата на Фактура/Кредитно',  doc.OperType AS 'Операция при Фактура',
	doc.invoiceNumber AS 'Документ No', operType.BG AS 'Вид на Операцията', oper.OperType AS 'Операция при Стокова',

					/* Partner */
	par.Company AS Партньор, pargr.Name AS 'Партньор Група'

				/* END SELECT */

FROM Payments as pay

	LEFT JOIN Documents AS doc ON pay.Acct = doc.Acct and doc.OperType = pay.OperType
	LEFT JOIN Partners AS par ON Pay.PartnerID = par.ID
	LEFT JOIN Operations AS oper ON pay.Acct = oper.Acct
	LEFT JOIN PartnersGroups AS parGR ON par.GroupID = parGR.ID
	LEFT JOIN OperationType AS operType ON pay.OperType = operType.ID
        LEFT JOIN Goods As god ON god.ID = oper.GoodID
        LEFT JOIN Objects as obj on obj.Id = oper.ObjectID

WHERE  
	operType.BG IN ('Дебитно известие', 'Кредитно известие', 'Отчитане на консигнация', 'Продажба') 
AND 
	oper.OperType IN (2, 16, 26, 27)
AND
	doc.invoiceNumber IS NULL
AND god.Id = 228