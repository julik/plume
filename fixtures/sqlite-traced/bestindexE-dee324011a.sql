SELECT Delivery.ID, Customer.Name
  FROM Delivery LEFT JOIN
  Customer ON Delivery.Customer = Customer.OID
