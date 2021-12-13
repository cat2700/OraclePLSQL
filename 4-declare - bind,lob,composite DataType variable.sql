
variable b_nam varchar2(100); --bind
begin
    select c.cus_nam_l into :b_nam from customer_tab c where c.branch_no =910004030 and c.cus_no=5658;
end;
/

print b_nam

-------------------------- or

set autoprint on
begin
    select c.cus_nam_l into :b_nam from customer_tab c where c.branch_no =910004030 and c.cus_no=5658;
end;