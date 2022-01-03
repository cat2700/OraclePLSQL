--ex:
create or replace FUNCTION get_branch
(cus_id NUMBER)
IS
v_br NUMBER;
BEGIN
	select branch_no into v_br
	from customer_tab
	where cus_no=cus_id;
	
	RETURN v_br;

end;