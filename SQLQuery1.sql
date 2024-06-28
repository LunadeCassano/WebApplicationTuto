SELECT TOP 1 * FROM Orders ORDER BY id DESC;

CREATE TABLE OrderDetail(
	id int primary key IDENTITY(1,1),
	productid int,
	unitprice float,
	quantity int,
	orderid varchar(5),
	total float,
	FOREIGN KEY (productid) REFERENCES tbl_Product(sku),
	FOREIGN KEY (orderid) REFERENCES Orders(id)
);

ALTER TABLE OrderDetail 
ADD CONSTRAINT FK_product_id
FOREIGN KEY (productid) REFERENCES [dbo].[tbl_Product](sku)
