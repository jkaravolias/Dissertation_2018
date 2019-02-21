PROC IMPORT OUT = WORK.NielAgri
            DATAFILE = "\\Client\H$\Desktop\Nielsen_AgriStat.csv"
            DBMS = CSV REPLACE;
     GETNAMES = YES;
     DATAROW = 2;
RUN;

proc import out =w ork.nielagri
datafile = "e:/paper 3-NAE Data/Final Data Sets/Nielsen_AgriStat.csv"
dbms = csv replace;
getnames = yes;
datarow = 2;
run;

data nielagri; set work.nielagri;

lnq1_w = log(q1_w);
lnq1_r = log(q1_r);

lnq5_w = log(q5_w);
lnq5_r = log(q5_r);

lnp1_w = log(p1_w);
lnp1_r = log(p1_r);

lnp5_w = log(p5_w);
lnp5_r = log(p5_r);

run;

***********************************************************************
****************************Estimate tau*******************************
***********************************************************************;

*Make wholesale quantities the dependent variable and retail quantities the independent variable. Consumer
demand drives wholesale decisions  so retail quanitites will determine wholesale quantities;

proc reg data = nielagri;
model lnq1_W =l nq1_R lnq5_R;
run;



proc reg data = nielagri;
model lnq5_W = lnq1_R lnq5_R;
run;

*********************************************************
************Estimating derived retail supply*************
*********************************************************;

*Retail supply is derived from wholesale supply. To estimate derived retail supply as Ejs=Efs(ln(Pf)/ln(Pjs) where Ejs is the derived supply, Efs is the farm(primary) suppy elasticity,
and ln(Pf)/ln(Pjs) is the percentage change in farm price for a 1% change in derived supply price at level j. Retail supply prices are dependent on wholesale prices.;

proc reg data = nielagri;
model lnp1_r = lnp1_w;
run;


proc reg data = nielagri;
model lnp5_r = lnp5_w;
run;

**************************************************************
**************Estimating derived wholesale demand*************
**************************************************************;

*Wholesale demand is derived from retail demand. This can be estimated using retail demand elasticities and pecrentage changes in retail price for a 1% change in derived demand price.
Since we have the AgriStat data this can be estimated directly, however we can also estimate it to see how close the estimate and the calculated elasticity are.;

proc reg data = nielagri;
model lnp1_w = l np1_r lnp5_r;
run;

proc reg data = nielagri;
model lnp5_w = l np5_r lnp1_r;
run;

*Estimates for CNV are 1.37371 and RWA is .34483 in the regression. Calculated whole
