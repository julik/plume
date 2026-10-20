SELECT VendorId, ProductId, /* ProductName,*/ Price,
         avg(price) OVER (PARTITION BY vendorId) AS "Average",
         median(price) OVER (PARTITION BY vendorId) AS "Median"
    FROM products
   ORDER BY vendorId, productId;
