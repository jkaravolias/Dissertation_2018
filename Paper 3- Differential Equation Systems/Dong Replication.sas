*************************************************************
***********************NAE-USDA Data*************************
*************************************************************;


proc import out=work.NAE
datafile='e:/paper 3-NAE Data/input-output.csv'
dbms=csv replace;
datarow=2;
run;


*Outputs-p's and q's
Product 1: CNV BREAST      Product 5: RWA Breast
Product 2: CNV THIGH       Product 6: RWA Thigh
Product 3: CNV Leg         Product 7: RWA Leg
Product 4: CNV Wing        Product 8: RWA Wing;

*Inputs- x's are inputs, w's are prices
Input 1: Corn
Input 2: Soy
Input 3: Animal meal protein;

data NAE; set work.NAE;

*Adjust output prices from cents per pound to dollars per pound;
p1=p1/100;
p2=p2/100;
p3=p3/100;
p4=p4/100;
p5=p5/100;
p6=p6/100;
p7=p7/100;
p8=p8/100;

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
*dlnx1=log(x1)-log(lag1(x1));
*dlnx2=log(x2)-log(lag1(x2));
*dlnx3=log(x3)-log(lag1(x3));

*Create Revenue;
revenue=(q1*p1)+(q2*p2)+(q3*p3)+(q4*p4)+(q5*p5)+(q6*p6)+(q7*p7)+(q8*p8);


*Create revenue shares;
g1=(q1*p1)/revenue;
g2=(q2*p2)/revenue;
g3=(q3*p3)/revenue;
g4=(q4*p4)/revenue;
g5=(q5*p5)/revenue;
g6=(q6*p6)/revenue;
g7=(q7*p7)/revenue;
g8=(q8*p8)/revenue;

*Calculate average share revenues;
g1bar=(g1+lag1(g1))/2;
g2bar=(g2+lag1(g2))/2;
g3bar=(g3+lag1(g3))/2;
g4bar=(g4+lag1(g4))/2;
g5bar=(g5+lag1(g5))/2;
g6bar=(g6+lag1(g6))/2;
g7bar=(g7+lag1(g7))/2;
g8bar=(g8+lag1(g8))/2;

*Create log change of output prices;
dlnp1=log(p1)-log(lag1(p1));
dlnp2=log(p2)-log(lag1(p2));
dlnp3=log(p3)-log(lag1(p3));
dlnp4=log(p4)-log(lag1(p4));
dlnp5=log(p5)-log(lag1(p5));
dlnp6=log(p6)-log(lag1(p6));
dlnp7=log(p7)-log(lag1(p7));
dlnp8=log(p8)-log(lag1(p8));

*Create log change of output;
dlnq1=log(q1)-log(lag1(q1));
dlnq2=log(q2)-log(lag1(q2));
dlnq3=log(q3)-log(lag1(q3));
dlnq4=log(q4)-log(lag1(q4));
dlnq5=log(q5)-log(lag1(q5));
dlnq6=log(q6)-log(lag1(q6));
dlnq7=log(q7)-log(lag1(q7));
dlnq8=log(q8)-log(lag1(q8));

*Create gamma, average revenue cost ratio;
gma=((revenue*lag1(revenue))/(cost*lag1(cost)))**.5;


*Yin is the left hand side of the input demand system;
*yin1=f1bar*dlnx1;
*yin2=f2bar*dlnx2;
*yin3=f3bar*dlnx3;

*These are tempoary to make sure the code works, when inputs are sorted out delete and refer to the 
lines above;
yin1=f1bar;
yin2=f2bar;
yin3=f3bar;

*Yout is the left hand side of the output system;
yout1=g1bar*dlnq1;
yout2=g2bar*dlnq2;
yout3=g3bar*dlnq3;
yout4=g4bar*dlnq4;
yout5=g5bar*dlnq5;
yout6=g6bar*dlnq6;
yout7=g7bar*dlnq7;
yout8=g8bar*dlnq8;

id=_N_;

run;


*Run a model to estimate input demand system;
proc model data=work.NAE; range id=2 to 58;

*The th's are the thetas' the p's are the pis;
yin1=(tha1*(gma*g1bar*dlnq1))+(thb1*(gma*g2bar*dlnq2))+(thc1*(gma*g3bar*dlnq3))+(thd1*(gma*g4bar*dlnq4))+
     (the1*(gma*g5bar*dlnq5))+(thf1*(gma*g6bar*dlnq6))+(thg1*(gma*g7bar*dlnq7))+(thh1*(gma*g8bar*dlnq8))+
	 (p11*dlnw1)+(p12*dlnw2)+((0-p11-p12)*dlnw3);

yin2=(tha2*(gma*g1bar*dlnq1))+(thb2*(gma*g2bar*dlnq2))+(thc2*(gma*g3bar*dlnq3))+(thd2*(gma*g4bar))+
     (the2*(gma*g5bar*dlnq5))+(thf2*(gma*g6bar*dlnq6))+(thg2*(gma*g7bar*dlnq7))+(thh2*(gma*g8bar))+
	 (p12*dlnw1)+(p22*dlnw2)+((0-p12-p22)*dlnw3);


fit yin1 yin2/ gmm outest=fin0 converge=0.00001 maxit=1000;
parms tha1 thb1 thc1 thd1 the1 thf1 thg1 thh1
	  tha2 thb2 thc2 thd2 the2 thf2 thg2 thh2

	  p11 p12
	      p22;


run;
quit;

*Run model for output system;
proc model data=work.NAE; range id=2 to 30;

%let tha1=0.001131;
%let thb1=0.0151;
%let thc1=-0.01644;
%let thd1=0.000161;
%let the1=0.013937;
%let thf1=-0.01862;
%let thg1=-0.00278;
%let thh1=-0.0476;

%let tha2=-0.01095;
%let thb2=0.026428;
%let thc2=-0.0256;
%let thd2=0.065512;
%let the2=-0.02215;
%let thf2=-0.0077;
%let thg2=-0.026056;
%let thh2=0.193482;

%let xout1=(dlnp1-&tha1*dlnw1-&tha2*dlnw2-(1-&tha1-&tha2)*dlnw3);
%let xout2=(dlnp2-&thb1*dlnw1-&thb2*dlnw2-(1-&thb1-&thb2)*dlnw3);
%let xout3=(dlnp3-&thc1*dlnw1-&thc2*dlnw2-(1-&thc1-&thc2)*dlnw3);
%let xout4=(dlnp4-&thd1*dlnw1-&thd2*dlnw2-(1-&thd1-&thd1)*dlnw3);
%let xout5=(dlnp5-&the1*dlnw1-&the1*dlnw2-(1-&the1-&the1)*dlnw3);
%let xout6=(dlnp6-&thf1*dlnw1-&thf2*dlnw2-(1-&thf1-&thf2)*dlnw3);
%let xout7=(dlnp7-&thg1*dlnw1-&thg2*dlnw2-(1-&thg1-&thg2)*dlnw3);
%let xout8=(dlnp8-&thh1*dlnw1-&thh2*dlnw2-(1-&thh1-&thh2)*dlnw3);

yout1=aa*&xout1 + ab*&xout2 + ac*&xout3 + ad*&xout4 + ae*&xout5 + af*&xout6 + ag*&xout7 + (0-aa-ab-ac-ad-ae-af-ag)*&xout8;
yout2=ab*&xout1 + bb*&xout2 + bc*&xout3 + bd*&xout4 + be*&xout5 + bf*&xout6 + bg*&xout7 + (0-ab-bb-bc-bd-be-bf-bg)*&xout8;
yout3=ac*&xout1 + bc*&xout2 + cc*&xout3 + cd*&xout4 + ce*&xout5 + cf*&xout6 + cg*&xout7 + (0-ac-bc-cc-cd-ce-cf-cg)*&xout8;
yout4=ad*&xout1 + bd*&xout2 + cd*&xout3 + dd*&xout4 + de*&xout5 + df*&xout6 + dg*&xout7 + (0-ad-bd-cd-dd-de-df-dg)*&xout8;
yout5=ae*&xout1 + be*&xout2 + ce*&xout3 + de*&xout4 + ee*&xout5 + ef*&xout6 + eg*&xout7 + (0-ae-be-ce-de-ee-ef-eg)*&xout8;
yout6=af*&xout1 + bf*&xout2 + cf*&xout3 + df*&xout4 + ef*&xout5 + ff*&xout6 + fg*&xout7 + (0-af-bf-cf-df-ef-ff-fg)*&xout8;
yout7=ag*&xout1 + bg*&xout2 + cg*&xout3 + dg*&xout4 + eg*&xout5 + fg*&xout6 + gg*&xout7 + (0-ag-bg-cg-dg-eg-fg-gg)*&xout8;

fit yout1 yout2 yout3 yout4 yout5 yout6 yout7 / gmm outest=fin1 converge=0.00001 maxit=10000;
parms aa ab ac ad ae af ag 
         bb bc bd be bf bg
		    cc cd ce cf cg
			   dd de df df
			      ee ef eg
				     ff fg
					    gg;

run; 
quit;








