select * from sales

create table report_table(
	product_id int primary key,
	total_sales int,
	total_profit int
)

select * from report_table

create or replace function update_report_table()
returns trigger AS $$
declare
	total_sales int;
	total_profit int;
begin 
	select sum(sales), sum(profit) into total_sales, total_profit
	from sales
	where product_id = NEW.product_id;
	if not found then
		insert into report_table (product_id, total_sales, total_profit)
        values (NEW.product_id, total_Sales, total_Profit);
	end if;
	return new;
end;
$$ LANGUAGE plpgsql

CREATE TRIGGER update_report_on_insert
AFTER INSERT ON sales
FOR EACH ROW
EXECUTE FUNCTION update_Report_Table()

insert into sales(order_line, order_id, order_date, ship_date, ship_mode, customer_id, product_id, sales, quantity, discount, profit)
	values(9997, 'CA-2016-152156', '2024-08-19', '2024-08-26', 'Standard Class', 'CG-12520', 'OFF-PA-10002365', 150.50, 2, 1, 250.50)

select * from sales

select * from report_table