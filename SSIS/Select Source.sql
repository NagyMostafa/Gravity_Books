SELECT book.book_id, book.title, book.isbn13, book.language_id, 
	   book_language.language_code, book_language.language_name, 
	   book.num_pages, book.publication_date, book.publisher_id, 
	   publisher.publisher_name, book_author.author_id, author.author_name
FROM   book left  JOIN book_author 
   	   ON book_author.book_id = book.book_id  
	   left JOIN author 
	   ON author.author_id = book_author.author_id  
	   left JOIN book_language 
	   ON book.language_id = book_language.language_id  
	   left JOIN publisher 
	   ON book.publisher_id = publisher.publisher_id


SELECT customer.customer_id, customer.first_name, customer.last_name, customer.email,
	   customer_address.status_id, address_status.address_status, address.address_id,
	   address.street_number, address.street_name, address.city, address.country_id,
	   country.country_name
FROM   customer left join customer_address  
	   ON customer_address.customer_id = customer.customer_id
	   left JOIN address_status
	   ON address_status.status_id = customer_address.status_id   	
	   left join address 
	   ON address.address_id = customer_address.address_id 
	   left JOIN country 
	   ON address.country_id = country.country_id


SELECT cust_order.order_id, cust_order.order_date, cust_order.shipping_method_id,
	   shipping_method.method_name, order_history.history_id, order_history.status_id,
	   order_history.status_date,order_status.status_value
FROM   cust_order left JOIN order_history 
	   ON cust_order.order_id = order_history.order_id 
	   left JOIN order_status 
	   ON order_history.status_id = order_status.status_id 
	   left JOIN shipping_method 
	   ON cust_order.shipping_method_id = shipping_method.method_id 



SELECT book.book_id, cust_order.order_id, customer.customer_id, order_line.price, shipping_method.cost
FROM   book left JOIN order_line 
	   ON book.book_id = order_line.book_id 
	   left JOIN cust_order 
       ON order_line.order_id = cust_order.order_id 
	   left JOIN shipping_method 
	   ON shipping_method.method_id = cust_order.shipping_method_id 
	   left JOIN customer 
	   ON customer.customer_id = cust_order.customer_id