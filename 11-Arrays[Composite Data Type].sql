-- A:: Record :- just one row

declare

    type t_cus is record(
    r1_bran customer_tab.branch_no%type,
    r2_no customer_tab.cus_no%type,
    r3_nam customer_tab.cus_nam_l%type
    );

    var_cus t_cus;
    
    --- >> OR ·Ê Â‰«Œœ ﬂ· «·ÕﬁÊ·
    /*
        var_cus  customer_tab%rowtype;
    */

begin
  
    select c.branch_no,c.cus_no,c.cus_nam_l  into var_cus
    from customer_tab c where c.branch_no=910004000 and c.cus_no=1134 ;

    dbms_output.put_line(var_cus.r1_bran || var_cus.r2_no || var_cus.r3_nam);
end;

-- B :: INDEX BY :- multi row  { index , Col/s }

--EX:1

DECLARE
   TYPE type_ind IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER; --   type type_ind is table of number index by varchar2(100);
   var_ind type_ind;
BEGIN
  
  var_ind(4):='ahmed';
  var_ind(9):='ibrahim';
  var_ind(1):='samir';
  var_ind(6):='mohamed';
  var_ind(10):='maged';
  var_ind(7):='haitham';  
  
  dbms_output.put_line(var_ind(10) || '-----------------');
  FOR I IN 1..10
  LOOP
    IF var_ind.EXISTS(I) THEN
        dbms_output.put_line(var_ind(I));
    END IF;
  END LOOP;
  
  dbms_output.put_line('_--------_');
  dbms_output.put_line(var_ind.count);
  
  dbms_output.put_line('_--------_');
  dbms_output.put_line(var_ind.first);
   
  dbms_output.put_line('_--------_');
  dbms_output.put_line(var_ind.last);
  
  dbms_output.put_line('_--------_');
  dbms_output.put_line(var_ind.next(4));
  
  dbms_output.put_line('_--------_');
  dbms_output.put_line(var_ind.prior(4));
  
  dbms_output.put_line('_--------_');
  var_ind.delete(1);
  
  FOR I IN 1..10
  LOOP
    IF var_ind.EXISTS(I) THEN
        dbms_output.put_line(var_ind(I));
    END IF;
  END LOOP;
   
   
  dbms_output.put_line('_--------_');
  var_ind.delete(9,10);
  
  FOR I IN 1..10
  LOOP
    IF var_ind.EXISTS(I) THEN
        dbms_output.put_line(var_ind(I));
    END IF;
  END LOOP;   

 dbms_output.put_line('_--------_');
  var_ind.delete();
  
  FOR I IN 1..10
  LOOP
    IF var_ind.EXISTS(I) THEN
        dbms_output.put_line(var_ind(I));
    END IF;
  END LOOP;   
 
 dbms_output.put_line('_--------_');
 
END;

--EX:2

declare
  type type_cust is table of customer_tab%rowtype index by pls_integer;
  var_cust type_cust ;
begin
  
  var_cust(1).branch_no:=910004000;
  var_cust(1).cus_no:=1134;
  var_cust(1).cus_nam_l:='haitham maged';
  
  var_cust(2).branch_no:=910004000;
  var_cust(2).cus_no:=2108;
  var_cust(2).cus_nam_l:='hiam elkot';  
  
    FOR i IN var_cust.first..var_cust.last
     LOOP
                       dbms_output.put_line(var_cust(i).branch_no ||' ' || var_cust(i).cus_no ||' ' || var_cust(i).cus_nam_l);
      END LOOP; 
  
end;
--EX:3
declare
  type type_cust is table of customer_tab%rowtype index by pls_integer;
  var_cust type_cust ;
  c number:=100;
begin 
  
  for x in 1..100
  loop
        select * into var_cust(x)  from customer_tab where cus_no=c and rownum=1;
        c := c + 1;
  end loop;
  
    FOR i IN var_cust.first..var_cust.last
     LOOP
            dbms_output.put_line(var_cust(i).branch_no ||' ' || var_cust(i).cus_no ||' ' || var_cust(i).cus_nam_l);
      END LOOP; 
  
end;

-- C :: NESTED TABEL :- multi row  { Col }

DECLARE

  type type_loc is table of varchar2(100);
  loc type_loc;

BEGIN
  
  loc := type_loc('A','B','C');

  loc.delete(2);

  loc(2) := 'X';

  loc.extend;

  loc(4):='Z';

  for i in loc.first..loc.last
    loop
      dbms_output.put_line(loc(i));
    end loop;

END;

-- D:: VARRAY :- multi row  { Col }
declare

  type TYPE_LOC is varray(3) of varchar2(100);
  LOC TYPE_LOC;

begin
  
  LOC := TYPE_LOC('A','B','C');

  LOC.trim(1);

  LOC(1) := 'X';

  LOC.extend;

  LOC(3):='Y';
  
  /*LOC.extend;

  LOC(4):='Z';*/

  for i in LOC.first..LOC.last
    loop
      DBMS_OUTPUT.PUT_LINE(LOC(i));
    end loop;

end;
