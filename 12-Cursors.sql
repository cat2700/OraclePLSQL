--- Cursors

-- Case A 
declare
   cursor cr_sample1 is
          select c.branch_no,c.cus_no,c.cus_nam_l from customer_tab c where c.branch_no=910004000 and c.cus_no in (1134,2108);
   var1 customer_tab%rowtype;
begin
          open cr_sample1;
               loop
                   fetch cr_sample1 into var1.branch_no,var1.cus_no,var1.cus_nam_l;
                   exit when cr_sample1%notfound;
                   dbms_output.put_line(var1.branch_no || ' ' || var1.cus_no || ' ' || var1.cus_nam_l  );
               end loop;
          close cr_sample1;
end;

-- Case B 
declare
   cursor cr_sample1 is
          select c.branch_no,c.cus_no,c.cus_nam_l from customer_tab c where c.branch_no=910004000 and c.cus_no in (1134,2108);
   var1 cr_sample1%rowtype; -- new
begin
          open cr_sample1;
               loop
                   fetch cr_sample1 into var1; --new
                   exit when cr_sample1%notfound;
                   dbms_output.put_line(var1.branch_no || ' ' || var1.cus_no || ' ' || var1.cus_nam_l  );
               end loop;
          close cr_sample1;
end;

-- Case C  >> vip
declare
   cursor cr_sample1 is
          select c.branch_no,c.cus_no,c.cus_nam_l from customer_tab c where c.branch_no=910004000 and c.cus_no in (1134,2108);
begin 
               for i in cr_sample1
               loop
                   dbms_output.put_line(i.branch_no || ' ' || i.cus_no || ' ' || i.cus_nam_l  );
               end loop;
end;

-- Case D  >> vip
declare
begin 
               for i in (select c.branch_no,c.cus_no,c.cus_nam_l from customer_tab c where c.branch_no=910004000 and c.cus_no in (1134,2108))
               loop
                   dbms_output.put_line(i.branch_no || ' ' || i.cus_no || ' ' || i.cus_nam_l  );
               end loop;
end;

-- Case C2  >> vip > with par
declare
   cursor cr_sample1 (par1 number,par2 varchar2) is
          select * from customer_tab c where c.branch_no=par1 and c.cus_no = par2;
begin 
               for i in cr_sample1(910004000,'1134')
               loop
                   dbms_output.put_line(i.branch_no || ' ' || i.cus_no || ' ' || i.cus_nam_l  );
               end loop;
end;

