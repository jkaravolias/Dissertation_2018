proc import out=work.data
datafile= 'e:/paper 3-NAE Data/Final Data Sets/composite_price_input.csv'
dbms=csv replace;
getnames=yes;
datarow=2;
run;

data data; set work.data;

*Add all chicken quantities together for total quantity;
total_q=q1+q2+q3+q4+q5+q6+q7+q8;

*Add all CNV chicken;
total_CNV=q1+q2+q3+q4;

*Add all RWA chicken;
total_RWA=q5+q6+q7+q8;

*Create weighted price;
weight_price=(total_CNV/total_q)*CNV_composite +(total_RWA/total_q)*RWA_composite;


*Take log of total_quantity;
lntotal_q=log(total_q);

*Take log difference of total quantity;
dlntotal_q=log(total_q/lag1(total_q));

*Take log of weight price;
lnweight_p=log(weight_price);

*take log difference of weighted price;
dlnweight_p=log(weight_price/lag1(weight_price));

*********************************************************************************
****************Do the same analysis as above but just for breast****************
*********************************************************************************;

*Add CNV and RWA breast;
total_breast=q1+q5;

*Create weighted breast price;
weight_breast=(q1/total_breast)*p1+(q5/total_breast)*p5;

*Take log of total_breast;
lntotal_breast=log(total_breast);

*Take log difference of quantity;
dlntotal_breast=log(total_breast/lag1(total_breast));

*Take log of weighted price;
lnweight_breast=log(weight_breast);

*Take Log difference of weighted price;
dlnweight_breast=log(weight_breast/lag1(weight_breast));

********************************************
****************Inputs**********************
********************************************;

*Take log differerence of the price of corn;
dlnCorn=log(corn_p/lag1(corn_p));

lnCorn=log(corn_P);

id=_n_;
if id=1 then delete; 


run;

*We want a positive price coefficient. As the price of chicken goes up, the quantity supplied should go up;
proc reg data=work.data;
model lntotal_q= lncorn lnweight_p id;
run;

*In the previous regression, the r-squared is .88 and price coefficient is significant, but negative;

proc reg data=work.data;
model lntotal_q= dlncorn dlnweight_p id;
run;
*R-Square is still high, price is now positive but insignificant (p-value=0.6620);

proc reg data=work.data;
model lntotal_q= dlncorn dlnweight_p dlntotal_q id;
run;
*R-sqaured is still high, but price is still positivie and insignificant (p-value=0.9012);

proc reg data=work.data;
model lntotal_q= lncorn lnweight_p dlntotal_q id;
run;
*R-squared is .9286 but price is negative and significant;

***************************************************************
******************************Just Breast**********************
***************************************************************;

proc reg data=work.data;
model lntotal_breast=lncorn lnweight_breast id;
run;
*R-squared is .75, but price coffienceint is negative and significant;

proc reg data=work.data;
model lntotal_breast=dlncorn dlnweight_breast id;
run;
*R-squared is .6345, but price is positive and insignificant (p-value=.6912);

proc reg data=work.data;
model lntotal_breast=dlncorn dlnweight_breast dlntotal_breast id;
run;
*R-squared is .6688, but price is positive and insignificant (p-value=.2373);

proc reg data=work.data;
model lntotal_breast=lncorn lnweight_breast dlntotal_breast id;
run;
*r-squared is .76 but price is negative and significant;

