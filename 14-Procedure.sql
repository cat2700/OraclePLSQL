--===========================
-- ways to call procedure ::
-- A: execute procedure_name(par1,par2..);
-- B: Begin
--            procedure_name(par1,par2..);
--    End;
--===========================
create or replace procedure my_proc_get
(parm_branch in number,parm_cusno in number) 
is
begin
  update customer_tab set cus_nam_f=''
         where branch_no=parm_branch and cus_no=parm_cusno;
  dbms_output.put_line('Done');
  exception
    when others then
        dbms_output.put_line('Error');
end;

--> to call it
execute my_proc_get (910004000,1134); 
--or
begin
  my_proc_get (&v,&k);
end;
--> to get it 
select * from user_objects where object_name='MY_PROC_GET';
select * from user_source where name='MY_PROC_GET' order by line;
drop procedure MY_PROC_GET;
--====================================================

create or replace procedure get_cus_data
(p_cusID number,
 p_cusname out customer_tab.cus_nam_l%type,
 p_cusadd out customer_tab.cus_addr_l%type)
 is
 begin
   select cus_nam_l,cus_addr_l into p_cusname,p_cusadd  
          from customer_tab 
          where branch_no||cus_no=p_cusID;
   exception
    when others then
        dbms_output.put_line(sqlerrm || ' ' || sqlcode);
 end;
 -->> call it
 declare
 var1 varchar2(100);
 var2 varchar2(100);
 begin
  get_cus_data (&v,var1,var2);
  dbms_output.put_line(var1 || ' ' || var2);
end;
-->> or execute with bind variables
variable b_nam varchar2(100);
variable b_add varchar2(100);
execute get_cus_data(9100040001134,:b_nam,:b_add);
print b_nam b_add ;

--===============================
create or replace procedure edit_tel
(tel in out varchar2)
is
begin
  tel:=substr(tel,1,3)||'('||substr(tel,4,2)||')'||substr(tel,6);
end;
--> call it
declare
 va1 varchar2(100):=&v;
begin
  edit_tel(va1);
  dbms_output.put_line(va1);
end;
--> by execute with bind variables
variable v1 varchar2(100);
execute :v1:='7699902244';
execute edit_tel(:v1);
print v1;
--=============================================
--==== Named Execute
create or replace procedure get_cus_data
(p_branch number default 919001000,
 p_cusid customer_tab.cus_no%type,
 p_cusname out customer_tab.cus_nam_l%type)
 is
 begin
   select cus_nam_l into p_cusname  
          from customer_tab 
          where branch_no=p_branch and cus_no=p_cusid;
   exception
    when others then
        dbms_output.put_line(sqlerrm || ' ' || sqlcode);
 end;
 --> by execute with bind variables
 variable v1 varchar2(100);
 execute get_cus_data(p_cusid=>11411,p_cusname=>:v1);
 print v1;
 --> call it
 declare
 v1 varchar2(100);
 begin
   get_cus_data(p_cusid=>11411,p_cusname=>v1);
   dbms_output.put_line(v1);
 end;
 --=============================================

