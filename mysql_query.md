##### command to export query data to csv 

    mysql <database> -e "<query here>" | tr '\t' ',' > data.csv

######Eg:

    mysql -h 127.0.0.1 -u durga -p durgaDB -e "SELECT 	so.erp_order_id, soa.postcode, soa.firstname, soa.lastname, soa.street, soa.city, soa.address_type, soa.country_id, soa.telephone FROM sales_order as so , sales_order_address as soa where so.created_at like '2019-09-07%' and soa.parent_id = so.entity_id and soa.address_type ='shipping'" | tr '\t' ',' > data.csv



##### export csv from mysql prompt

    SELECT * FROM Customers
         INTO OUTFILE '/tmp/customers.csv';

###### with fild seperator

    SELECT * FROM Customers
    INTO OUTFILE '/tmp/customers.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

###### Eg: to export json date to csv
    
    MariaDB [durgaDB]> SELECT so.erp_order_id,  soa.postcode,  soa.firstname, soa.lastname, soa.street, soa.city, soa.address_type, soa.country_id,  JSON_EXTRACT(JSON_EXTRACT(JSON_EXTRACT(JSON_EXTRACT(JSON_EXTRACT(so.erp_set_order_req, '$.request'), '$.set_order_req'), '$.order_req'), '$[0]'), '$.shipping_address_id') as shipping_address_id, JSON_EXTRACT(JSON_EXTRACT(JSON_EXTRACT(JSON_EXTRACT(JSON_EXTRACT(so.erp_set_order_req, '$.request'), '$.set_order_req'), '$.order_req'), '$[0]'), '$.customer_number') as customer_number,  soa.telephone FROM `sales_order` as so , `sales_order_address` as soa where so.created_at like '2019-09-16%' and soa.parent_id = so.entity_id and soa.address_type ='shipping' INTO OUTFILE '/tmp/mydata_2019_09_16.csv' FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n';

###### Adding Headers 

    /* Add column headers */
    SELECT 'OrderId','CustomerID','EmployeeID','OrderDate','RequiredDate','ShippedDate','ShipVia','Freight','ShipName','ShipAddress','ShipCity','ShipRegion','ShipPostalCode','ShipCountry','OrderID','ProductId','UnitPrice','Quantity','Discount'
    
    UNION ALL
    
    /* Now the actual query */
    SELECT o.OrderId, o.CustomerID, o.EmployeeID, o.OrderDate, o.RequiredDate, o.ShippedDate, o.ShipVia, o.Freight, o.ShipName, o.ShipAddress, o.ShipCity, o.ShipRegion, o.ShipPostalCode, o.ShipCountry, od.OrderID, od.ProductId, od.UnitPrice, od.Quantity, od.Discount 
    
    FROM `Orders` o  LEFT JOIN `Order Details` od ON od.OrderID = o.OrderID 
    
    /* Save the query results to a file */
    INTO OUTFILE '/tmp/orders.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

