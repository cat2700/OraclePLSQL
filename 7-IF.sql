DECLARE
v_num number :=&v;
BEGIN
    if v_num >10 then
        dbms_output.put_line('A');
    elsif v_num > 50 then
        dbms_output.put_line('B');
    else
        dbms_output.put_line('C');
    end if;
END;