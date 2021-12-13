declare
v_1 varchar2(7);
v_2 varchar2(7);
begin
  
--- error case
    if v_1 = v_2 then
       dbms_output.put_line('Welcome 1'); --> will not print
     end if;
       
 --- > right case
     if nvl(v_1,0) = nvl(v_2,0) then
       dbms_output.put_line('Welcome 2'); --> will print
     end if;

end;
