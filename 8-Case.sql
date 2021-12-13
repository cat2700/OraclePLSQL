--  A > Case statement :-
-- case face 1
select c.branch_no,c.cus_no,c.cus_nam_l,case length(c.cus_nam_l)  
                                                                        when 4 then '4 char'
                                                                          when 5 then '4 char'
                                                                            else 'NA'
                                                                              end numberoflength
  from customer_tab c 
  where c.branch_no=910004000 and c.cus_no=1134;

-- case face 2  >> its better
select c.branch_no,c.cus_no,c.cus_nam_l,case   
                                                                        when length(c.cus_nam_l) = 4 then '4 char'
                                                                          when length(c.cus_nam_l)=5 then '4 char'
                                                                            else 'NA'
                                                                              end numberoflength
  from customer_tab c 
  where c.branch_no=910004000 and c.cus_no=1134;
  
  --- in block
  
  declare 
v_result varchar2(100);

begin
  
  select c.cus_nam_l into  v_result
  from customer_tab c 
  where c.branch_no=910004000 and c.cus_no=&v;
  
 case
        when length(v_result) between 10 and 15 then 
          dbms_output.put_line(' cate. A ');
           when length(v_result) between 16 and 20 then 
              dbms_output.put_line(' cate. B ');
              when length(v_result) between 20 and 25 then 
                 dbms_output.put_line(' cate. C ');
                else 
                   dbms_output.put_line(' cate. Z ');
                  end case; -- << end it
  

end;

--  -===================
--  B > Case Expression :-

declare 
v_result varchar2(100);
v_length varchar2(100);
begin
  
  select c.cus_nam_l into  v_result
  from customer_tab c 
  where c.branch_no=910004000 and c.cus_no=&v;
  
  v_length := case
                              when length(v_result) between 10 and 15 then ' cate. A '
                                 when length(v_result) between 16 and 20 then ' cate. B '
                                    when length(v_result) between 20 and 25 then ' cate. C '
                                      else 'cat Z'
                                        end;
  
  dbms_output.put_line(v_length);
end;

-
