declare
    v_nam customer_tab.cus_nam_l%type; --> VARCHAR2(60 BYTE)
    v_salary number :=10;
    v_bonus v_salary%type;
begin
    dbms_output.put_line(v_bonus); -->null
    
end;