/*
  > SQLCODE : áØÈÇÚÉ ÑÞã ÇáÇíÑæÑ
  > SQLERRM : áØÈÇÚÉ æÕÝ ÇáÇíÑæÑ
  
  
  ================================================================
    ACCESS_INTO_NULL
    CASE_NOT_FOUND
    COLLECTION_IS_NULL
    CURSOR_ALREADY_OPEN
    DUP_VAL_ON_INDEX
    INVALID_CURSOR
    INVALID_NUMBER
    LOGIN_DENIED
    NO_DATA_FOUND
    NOT_LOGGED_ON
    PROGRAM_ERROR
    ROWTYPE_MISMATCH
    SELF_IS_NULL
    STORAGE_ERROR
    SUBSCRIPT_BEYOND_COUNT
    SUBSCRIPT_OUTSIDE_LIMIT
    SYS_INVALID_ROWID
    TIMEOUT_ON_RESOURCE
    TOO_MANY_ROWS
    VALUE_ERROR
    ZERO_DIVIDE
  ================================================================
*/

-- case A >> original excep
DECLARE
var1 varchar2(200);
BEGIN
  select c.cus_nam_l into var1 from customer_tab c where c.branch_no||c.cus_no=&v;
  dbms_output.put_line('result : ' ||var1);
EXCEPTION
  when no_data_found then
    dbms_output.put_line('data not found');
  when too_many_rows then
    dbms_output.put_line('retrive more one row');    
  when others then
    dbms_output.put_line(SQLCODE);     
    dbms_output.put_line(SQLERRM);   
END;

--================
-- CASE B >> dont exite loop

DECLARE
var1 varchar2(200);
BEGIN
  
  FOR I IN 102..200
    LOOP
           BEGIN
             
                     select c.cus_nam_l into var1 from customer_tab c where c.branch_no =910004000 AND c.cus_no=I;
                    dbms_output.put_line('result : ' ||var1);
                    
                    EXCEPTION
                          when no_data_found then
                            dbms_output.put_line('data not found');
                          when too_many_rows then
                            dbms_output.put_line('retrive more one row');    
                          when others then
                           null;     
           END;    
  END LOOP;
  

END;

---===========================================
-- CASE C >> Raise Exce
declare
raiseExc exception;
begin
  update customer_tab set cus_nam_l ='' where branch_no=910004000 and cus_no=5555555;
  if sql%notfound then
    raise raiseExc;
  end if; 
  commit;
  exception
    when raiseExc then
      dbms_output.put_line(SQLCODE);  --> 1   
      dbms_output.put_line(SQLERRM);  --> User-Defined Exception
end;

--> OR
begin
  update customer_tab set cus_nam_l ='' where branch_no=910004000 and cus_no=5555555;
  if sql%notfound then
    raise_application_error(-20000,'Not found rows to update'); --> between 20000 to 20999
  end if; 
  commit;
end;
