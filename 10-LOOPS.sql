--===============
-- LOOPS
--===============
-- > A : Basic Loop

DECLARE
v_c  number :=1134;
c_re varchar2(100) ;
BEGIN
  
  LOOP   
         select c.cus_nam_l into c_re from customer_tab c where c.branch_no=910004000 and c.cus_no=v_c;
         dbms_output.put_line(c_re);
         v_c := v_c + 1;
         EXIT WHEN v_c>1140;
  END LOOP;

END;

--=======================
-- > B : WHILE LOOP

DECLARE
v_c  number :=1134;
c_re varchar2(100) ;
BEGIN
  WHILE v_c <= 1140
  LOOP   
         select c.cus_nam_l into c_re from customer_tab c where c.branch_no=910004000 and c.cus_no=v_c;
         dbms_output.put_line(c_re);
         v_c := v_c + 1;

  END LOOP;

END;

--=======================
-- > C : FOR LOOP

begin

  for i in 1..9
    loop
      dbms_output.put_line(i);
     end loop;
     ---//\\
  for i in reverse 1..9
    loop
      dbms_output.put_line(i);
     end loop;
     
end;
     --================
begin
  for x in 1..10
  loop
        exit when x>5;
          dbms_output.put_line(x*10);
  end loop;
end;

     --================
begin
  <<loop_A>>
  for x in 1..10
  loop
        exit loop_A when x>5;
          dbms_output.put_line(x*10);
  end loop;
end;
----=================================
begin
  <<loop_A>>
  for x in 1..10
    loop
          continue when x>5;
            dbms_output.put_line(x);
    end loop;
end;

