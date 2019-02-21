
proc import out=work.NAE
datafile='e:/paper 3-NAE Data/input-outputEXPAND.csv'
dbms=csv replace;
datarow=2;
run;

*Outputs-p's and q's
Product 9: CNV Whole Chicken
Product 10: RWA Whole Chicken;


*Inputs- x's are inputs, w's are prices
Input 1: Corn
Input 2: Soy
Input 3: Animal meal protein;

data NAE; set work.NAE;

p9=p9/100;
p10=p10/100;

*Create cost variables;
cost=(x1*w1)+(x2*w2)+(x3*w3);

*Create cost shares;
f1=(x1*w1)/cost;
f2=(x2*w2)/cost;
f3=(x3*w3)/cost;

*Average Cost share of input i;
f1bar=(f1+lag(f1))/2;
f2bar=(f2+lag(f2))/2;
f3bar=(f3+lag(f3))/2;

*Create log change of input prices;
dlnw1=log(w1)-log(lag1(w1));
dlnw2=log(w2)-log(lag1(w2));
dlnw3=log(w3)-log(lag1(w3));

*Create log change of inputs;
dlnx1=log(x1)-log(lag1(x1));
dlnx2=log(x2)-log(lag1(x2));
dlnx3=log(x3)-log(lag1(x3));

*Create Revenue;

revenue=(q9*p9)+(q10*p10);

*Create Revenue Shares;
g9=(q9*p9)/revenue;
g10=(q10*p10)/revenue;

*Calculate average share revenues;
g9bar=(g9+lag1(g9))/2;
g10bar=(g10+lag1(g10))/2;

*Create log change of output prices;
dlnp9=log(p9)-log(lag(p9));
dlnp10=log(p10)-log(lag(p10));

*Create log change of output;
dlnq9=log(q9)-log(lag1(q9));
dlnq10=log(q10)-log(lag1(q10));

*Create Gamma, average revenue cost ratio;
gma=((revenue*lag1(revenue))/(cost*lag1(cost)))**.5;

*Yin is the left hand side of the input demand system;
yin1=f1bar*dlnx1;
yin2=f2bar*dlnx2;
yin3=f3bar*dlnx3;

*These are tempoary to make sure the code works, when inputs are sorted out delete and refer to the 
lines above;
*yin1=f1bar;
*yin2=f2bar;
*yin3=f3bar;

*Yout is the left hand side of the output system;
yout9=g9bar*dlnq9;
yout10=g10bar*dlnq10;

id=_N_;

run;

*Run a model to estimate input demand system;

proc means data=work.NAE;
var gma g9bar g10bar f1bar f2bar f3bar;
run;

proc model data=work.NAE; range id=2 to 58;

*The th's are the thetas the p's are the pis;

yin1=(tha1*(gma*g9bar*dlnq9)) + (thb1*(gma*g10bar*dlnq10)) +
(p11*dlnw1) + (p12*dlnw2) + ((0-p11-p12)*dlnw3);

yin2=(tha2*(gma*g9bar*dlnq9)) + (thb2*(gma*g10bar*dlnq10)) +
(p12*dlnw1) + (p22*dlnw2) + ((0-p12-p22)*dlnw3);

fit yin1 yin2/ gmm outest=fin0 converge=0.00001 maxit=1000;
parms tha1 thb1 
	  tha2 thb2 
	  p11 p12
	      p22;

*Thetas add up to one;
estimate 'tha3' 1-tha1-tha2;
estimate 'thb3' 1-thb1-thb2;

*Pi's add up to 0;
estimate 'p13' 0-p11-p12;
estimate 'p23' 0-p12-p22;
estimate 'p33' p11+p12+p12+p22;

%let gmabar=37.4682606;
%let g9bar=0.7556577;
%let g10bar=0.2443423;
%let f1bar=0.0464583;
%let f2bar=0.9002761;
%let f3bar=0.0532657;

*Output elasticities of demand for feed grains;
estimate 'c19' (tha1*&gmabar*g9bar)/(f1bar);
estimate 'c110'(thb1*&gmabar*g10bar)/(f1bar);

estimate 'c29' (tha2*&gmabar*g9bar)/(f2bar);
estimate 'c210'(thb2*&gmabar*g10bar)/(f2bar);

estimate 'c39' ((1-tha1-tha2)*&gmabar*g9bar)/(f3bar);
estimate 'c310'((1-thb1-thb2)*&gmabar*g10bar)/(f3bar);


*Price elasticties of demand for feed grains;
estimate 'n11' p11/&f1bar;
estimate 'n12' p12/&f1bar;
estimate 'n13' (0-p11-p12)/&f1bar;

estimate 'n21' p12/&f2bar;
estimate 'n22' p22/&f2bar;
estimate 'n23' (0-p12-p22)/&f2bar;

estimate 'n31' (0-p11-p12)/&f3bar;
estimate 'n32' (0-p12-p22)/&f3bar;
estimate 'n33' (p11+p12+p12+p22)/&f3bar;

run;
quit;

*Run model for output system;
proc model data=work.NAE; range id=2 to 58;

%let tha1=0.00108;
%let thb1=0.000689;

%let tha2=0.0007549;
%let thb2=0.007738;

%let xout9=(dlnp9-&tha1*dlnw1-&tha2*dlnw2-(1-&tha1-&tha2)*dlnw3);
%let xout10=(dlnp10-&thb1*dlnw1-&thb2*dlnw2-(1-&thb1-&thb2)*dlnw3);

yout10=aa*&xout9 + (0-aa)*&xout10;

fit yout10/ gmm outest=fin1 converge=0.00001 maxit=1000;
parms aa;

estimate 'ab' 0-aa;
estimate 'bb' 0+aa;

%let gmabar=37.4682606;
%let g9bar=0.7556577;
%let g10bar=0.2443423;
%let f1bar=0.0464583;
%let f2bar=0.9002761;
%let f3bar=0.0532657;

*Price elasticites of livestock supply;
estimate 'e11' aa/(&gmabar*&g9bar);
estimate 'e12' (0-aa)/(&gmabar*&g9bar);

estimate 'e21' (0-aa)/(&gmabar*g10bar);
estimate 'e22' aa/(&gmabar*g10bar);


run;
quit;
