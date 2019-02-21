PROC IMPORT OUT= WORK.data 
            DATAFILE= "\\Client\E$\Paper 3-NAE Data\Final Data Sets\comp
osite_price_input.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

proc import out=work.data
datafile= 'e:/paper 3-NAE Data/Final Data Sets/composite_price_input.csv'
dbms=csv replace;
getnames=yes;
datarow=2;
run;

data data; set work.data;

*Take the log of quantities of CNV and RWA breast. These will be the independent variables;
lnQcnv=log(q1);
lnQrwa=log(q5);

*Take the log of prices of CNV and RWA breast;
lnPCNV=log(p1);
lnPRWA=log(p5);

lnPCNV_Comp=log(cnv_composite);
lnPRWA_Comp=log(rwa_composite);

*Take log differenes of prices of CNV and RWA breast;
dlnPCNV=log(p1/lag1(p1));
dlnPRWA=log(p5/lag1(p5));

dlnPCNV_Comp=log(lnPCNV_Comp/lag1(lnPCNV_Comp));
dlnPRWA_Comp=log(lnPRWA_Comp/lag1(lnPRWA_Comp));


*Take the log difference of the quantities of RWA and CNV breast;
dlnQCNV=log(q1/lag1(q1));
dlnQRWA=log(q5/lag1(q5));

*Take log differerence of the price of corn;
dlnCorn=log(corn_p/lag1(corn_p));

lnCorn=log(corn_P);

id=_N_;

quant_CNV=q1+q2+q3+q4;
quant_RWA=q5+q6+q7+q8;

lnquant_CNV=log(quant_CNV);
lnquant_RWA=log(quant_RWA);

dlnquant_CNV=log(lnquant_CNV/lag1(lnquant_CNV));
dlnquant_RWA=log(lnquant_RWA/lag1(lnquant_RWA));

id=_N_;
if id=1 then delete;
run;

*Run OLS to get cross and own price elasticities. There are two different regressions for CNV and RWA;

ods pdf file='e:\paper 3-NAE Data\SAS Results\FEB26.PDF';
proc reg data=work.data;
model lnQCNV= lncorn lnPCNV lnPRWA dlnQCNV dlnQRWA  ;
run;

proc reg data=work.data;
model lnQCNV= dlncorn dlnPCNV_COMP dlnPRWA_COMP dlnQCNV dlnQRWA ;
run;

proc reg data=work.data;
model lnQRWA= lncorn lnPCNV lnPRWA dlnQCNV dlnQRWA id ;
run;

proc reg data=work.data;
model lnQrwa= dlncorn dlnPCNV_COMP dlnPRWA_COMP dlnQCNV dlnQRWA ;
run;

proc quantreg data=work.data algorithm=interior ci=resampling;
title 'Quantile .25';
model lnQCNV= lncorn lnPCNV lnPRWA dlnQCNV dlnQRWA id
	/ diagnostics quantile=.25;
	test_lnPCNV: test dlnPCNV / wald lr;
	test_lnPRWA: test dlnPRWA/ wald lr;
run;

proc quantreg data=work.data algorithm=interior ci=resampling;
title 'Quantile .5';
model lnQCNV= lncorn lnPCNV lnPRWA dlnQCNV dlnQRWA id
	/ diagnostics quantile=.5;
	test_lnPCNV: test lnPCNV / wald lr;
	test_lnPRWA: test lnPRWA/ wald lr;
run;

proc quantreg data=work.data algorithm=interior ci=resampling;
title 'Quantile .75';
model lnQCNV= lncorn lnPCNV lnPRWA dlnQCNV dlnQRWA id
	/ diagnostics quantile=.75;
	test_lnPCNV: test lnPCNV / wald lr;
	test_lnPRWA: test lnPRWA/ wald lr;
run;

proc quantreg data=work.data algorithm=interior ci=resampling;
title 'Quantile .9';
model lnQCNV= lncorn lnPCNV lnPRWA dlnQCNV dlnQRWA id
	/ diagnostics quantile=.9;
	test_lnPCNV: test lnPCNV / wald lr;
	test_lnPRWA: test lnPRWA/ wald lr;
run;

ods pdf file='e:\paper 3-NAE Data\SAS Results\RWA.MAR16.PDF';
proc quantreg data=work.data algorithm=interior ci=resampling;
title 'Quantile .25';
model lnQrwa= lncorn lnPCNV lnPRWA dlnQRWA id
	/ diagnostics quantile=.25;
	test_lnPCNV: test lnPCNV / wald lr;
	test_lnPRWA: test lnPRWA/ wald lr;
run;

proc quantreg data=work.data algorithm=interior ci=resampling;
title 'Quantile .5';
model lnQrwa= lncorn lnPCNV lnPRWA dlnQRWA id 
	/ diagnostics quantile=.5;
	test_lnPCNV: test lnPCNV / wald lr;
	test_lnPRWA: test lnPRWA/ wald lr;
run;

proc quantreg data=work.data algorithm=interior ci=resampling;
title 'Quantile .75';
model lnqrwa= lncorn lnPCNV lnPRWA dlnQRWA id
	/ diagnostics quantile=.75;
	test_lnPCNV: test lnPCNV / wald lr;
	test_lnPRWA: test lnPRWA/ wald lr;
run;

proc quantreg data=work.data algorithm=interior ci=resampling;
title 'Quantile .9';
model lnQrwa= lncorn lnPCNV lnPRWA dlnQRWA id
	/ diagnostics quantile=.9;
	test_lnPCNV: test lnPCNV / wald lr;
	test_lnPRWA: test lnPRWA/ wald lr;
run;

ods pdf close;

proc means data=work.data;
var p5 gap gap_breast gap_thigh gap_leg gap_wing ;
run;

proc iml;

*CNV Breast (nx)=-0.0253      CNV-RWA (nxy)=0.00857
 RWA Breast (ny)=-0.0658      RWA-CNV (nyx)=0.02478;

*CNV Breast(ex): 0.54011         CNV Quantity to RWA Price (exy):-0.52025
 RWA Breast(ey): 0.18396         RWA Quantity to CNV Price (eyx):-0.59575;

a= {-0.0253 0.00857 -1 0 0,
    0.02478 -0.0658 0 -1 0,
	0.54011 0 -1 0 0,
	0 0.18396 0 -1 0,
	0 0 .6 .4 -1};

c= {0,
    -0.0329,
	0,
	0,
	0};

relativechanges=inv(a)*c;
print relativechanges;

quit;

   
