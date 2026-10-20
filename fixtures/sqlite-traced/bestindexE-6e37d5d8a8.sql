SELECT * FROM
  (
     SELECT Delivery.ID, Customer.Name
     FROM Delivery LEFT JOIN
     Customer ON Delivery.Customer = Customer.OID

     UNION

     SELECT ReturnDelivery.ID, Customer.Name
     FROM ReturnDelivery LEFT JOIN
     Customer ON ReturnDelivery.Customer = Customer.OID
  )
  WHERE ID = 1
