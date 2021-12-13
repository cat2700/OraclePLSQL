declare -- optional
var1 NUMBER DEFAULT 5;
var2 VARCHAR2(100) DEFAULT 'welcome to haitham';
v_dat1 date;
v_dat2 date := SYSDATE;
v_no number :=10;
v_nam varchar2(100) not null :='cat';
begin
    DBMS_OUTPUT.PUT_LINE('welcome here');
    DBMS_OUTPUT.PUT_LINE(var1 || ' ' || var2);
    DBMS_OUTPUT.PUT_LINE(v_dat2 + 10);
    v_dat1 := '10-10-2020';
    DBMS_OUTPUT.PUT_LINE(v_dat1);
end;

