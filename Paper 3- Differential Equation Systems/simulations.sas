**********************************************************************
*******************Equilibrium Displacement Model*********************
**********************************************************************;

*Using estimated wholesale demand elasticities;

*Call PROC IML to estimate the 9-equation systems. The system can be written as AX=c, where A is a 9x9 matrix of coeffiencents, x is the unknowns being solved for (all the relative
changes of prices and quantities), and c is the solutions. The system of the solution is given  by x=A^-1*c.

*There will be 24 different simulation scenarios. Market share, wholesale own price RWA supply, and delta (percentage change in consumer WTP to pay for the intial quantity) 
will be simulated. This may lead to many results and could be minimized.;

**********************************************
*****************k=0**************************
**********************************************;
proc iml;

*Simulation #1: phi=.7, ewy=.25, dy=.25;

a1={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .093735 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .25 0 -1};

   c25={-.13875,
   .89725,
   0,
   0,
   0,
   0,
   0,
   0,
   0};

   *Solve the equation using the inv function and the matrix multiplication operator;

   x1=inv(a1)*c25;
   print x1;

   *Simulation #2: phi=.7, ewy=.25, dy=.5;

   a2={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .093735 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .25 0 -1};

    c50={-.2775,
   1.7945,
   0,
   0,
   0,
   0,
   0,
   0,
   0};

   x2=inv(a2)*c50;
   print x2;

   *Simulation #3: phi=.7, ewy=.65, dy=.25;
   a3={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .243711 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .65 0 -1};

   x3=inv(a3)*c25;
   print x3;

   *Simulation #4: phi=.7, ewy=.65, dy=.50;

   x4=inv(a3)*c50;
   print x4;

   *Simulation #5: phi=.7, ewy=1, dy=.25;
   a4={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .37494 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1 0 -1};

   x5=inv(a4)*c25;
   print x5;

   *Simulation #6: phi=.7, ewy=1 dy=.5;
   x6=inv(a4)*c50;
   print x6;

   *Simulation #7: phi=.7, ewy=1.25, dy=.25;
   a5={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .468675 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1.25 0 -1};

   x7=inv(a5)*c25;
   print x7;

   *Simulation #8: phi=.7, ewy=1.25, dy=.50;
   x8=inv(a5)*c50;
   print x8;

   *Simulation #9: phi=.5, ewy=.25, dy=.25;
   a6={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .093735 0 -1 0 0 0 0 0,
   0 0 .5 .5 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .25 0 -1};

   x9=inv(a6)*c25;
   print x9;

   *Simulation#10: phi=.5, ewy=.25, dy=.50;

  x10=inv(a6)*c50;
  print x10;

*Simulation #11: phi=.5, ewy=.65, dy=.25;
   a7={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .243711 0 -1 0 0 0 0 0,
   0 0 .5 .5 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .65 0 -1};

   x11=inv(a7)*c25;
   print x11;

 *Simulation #12: phi=.5, ewy=.65, dy=.50;
   x12=inv(a7)*c50;
   print x12;

*Simulation 13: phi=.5, ewy=1 dy=.25;
a8={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .37494 0 -1 0 0 0 0 0,
   0 0 .5 .5 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1 0 -1};

   x13=inv(a8)*c25;
   print x13;

   *Simulation 14: phi=.5, ewy=1, dy=.50;

x14=inv(a8)*c50;
print x14;

*Simulation 15: phi=.5, ewy=1.25, dy=.25;
 a9={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .468675 0 -1 0 0 0 0 0,
   0 0 .5 .5 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1.25 0 -1};

   x15=inv(a9)*c25;
   print x15;

   *Simulation 16: phi=.5, ewy=1.25, dy=.5;
x16=inv(a9)*c50;
print x16;

*Simulation 17: phi=.3, ewy=.25, dy=.25; 
 a10={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .093735 0 -1 0 0 0 0 0,
   0 0 .3 .7 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .25 0 -1};

   x17=inv(a10)*c25;
   print x17;

   *Simulation 18: phi=.3, ewy=.25, dy=.50;
   x18=inv(a10)*c50;
   print x18;

   *Simulation 19: phi=.3, ewy=.65, dy=.25;
    a11={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .243711 0 -1 0 0 0 0 0,
   0 0 .3 .7 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .65 0 -1};

   x19=inv(a11)*c25;
   print x19;

   *Simulation 20: phi=.3, ewy=.65, dy=.50;

   x20=inv(a11)*c50;
   print x20;

   *Simulation 21: phi=.3, ewy=1, dy=.25;
   a12={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .37494 0 -1 0 0 0 0 0,
   0 0 .3 .7 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1 0 -1};

   x21=inv(a12)*c25;
   print x21;

   *Simulation 22: phi=.3, ewy=1, dy=.5;
   x22=inv(a12)*c50;
   print x22;

   *Simulation 23: phi=.3, ewy=1.25, dy=.25;
 a13={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .468675 0 -1 0 0 0 0 0,
   0 0 .3 .7 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1.25 0 -1};

   x23=inv(a13)*c25;
   print x23;

   *Simulation 24: phi=.3, ewy=1.25, dy=.50;
   x24=inv(a13)*c50;
   print x24;

   *Create all c vectors with various last terms;

    c1={-.13875,
   .89725,
   0,
   0,
   0,
   0,
   0,
   0,
   .0625};

    c2={-.13875,
   .89725,
   0,
   0,
   0,
   0,
   0,
   0,
  .1625};

   c3={-.13875,
   .89725,
   0,
   0,
   0,
   0,
   0,
   0,
  .25};

   c4={-.13875,
   .89725,
   0,
   0,
   0,
   0,
   0,
   0,
   .3125};

   c5={-.2775,
   1.7945,
   0,
   0,
   0,
   0,
   0,
   0,
   .125};

   c6={-.2775,
   1.7945,
   0,
   0,
   0,
   0,
   0,
   0,
   .325};

   c7={-.2775,
   1.7945,
   0,
   0,
   0,
   0,
   0,
   0,
   .5};

   c8={-.2775,
   1.7945,
   0,
   0,
   0,
   0,
   0,
   0,
   .625};

   c9={-.13875,
   .89725,
   0,
   0,
   0,
   0,
   0,
   0,
  .125};

  c10={-.13875,
   .89725,
   0,
   0,
   0,
   0,
   0,
   0,
  .325};

  c11={-.13875,
   .89725,
   0,
   0,
   0,
   0,
   0,
   0,
  .5};

  c12={-.13875,
   .89725,
   0,
   0,
   0,
   0,
   0,
   0,
  .625};

  c13={-.2775,
   1.7945,
   0,
   0,
   0,
   0,
   0,
   0,
   .0625};

   c14={-.2775,
   1.7945,
   0,
   0,
   0,
   0,
   0,
   0,
   .1625};

   c15={-.2775,
   1.7945,
   0,
   0,
   0,
   0,
   0,
   0,
   .25};

   c16={-.2775,
   1.7945,
   0,
   0,
   0,
   0,
   0,
   0,
   .3125};


   **************************************************
   ********************k=.25*************************
   **************************************************;

   *Simulation 25 to 48;

   * A vectors will be the same for the simulations, the only thing that will change is the c vector;

   *Simulation #25: phi=.7, ewy=.25, dy=.25 ky=.25;

*a1={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .093735 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .25 0 -1};


   *Solve the equation using the inv function and the matrix multiplication operator;

   x25=inv(a1)*c1;
   print x25;

   *Simulation #26: phi=.7, ewy=.25, dy=.5 k=.25;

   *a2={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .093735 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .25 0 -1};

   x26=inv(a2)*c13;
   print x26;

   *Simulation #27: phi=.7, ewy=.65, dy=.25 k=.25;
   *a3={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .243711 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .65 0 -1};

   x27=inv(a3)*c2;
   print x27;

   *Simulation #28: phi=.7, ewy=.65, dy=.50 k=.25;

   x28=inv(a3)*c14;
   print x28;

   *Simulation #29: phi=.7, ewy=1, dy=.25 k=.25;
   *a4={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .37494 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1 0 -1};

   x29=inv(a4)*c3;
   print x29;

   *Simulation #30: phi=.7, ewy=1 dy=.5 k=.25;
   x30=inv(a4)*c15;
   print x30;

   *Simulation #31: phi=.7, ewy=1.25, dy=.25 k=.25;
   *a5={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .468675 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1.25 0 -1};

   x31=inv(a5)*c4;
   print x31;

   *Simulation #32: phi=.7, ewy=1.25, dy=.50 k=.25;
   x32=inv(a5)*c16;
   print x32;

   *Simulation #33: phi=.5, ewy=.25, dy=.25 k=.25;
   *a6={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .093735 0 -1 0 0 0 0 0,
   0 0 .5 .5 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .25 0 -1};

   x33=inv(a6)*c1;
   print x33;

   *Simulation#34: phi=.5, ewy=.25, dy=.50 k=.25;

  x34=inv(a6)*c13;
  print x34;

*Simulation #35: phi=.5, ewy=.65, dy=.25 k=.25;
   *a7={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .243711 0 -1 0 0 0 0 0,
   0 0 .5 .5 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .65 0 -1};

   x35=inv(a7)*c2;
   print x35;

 *Simulation #36: phi=.5, ewy=.65, dy=.50 k=.25;
   x36=inv(a7)*c14;
   print x36;

*Simulation 37: phi=.5, ewy=1 dy=.25 k=.25;
*a8={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .37494 0 -1 0 0 0 0 0,
   0 0 .5 .5 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1 0 -1};

   x37=inv(a8)*c3;
   print x37;

   *Simulation 38: phi=.5, ewy=1, dy=.50 k=.25;

x38=inv(a8)*c15;
print x38;

*Simulation 39: phi=.5, ewy=1.25, dy=.25 k=.25;
* a9={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .468675 0 -1 0 0 0 0 0,
   0 0 .5 .5 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1.25 0 -1};

   x39=inv(a9)*c4;
   print x39;

   *Simulation 40: phi=.5, ewy=1.25, dy=.5 k=.25;
x40=inv(a9)*c16;
print x40;

*Simulation 41: phi=.3, ewy=.25, dy=.25 k=.25; 
 *a10={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .093735 0 -1 0 0 0 0 0,
   0 0 .3 .7 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .25 0 -1};

   x41=inv(a10)*c1;
   print x41;

   *Simulation 42: phi=.3, ewy=.25, dy=.50 k=.25;
   x42=inv(a10)*c13;
   print x42;

   *Simulation 43: phi=.3, ewy=.65, dy=.25 k=.25;
  *  a11={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .243711 0 -1 0 0 0 0 0,
   0 0 .3 .7 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .65 0 -1};

   x43=inv(a11)*c2;
   print x43;

   *Simulation 44: phi=.3, ewy=.65, dy=.50 k=.25;

   x44=inv(a11)*c14;
   print x44;

   *Simulation 45: phi=.3, ewy=1, dy=.25 k=.25;
   *a12={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .37494 0 -1 0 0 0 0 0,
   0 0 .3 .7 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1 0 -1};

   x45=inv(a12)*c3;
   print x45;

   *Simulation 46: phi=.3, ewy=1, dy=.5 k=.25;
   x46=inv(a12)*c15;
   print x46;

   *Simulation 47: phi=.3, ewy=1.25, dy=.25 k=.25;
* a13={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .468675 0 -1 0 0 0 0 0,
   0 0 .3 .7 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1.25 0 -1};

   x47=inv(a13)*c4;
   print x47;

   *Simulation 48: phi=.3, ewy=1.25, dy=.50 k=.25;
   x48=inv(a13)*c16;
   print x48;

     **************************************************
   ********************k=.50*************************
   **************************************************;

   *Simulation 49 to 72;

   *Simulation #49: phi=.7, ewy=.25, dy=.25 ky=.50;

*a1={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .093735 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .25 0 -1};


   *Solve the equation using the inv function and the matrix multiplication operator;

   x49=inv(a1)*c9;
   print x49;

   *Simulation #50: phi=.7, ewy=.25, dy=.5 k=.5;

  * a2={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .093735 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .25 0 -1};

   x50=inv(a2)*c5;
   print x50;

   *Simulation #51: phi=.7, ewy=.65, dy=.25 k=.5;
  * a3={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .243711 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .65 0 -1};

   x51=inv(a3)*c10;
   print x51;

   *Simulation #52: phi=.7, ewy=.65, dy=.50 k=.5;

   x52=inv(a3)*c6;
   print x52;

   *Simulation #53: phi=.7, ewy=1, dy=.25 k=.5;
   *a4={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .37494 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1 0 -1};

   x53=inv(a4)*c11;
   print x53;

   *Simulation #54: phi=.7, ewy=1 dy=.5 k=.5;
   x54=inv(a4)*c7;
   print x54;

   *Simulation #55: phi=.7, ewy=1.25, dy=.25 k=.5;
  * a5={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .468675 0 -1 0 0 0 0 0,
   0 0 .7 .3 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1.25 0 -1};

   x55=inv(a5)*c12;
   print x55;

   *Simulation #56: phi=.7, ewy=1.25, dy=.50 k=.5;
   x56=inv(a5)*c8;
   print x56;

   *Simulation #57: phi=.5, ewy=.25, dy=.25 k=.5;
  * a6={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .093735 0 -1 0 0 0 0 0,
   0 0 .5 .5 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .25 0 -1};

   x57=inv(a6)*c9;
   print x57;

   *Simulation#58: phi=.5, ewy=.25, dy=.50 k=.5;

  x58=inv(a6)*c5;
  print x58;

*Simulation #59: phi=.5, ewy=.65, dy=.25 k=.5;
  * a7={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .243711 0 -1 0 0 0 0 0,
   0 0 .5 .5 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .65 0 -1};

   x59=inv(a7)*c10;
   print x59;

 *Simulation #60: phi=.5, ewy=.65, dy=.50 k=.5;
   x60=inv(a7)*c6;
   print x60;

*Simulation 61: phi=.5, ewy=1 dy=.25 k=.5;
*a8={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .37494 0 -1 0 0 0 0 0,
   0 0 .5 .5 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1 0 -1};

   x61=inv(a8)*c11;
   print x61;

   *Simulation 62: phi=.5, ewy=1, dy=.50 k=.5;

x62=inv(a8)*c7;
print x62;

*Simulation 63: phi=.5, ewy=1.25, dy=.25 k=.5;
* a9={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .468675 0 -1 0 0 0 0 0,
   0 0 .5 .5 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1.25 0 -1};

   x63=inv(a9)*c12;
   print x63;

   *Simulation 64: phi=.5, ewy=1.25, dy=.5 k=.5;
x64=inv(a9)*c8;
print x64;

*Simulation 65: phi=.3, ewy=.25, dy=.25 k=.5; 
 *a10={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .093735 0 -1 0 0 0 0 0,
   0 0 .3 .7 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .25 0 -1};

   x65=inv(a10)*c9;
   print x65;

   *Simulation 66: phi=.3, ewy=.25, dy=.50 k=.5;
   x66=inv(a10)*c5;
   print x66;

   *Simulation 67: phi=.3, ewy=.65, dy=.25 k=.5;
 *   a11={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .243711 0 -1 0 0 0 0 0,
   0 0 .3 .7 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 .65 0 -1};

   x67=inv(a11)*c10;
   print x67;

   *Simulation 68: phi=.3, ewy=.65, dy=.50 k=.5;

   x68=inv(a11)*c6;
   print x68;

   *Simulation 69: phi=.3, ewy=1, dy=.25 k=.5;
 *  a12={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .37494 0 -1 0 0 0 0 0,
   0 0 .3 .7 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1 0 -1};

   x69=inv(a12)*c11;
   print x69;

   *Simulation 70: phi=.3, ewy=1, dy=.5 k=.5;
   x70=inv(a12)*c7;
   print x70;

   *Simulation 71: phi=.3, ewy=1.25, dy=.25 k=.5;
 *a13={-1.986 0.555  -1  0 0 0 0 0 0,
   1.491  -3.589  0 -1 0 0 0 0 0,
   .071149 0      -1 0 0 0 0 0 0,
   0  .468675 0 -1 0 0 0 0 0,
   0 0 .3 .7 -1 0 0 0 0,
   0 0 -.61839 0 0 -0.84214 0 -1 0,
   0 0 0  1.0067 0 0 -8.63456 0 -1,
   0 0 0 0 0 .65 0 -1 0,
   0 0 0 0 0 0 1.25 0 -1};

   x71=inv(a13)*c12;
   print x71;

   *Simulation 72: phi=.3, ewy=1.25, dy=.50 k=.5;
   x72=inv(a13)*c8;
   print x72;


   quit;

