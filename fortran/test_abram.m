

n = 100000

disp('=== series ===')

r = rand(n,1);
a = 0; b = 1; r = (b-a)*r+a;

theta = rand(n,1);
theta = theta * pi/2;


z = r .* exp(1i*theta);

%%% preload mex file
ifexpon = 1;

j0 = abram0(z,ifexpon);
  
disp('------------------')
disp('ifexpon=0')

tic; jm1 = abramm1(z); toc
tic; j0 = abram0(z); toc
tic; j1 = abram1(z); toc
tic; j2 = abram2(z); toc
  
disp('------------------')
disp('ifexpon=1')

tic; jm1 = abramm1(z,1); toc
tic; j0 = abram0(z,1); toc
tic; j1 = abram1(z,1); toc
tic; j2 = abram2(z,1); toc


  
disp('=== intermediate ===')

r = rand(n,1);
a = 1; b = 15; r = (b-a)*r+a;

theta = rand(n,1);
theta = theta * pi/2;


z = r .* exp(1i*theta);

%%% preload mex file
ifexpon = 1;

j0 = abram0(z,ifexpon);
  
disp('------------------')
disp('ifexpon=0')

tic; jm1 = abramm1(z); toc
tic; j0 = abram0(z); toc
tic; j1 = abram1(z); toc
tic; j2 = abram2(z); toc
  
disp('------------------')
disp('ifexpon=1')

tic; jm1 = abramm1(z,1); toc
tic; j0 = abram0(z,1); toc
tic; j1 = abram1(z,1); toc
tic; j2 = abram2(z,1); toc


  
disp('=== asympt ===')

r = rand(n,1);
a = 15; b = 1000; r = (b-a)*r+a;

theta = rand(n,1);
theta = theta * pi/2;


z = r .* exp(1i*theta);

%%% preload mex file
ifexpon = 1;

j0 = abram0(z,ifexpon);
  
disp('------------------')
disp('ifexpon=0')

tic; jm1 = abramm1(z); toc
tic; j0 = abram0(z); toc
tic; j1 = abram1(z); toc
tic; j2 = abram2(z); toc
  
disp('------------------')
disp('ifexpon=1')

tic; jm1 = abramm1(z,1); toc
tic; j0 = abram0(z,1); toc
tic; j1 = abram1(z,1); toc
tic; j2 = abram2(z,1); toc


  
