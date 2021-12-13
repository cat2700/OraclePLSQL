-- single line comment
/*
multi line comment
*/
declare
v_nam customer_tab.cus_nam_l%type;
v_addr customer_tab.cus_addr_l%type;
"Branch No" varchar2(9); -- not reommended
v_date date :=sysdate;
v_mount number :=5000;

begin
select c.cus_nam_l,c.cus_addr_l,c.branch_no into v_nam ,v_addr ,"Branch No"  from customer_tab c where c.branch_no=910004030 and c.cus_no=5877 ;
DBMS_OUTPUT.put_line("Branch No");
DBMS_OUTPUT.put_line('the customer name is : ' || v_nam);
DBMS_OUTPUT.put_line(length(v_nam));
DBMS_OUTPUT.put_line(v_date);
DBMS_OUTPUT.put_line(add_months(v_date,3));
DBMS_OUTPUT.put_line(to_char(v_date,'dd/mm/yyyy hh:mi:ss am'));
DBMS_OUTPUT.put_line(to_char(v_mount,'$9,999'));
end;

--=========================================
-- Global and local variables
--==================================
DECLARE
v_global VARCHAR2(10) := 'G'; -- Global Var.
v_salary NUMBER := 1000;
begin

    DECLARE
    v_local VARCHAR2(10) := 'L'; -- Local Var.
    v_salary NUMBER := 500;
    begin
        DBMS_OUTPUT.put_line(v_global);
        DBMS_OUTPUT.put_line(v_local);
        DBMS_OUTPUT.put_line(v_salary); -->500
    end;    
DBMS_OUTPUT.put_line(v_global);
--DBMS_OUTPUT.put_line(v_local); -- can't scop to local var.
DBMS_OUTPUT.put_line(v_salary);
end;


BEGIN <<Xz>>
DECLARE
v_global VARCHAR2(10) := 'G'; -- Global Var.
v_salary NUMBER := 1000;
begin

    DECLARE
    v_local VARCHAR2(10) := 'L'; -- Local Var.
    v_salary NUMBER := 500;
    begin
        DBMS_OUTPUT.put_line(v_global);
        DBMS_OUTPUT.put_line(v_local);
        DBMS_OUTPUT.put_line(v_salary); --> 500
        DBMS_OUTPUT.put_line(Xz.v_salary); --> 1000
    end;    
DBMS_OUTPUT.put_line(v_global);
--DBMS_OUTPUT.put_line(v_local); -- can't scop to local var.
DBMS_OUTPUT.put_line(v_salary); --> 1000
end;
end Xz;