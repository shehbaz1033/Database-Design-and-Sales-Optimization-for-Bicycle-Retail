SELECT 
	o.order_id, 
	CONCAT(cust.first_name, ' ', cust.last_name) AS 'customer',
	cust.city,
	cust.state,
	o.order_date,
	SUM(oi.quantity) AS 'total_units',
	SUM(oi.quantity * oi.list_price) AS 'revenue',
	p.product_name,
	cat.category_name,
	br.brand_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name) AS 'sales_representative'
FROM
	sales.orders o
JOIN
	sales.customers cust ON cust.customer_id = o.customer_id
JOIN
	sales.order_items oi ON o.order_id = oi.order_id
JOIN
	production.products p ON p.product_id = oi.product_id
JOIN
	production.categories cat ON cat.category_id = p.category_id
JOIN
	sales.stores sto ON sto.store_id = o.store_id
JOIN
	sales.staffs sta ON sta.staff_id = o.staff_id
JOIN
	production.brands br ON br.brand_id = p.brand_id
GROUP BY
	o.order_id, 
	CONCAT(cust.first_name, ' ', cust.last_name),
	cust.city,
	cust.state,
	o.order_date,
	p.product_name,
	cat.category_name,
	br.brand_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name);