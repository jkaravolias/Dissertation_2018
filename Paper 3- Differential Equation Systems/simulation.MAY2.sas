proc iml;

a1={-1.3902 -0.3885  0 .3 -1 0 0 0 0,
    0.4473   1.0767 .7  0  1 0 0 0 0,
    0.0711     0    -1  0  0 0 0 0 0,
	0        0.0937  0 -1  0 0 0 0 0,
	0        0      .7 .3 -1 0 0 0 0,
	0        0     .61839 0      0 -.8421 0 -1 0,
    0        0      0     1.0067 0  0 -8.6346 0 -1,
	0 0 0 0 0 .65 0 -1 0,
	0 0 0 0 0  0 .25 0 -1};

a2={-1.3902 -0.3885  0 .3 -1 0 0 0 0,
    0.4473   1.0767 .7  0  1 0 0 0 0,
    0.0711    0    -1  0  0 0 0 0 0,
	0        0.2437  0 -1  0 0 0 0 0,
	0        0      .7 .3 -1 0 0 0 0,
	0        0     .61839 0      0 -.8421 0 -1 0,
    0        0      0     1.0067 0  0 -8.6346 0 -1,
	0 0 0 0 0 .65 0 -1 0,
	0 0 0 0 0  0 .65 0 -1};

a3={-1.3902 -0.3885  0 .3 -1 0 0 0 0,
    0.4473   1.0767 .7  0  1 0 0 0 0,
    0.0711     0    -1  0  0 0 0 0 0,
	0        0.3749  0 -1  0 0 0 0 0,
	0        0      .7 .3 -1 0 0 0 0,
	0        0     .61839 0      0 -.8421 0 -1 0,
    0        0      0     1.0067 0  0 -8.6346 0 -1,
	0 0 0 0 0 .65 0 -1 0,
	0 0 0 0 0  0 1 0 -1};

a4={-1.3902 -0.3885  0 .3 -1 0 0 0 0,
    0.4473   1.0767 .7  0  1 0 0 0 0,
    0.0711     0    -1  0  0 0 0 0 0,
	0        0.4867  0 -1  0 0 0 0 0,
	0        0      .7 .3 -1 0 0 0 0,
	0        0     .61839 0      0 -.8421 0 -1 0,
    0        0      0     1.0067 0  0 -8.6346 0 -1,
	0 0 0 0 0 .65 0 -1 0,
	0 0 0 0 0  0 1.25 0 -1};

a5={-0.993 -0.2775  0 .5 -1 0 0 0 0,
    0.7455   1.7945 .5  0  1 0 0 0 0,
    0.0711     0    -1  0  0 0 0 0 0,
	0        0.0937  0 -1  0 0 0 0 0,
	0        0      .5 .5 -1 0 0 0 0,
	0        0     .61839 0      0 -.8421 0 -1 0,
    0        0      0     1.0067 0  0 -8.6346 0 -1,
	0 0 0 0 0 .65 0 -1 0,
	0 0 0 0 0  0 .25 0 -1};

a6={-0.993 -0.2775  0 .5 -1 0 0 0 0,
    0.7455   1.7945 .5  0  1 0 0 0 0,
    0.0711     0    -1  0  0 0 0 0 0,
	0        0.2437  0 -1  0 0 0 0 0,
	0        0      .5 .5 -1 0 0 0 0,
	0        0     .61839 0      0 -.8421 0 -1 0,
    0        0      0     1.0067 0  0 -8.6346 0 -1,
	0 0 0 0 0 .65 0 -1 0,
	0 0 0 0 0  0 .65 0 -1};

a7={-0.993 -0.2775  0 .5 -1 0 0 0 0,
    0.7455   1.7945 .5  0  1 0 0 0 0,
    0.0711     0    -1  0  0 0 0 0 0,
	0        0.3749  0 -1  0 0 0 0 0,
	0        0      .5 .5 -1 0 0 0 0,
	0        0     .61839 0      0 -.8421 0 -1 0,
    0        0      0     1.0067 0  0 -8.6346 0 -1,
	0 0 0 0 0 .65 0 -1 0,
	0 0 0 0 0  0 1 0 -1};

a8={-0.993 -0.2775  0 .5 -1 0 0 0 0,
    0.7455   1.7945 .5  0  1 0 0 0 0,
    0.0711     0    -1  0  0 0 0 0 0,
	0        0.4687  0 -1  0 0 0 0 0,
	0        0      .5 .5 -1 0 0 0 0,
	0        0     .61839 0      0 -.8421 0 -1 0,
    0        0      0     1.0067 0  0 -8.6346 0 -1,
	0 0 0 0 0 .65 0 -1 0,
	0 0 0 0 0  0 1.25 0 -1};

a9={-0.5958 -0.1665  0 .7 -1 0 0 0 0,
    1.0437   2.5123 .3  0  1 0 0 0 0,
    0.0711     0    -1  0  0 0 0 0 0,
	0        0.0937  0 -1  0 0 0 0 0,
	0        0      .3 .7 -1 0 0 0 0,
	0        0     .61839 0      0 -.8421 0 -1 0,
    0        0      0     1.0067 0  0 -8.6346 0 -1,
	0 0 0 0 0 .65 0 -1 0,
	0 0 0 0 0  0 .25 0 -1};

a10={-0.5958 -0.1665  0 .7 -1 0 0 0 0,
    1.0437   2.5123 .3  0  1 0 0 0 0,
    0.0711     0    -1  0  0 0 0 0 0,
	0        0.2437  0 -1  0 0 0 0 0,
	0        0      .3 .7 -1 0 0 0 0,
	0        0     .61839 0      0 -.8421 0 -1 0,
    0        0      0     1.0067 0  0 -8.6346 0 -1,
	0 0 0 0 0 .65 0 -1 0,
	0 0 0 0 0  0 .65 0 -1};

a11={-0.5958 -0.1665  0 .7 -1 0 0 0 0,
    1.0437   2.5123 .3  0  1 0 0 0 0,
    0.0711     0    -1  0  0 0 0 0 0,
	0        0.3749  0 -1  0 0 0 0 0,
	0        0      .3 .7 -1 0 0 0 0,
	0        0     .61839 0      0 -.8421 0 -1 0,
    0        0      0     1.0067 0  0 -8.6346 0 -1,
	0 0 0 0 0 .65 0 -1 0,
	0 0 0 0 0  0 1 0 -1};

a12={-0.5958 -0.1665  0 .7 -1 0 0 0 0,
    1.0437   2.5123 .3  0  1 0 0 0 0,
    0.0711     0    -1  0  0 0 0 0 0,
	0        0.4687  0 -1  0 0 0 0 0,
	0        0      .3 .7 -1 0 0 0 0,
	0        0     .61839 0      0 -.8421 0 -1 0,
    0        0      0     1.0067 0  0 -8.6346 0 -1,
	0 0 0 0 0 .65 0 -1 0,
	0 0 0 0 0  0 1.25 0 -1};

c1={-0.176,
   0.4876,
   0,
   0,
   0,
   0,
   0,
   0,
   0};

c2={-0.1257,
   0.8127,
   0,
   0,
   0,
   0,
   0,
   0,
   0};

c3={-0.0754,
   1.1378,
   0,
   0,
   0,
   0,
   0,
   0,
   0};

c4={-0.176,
   0.4876,
   0,
   0,
   0,
   0,
   0,
   0,
   0.0625};

c5={-0.176,
   0.4876,
   0,
   0,
   0,
   0,
   0,
   0,
   0.1625};

c6={-0.176,
   0.4876,
   0,
   0,
   0,
   0,
   0,
   0,
   0.25};

c7={-0.176,
   0.4876,
   0,
   0,
   0,
   0,
   0,
   0,
   0.3125};

c8={-0.1257,
   0.8127,
   0,
   0,
   0,
   0,
   0,
   0,
   0.0625};

c9={-0.1257,
   0.8127,
   0,
   0,
   0,
   0,
   0,
   0,
   0.1625};

c10={-0.1257,
   0.8127,
   0,
   0,
   0,
   0,
   0,
   0,
   0.25};

c11={-0.1257,
   0.8127,
   0,
   0,
   0,
   0,
   0,
   0,
   0.3125};

c12={-0.0754,
   1.1378,
   0,
   0,
   0,
   0,
   0,
   0,
   0.0625};

c13={-0.0754,
   1.1378,
   0,
   0,
   0,
   0,
   0,
   0,
   0.1625};

c14={-0.0754,
   1.1378,
   0,
   0,
   0,
   0,
   0,
   0,
   0.25};

c15={-0.0754,
   1.1378,
   0,
   0,
   0,
   0,
   0,
   0,
   0.3125};

c16={-0.1760,
   0.4876,
   0,
   0,
   0,
   0,
   0,
   0,
   0.125};

c17={-0.1760,
   0.4876,
   0,
   0,
   0,
   0,
   0,
   0,
   0.325};

c18={-0.1760,
   0.4876,
   0,
   0,
   0,
   0,
   0,
   0,
   0.5};

c19={-0.1760,
   0.4876,
   0,
   0,
   0,
   0,
   0,
   0,
   0.625};

c20={-0.1257,
   0.8127,
   0,
   0,
   0,
   0,
   0,
   0,
   0.125};

c21={-0.1257,
   0.8127,
   0,
   0,
   0,
   0,
   0,
   0,
   0.325};

c22={-0.1257,
   0.8127,
   0,
   0,
   0,
   0,
   0,
   0,
   0.5};

c23={-0.1257,
   0.8127,
   0,
   0,
   0,
   0,
   0,
   0,
   0.625};

c24={-0.0754,
   1.1378,
   0,
   0,
   0,
   0,
   0,
   0,
   0.125};

c25={-0.0754,
   1.1378,
   0,
   0,
   0,
   0,
   0,
   0,
   0.325};

c26={-0.0754,
   1.1378,
   0,
   0,
   0,
   0,
   0,
   0,
   0.5};

c27={-0.0754,
   1.1378,
   0,
   0,
   0,
   0,
   0,
   0,
   0.625};

   ***************************************
   ***************K=0*********************
   ***************************************;
   x1=inv(a1)*c1;
   print x1;

   x2=inv(a2)*c1;
   print x2;

   x3=inv(a3)*c1;
   print x3;

   x4=inv(a4)*c1;
   print x4;

   x5=inv(a5)*c2;
   print x5;

   x6=inv(a6)*c2;
   print x6;

   x7=inv(a7)*c2;
   print x7;

   x8=inv(a8)*c2;
   print x8;

   x9=inv(a9)*c3;
   print x9;

   x10=inv(a10)*c3;
   print x10;

   x11=inv(a11)*c3;
   print x11;

   x12=inv(a12)*c3;
   print x12;

   ******************************************
   *****************k=.25********************
   ******************************************;

  x13=inv(a1)*c4;
   print x13;

   x14=inv(a2)*c5;
   print x14;

   x15=inv(a3)*c6;
   print x15;

   x16=inv(a4)*c7;
   print x16;

   x17=inv(a5)*c8;
   print x17;

   x18=inv(a6)*c9;
   print x18;

   x19=inv(a7)*c10;
   print x19;

   x20=inv(a8)*c11;
   print x20;

   x21=inv(a9)*c12;
   print x21;

   x22=inv(a10)*c13;
   print x22;

   x23=inv(a11)*c14;
   print x23;

   x24=inv(a12)*c15;
   print x24;

   
   ******************************************
   *****************k=.50********************
   ******************************************;

  x25=inv(a1)*c16;
   print x25;

   x26=inv(a2)*c17;
   print x26;

   x27=inv(a3)*c18;
   print x27;

   x28=inv(a4)*c19;
   print x28;

   x29=inv(a5)*c20;
   print x29;

   x30=inv(a6)*c21;
   print x30;

   x31=inv(a7)*c22;
   print x31;

   x32=inv(a8)*c23;
   print x32;

   x33=inv(a9)*c24;
   print x33;

   x34=inv(a10)*c25;
   print x34;

   x35=inv(a11)*c26;
   print x35;

   x36=inv(a12)*c27;
   print x36;

   quit;
