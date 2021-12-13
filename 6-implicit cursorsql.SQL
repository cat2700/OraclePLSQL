--=================
-- Implicit Cursors ::
-- [SQL%FOUND,SQL%NOTFOUND,SQL%ROWCOUNT]
--=================
declare
v_rows customer_tab.cus_nam_l%type;

begin
    select cus_nam_l into v_rows from customer_tab where branch_no=910004000 and cus_no=1134;

    --dbms_output.put_line(SQL%NOTFOUND);
    dbms_output.put_line(sql%rowcount || ' > '|| v_rows);
end;