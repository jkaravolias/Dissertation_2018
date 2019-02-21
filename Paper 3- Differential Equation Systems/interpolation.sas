data qtrly;
set sashelp.citiqtr;
where date >= '1jan1990'd &
date < '1jan1992'd ;
keep date gdp gd;
run;

data monthly;
set sashelp.citimon;
where date >= '1jan1990'd &
date < '1jan1992'd ;
keep date ip lhur;
run;

proc expand data=qtrly out=temp from=qtr to=month;
convert gdp gd / observed=average;
id date;
run;

proc contents data=work.temp;
run;


*******************************************************
***************Wage quantity**************************
******************************************************;
PROC IMPORT out=work.wage
datafile = 'e:/paper 3-NAE Data/wage-sas.csv'
dbms=csv replace;
datarow=2;
run;

proc contents data=work.wage;
run;

data work.wage; set work.wage;
format date_of_observation yyqc6.;
run;

proc expand data=work.wage out=temp21 from=qtr to=month;
convert price / observed=average;
id date_of_observation;
run;

proc expand data=work.wage out=temp22 from=qtr to=month;
convert quantity/ observed=total;
id date_of_observation;
run;

data combined;
merge temp21 temp22;
by date_of_observation;
run;

proc export data=work.combined
outfile= 'e:/paper 3-NAE Data/monthly_wage.csv'
dbms=csv replace;
putnames=yes;
run;

*************************************************************************
**************Interpolate soy quantity to monthly values*****************
*************************************************************************;

PROC IMPORT out=work.soy
datafile = 'e:/paper 3-NAE Data/soy_quantity.csv'
dbms=csv replace;
datarow=2;
run;

data work.soy; set work.soy;
format date year4.;
run;

proc contents data=work.soy;
run;

proc expand data=work.soy out=temp6 from=year to=month;
convert quantity /observed=total;
run;

proc export data=work.temp6
outfile= 'e:/paper 3-NAE Data/soy_quant_montly.csv'
dbms=csv replace;
putnames=yes;
run;


***********************************************************************
*************Interpolate animal protein to monthly value***************
***********************************************************************;

proc import out=work.AP
datafile= 'e:/paper 3-NAE Data/animal protein_quantity.csv'
dbms=csv replace;
datarow=2;
run;

data work.AP; set work.AP;
format date year4.;
run;

proc contents data=work.AP;
run;

proc expand data=work.AP out=temp5 from=year to=month;
convert quantity/ observed=total;
run;

proc export data=work.temp5
outfile= 'e:/paper 3-NAE Data/AP_quant_monthly.csv'
dbms=csv replace;
putnames=yes;
run;
