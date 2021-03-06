*****************************************
**********Create SAS Library*************
*****************************************;
libname NAE 'e:\Paper 3-NAE data';


proc import out=NAE.price_quant
datafile='e:/paper 3-NAE Data/price_quant.csv'
dbms=csv replace;
datarow=2;
run;

*Outputs-p's and q's
Product 1: CNV BREAST      Product 5: RWA Breast
Product 2: CNV THIGH       Product 6: RWA Thigh
Product 3: CNV Leg         Product 7: RWA Leg
Product 4: CNV Wing        Product 8: RWA Wing
Product 9: CNV Whole       Product 10:RWA Whole Chicken;


*About 55-60% of the bird is prime meat. The remainder is bones, giblets, offal/organs. About 23.225% breast, 14.24389% thigh, 8.91% drumstick and 7.63% wings making up about 54%
of live weight as prime meat. The numbers are avearges of males, females and as hatched for different weights. 

*Avearge market weight is from the National Chicken Council. 
2013: 5.92 lbs
2014: 6.01 lbs
2015: 6.12 lbs
2016: 6.16 lbs
2017: 6.18 lbs;


proc sql;

*Add variable for the average weight of each year;
alter table nae.price_quant
add average num;

update nae.price_quant
set average=
case when year contains '13' then 5.92
when year contains '14' then 6.01
when year contains '15' then 6.12
when year contains '16' then 6.16
when year contains '17' then 6.18
else 0
end;

*Add meat variable as the amount of the bird that is prime meat;
alter table nae.price_quant
add meat num;

update nae.price_quant
set meat= average*.55;

*Add variables to show the percentage of prime meat that each cut makes up;
alter table nae.price_quant
add breast num;

alter table nae.price_quant
add thigh num;

alter table nae.price_quant
add leg num;

alter table nae.price_quant
add wing num;

update nae.price_quant
set breast=average*.23225;

update nae.price_quant
set thigh=average*.1424;

update nae.price_quant
set leg=average*.0891;

update nae.price_quant
set wing=average*.0763;

*Change prices from cents/pound to dollar/pound;
update nae.price_quant
set p1=p1/100;
update nae.price_quant
set p2=p2/100;
update nae.price_quant
set p3=p3/100;
update nae.price_quant
set p4=p4/100;
update nae.price_quant
set p5=p5/100;
update nae.price_quant
set p6=p6/100;
update nae.price_quant
set p7=p7/100;
update nae.price_quant
set p8=p8/100;
update nae.price_quant
set p9=p9/100;
update nae.price_quant
set p10=p10/100;

*Calculate the price the farmer gets for each part;
******************************************************************
************************Conventional******************************
******************************************************************;

alter table nae.price_quant
add DOL_CNVBreast num;
alter table nae.price_quant
add DOL_CNVThigh num;
alter table nae.price_quant
add DOL_CNVLeg num;
alter table nae.price_quant
add DOL_CNVWing num;

update nae.price_quant
set DOL_CNVBreast=breast*p1;
update nae.price_quant
set DOL_CNVTHIGH=thigh*p2;
update nae.price_quant
set DOL_CNVLEG=LEG*p3;
update nae.price_quant
set DOL_CNVWING=wing*p4;

*Create composite chicken price by adding up all DOL amounts;
alter table nae.price_quant
add CNV_Composite num;

update nae.price_quant
set CNV_Composite=DOL_CNVBreast + DOL_CNVThigh + DOL_CNVLeg + DOL_CNVWing;


******************************************************************
*****************************RWA**********************************
******************************************************************;

alter table nae.price_quant
add DOL_RWABreast num;
alter table nae.price_quant
add DOL_RWAThigh num;
alter table nae.price_quant
add DOL_RWALeg num;
alter table nae.price_quant
add DOL_RWAWing num;

update nae.price_quant
set DOL_RWABreast=breast*p5;
update nae.price_quant
set DOL_RWATHIGH=thigh*p6;
update nae.price_quant
set DOL_RWALEG=LEG*p7;
update nae.price_quant
set DOL_RWAWING=wing*p8;

*Create composite chicken price by adding up all DOL amounts;
alter table nae.price_quant
add RWA_Composite num;

update nae.price_quant
set RWA_Composite=DOL_RWABreast + DOL_RWAThigh + DOL_RWALeg + DOL_RWAWing;

*Calcuate the difference between RWA and CNV chicken;
alter table nae.price_quant
add GAP num;

update nae.price_quant
set GAP=RWA_Composite-CNV_Composite;

*Calculate the difference in cuts between RWA and CNV chicken;
alter table nae.price_quant
add GAP_breast num;
alter table nae.price_quant
add GAP_thigh num;
alter table nae.price_quant
add GAP_leg num;
alter table nae.price_quant
add GAP_wing num;

update nae.price_quant
set GAP_breast=DOL_RWAbreast-DOL_CNVbreast;
update nae.price_quant
set GAP_thigh=DOL_RWAthigh-DOL_CNVthigh;
update nae.price_quant
set GAP_leg=DOL_RWAleg-DOL_CNVleg;
update nae.price_quant
set GAP_wing=DOL_RWAwing-DOL_CNVwing;

alter table nae.price_quant
add GAP2_wing num;

alter table nae.price_quant
drop GAP2_wing;

quit; 

proc export data=nae.price_quant
outfile= 'e:\paper 3-NAE Data\Final Data Sets\composite_price.csv'
dbms=csv replace;
putnames=yes;
run;


proc means data=nae.price_quant;
var  RWA_composite CNV_composite GAP GAP_breast GAP_thigh GAP_leg GAP_wing;
run;
