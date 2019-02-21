libname NAE 'e:\paper 3-NAE data';

*Using only the breast and no inputs run an OLS regression to get own- and cross- price elasticity;
*Take the log of the prices for CNV and RWA breast, but also take the log difference of the quantity of CNV and RWA breast. Using the log difference is quantities as an independent variable
will act like the typical Nerlovian supply model. The quantity in the period before will impact the quantity in the current period;

PROC IMPORT OUT= WORK.price_quant 
            DATAFILE= "e:\paper 3-NAE Data\Final Data Sets\composite_price.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

data price_quant; set price_quant;

*Take the log of quantities of CNV and RWA breast. These will be the independent variables;
lnQcnv=log(q1);
lnQrwa=log(q5);

*Take the log of prices of CNV and RWA breast;
lnPCNV=log(p1);
lnPRWA=log(p5);

*Take log differenes of prices of CNV and RWA breast;
dlnPCNV=log(p1/lag1(p1));
dlnPRWA=log(p5/lag1(p5));

*Take the log difference of the quantities of RWA and CNV breast;
dlnQCNV=log(q1/lag1(q1));
dlnQRWA=log(q5/lag1(q5));

id=_N_;

run;

ods pdf file="e:\paper 3-NAE Data\SAS Results\FEB14.pdf" ;

proc reg data=work.price_quant;
model lnQCNV=lnPCNV lnPRWA dlnQCNV lnQRWA;
run;

proc reg data=work.price_quant;
model lnQRWA=lnPCNV lnPRWA dlnQRWA lnQCNV;
run;

*This model was not working, but below check IML code;
*Run a proc model to estimate the equilibrium displacement model. THere will be 4 total equations that will estimate the equilibrium price and quantity;
proc model data=work.price_quant; range id=1 to 58;
*Own price elasticities of supply:
CNV Breast(ex): -0.56906
RWA Breast(ey): -8.413173;

%let ex=-0.56906;
%let ey=-8.413173;

*Cross Price Elastcities of Supply
CNV Quantity to RWA Price (exy):-1.14336
RWA Quantity to CNV Price (eyx):0.95253;

%let exy=-1.14336;
%let eyx=0.95253;

*Own price demand elastcities. Slutsky compensated elasticities are used.
CNV Breast (nx)=-0.0253
RWA Breast (ny)=-0.0658;

%let nx=-0.0253;
%let ny=-0.0658;

*Cross Price elasticites of demand
CNV-RWA (nxy)=0.00857
RWA-CNV (nyx)=0.02478;

%let nxy=0.00857;
%let nyx=0.02478;

*Tyx and Txy are market shares. They will be determined outside of the model to simulate different scenarios.
Tyx + Txy must equal 1, the whole market.
Tyx is the market share of RWA, Txy is the market share of CNV;

%let tyx=0.6;
%let txy=0.4;

*Supply equations;
*EV are price wedges between retail and wholesale prices. These are simulated price premiums. To start will set the price premiums to zero;

%let EVCNV=0;
%let EVRWA=0;

%let EPCNV=1;
%let EPRWA=1;

*Model equations;
EQCNV=&nx*&EPCNV + &nxy*&EPRWA - &tyx*EQRWA;
EQRWA=&nyx*&EPCNV + &ny*&EPRWA - &txy*EQCNV;
EQCNV= &ex * (&EPCNV-&EVCNV)+&exy*(&EPRWA-&EVRWA);
EQRWA= &eyx *(&EPCNV-&EVCNV)+&ey*(&EPRWA-&EVRWA);

solve EQCNV EQRWA;

run;
quit;

proc iml;
*Run the system of equations using proc IML. The equations stay the same as above. In matrix form, the system can be written as Ax=c, where A is a 4X4 matrix of coefficents before the
variables, x is the unknowns being solved for, and c is solution. The system solution can be given by x=A^-1*c
A= nx  nxy -1  -tyx  x= EPX  c=0
   nyx ny  -txy -1      EPY    0
   ex  exy -1    0      EQX    exEVX+exyEVy
   eyx ey   0   -1      EQY    eyxEVx+eyEVy;

*CNV Breast (nx)=-0.0253      CNV-RWA (nxy)=0.00857
 RWA Breast (ny)=-0.0658      RWA-CNV (nyx)=0.02478;

*CNV Breast(ex): -0.56906        CNV Quantity to RWA Price (exy):-1.14336
 RWA Breast(ey): -8.413173       RWA Quantity to CNV Price (eyx):0.95253;

*tyx and txy are market shares and will change to simulate changing market shares;
*EVx and EVy price wedges and will represent premiums. To start they will be set at zero;

a= {-0.0253 0.00857 -1 -.6,
    0.02478 -0.0658 -.4 -1,
	-0.56906 -1.14336 -1 0,
	0.95253 -8.413173 0 -1};

c= {0,
    0,
	-1.71242,
	-7.46064};

*Solve the equation using the inv function and the matrix multiplication operator;
	x=inv(a)*c;
	print x;

quit;
ods pdf close;
