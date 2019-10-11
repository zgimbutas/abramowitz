function j1=abram1(z,ifexpon)
%
%  This subroutine evaluates the Abramowitz functions J_{1}
%  for a user-specified complex number z with Re(z)>=0.
%
%  The code is reasonably accurate (almost 15-digit relative
%  accuracy when ifexpon=0) and reasonably fast (O(1) cost for any z).
%
%  When ifexpon=1, that is, the Abramowitz function is evaluated
%  honestly. The subroutine will lose accuracy gradually
%  simply due to the ill-conditioning of evaluating the
%  exponential factor exp(-nu) with nu=3(z/2)**(2/3).
%  The condition number of evaluating exp(-nu) is abs(nu).
%  Thus, the subroutine will lose an extra log_{10}abs(nu)
%  digits if the function is evaluated honestly.
%
%
%  Input parameters:
%
%  z - the complex number for which the Abramowitz function
%        J_{1} is to be evaluated
%
%  ifexpon - the integer parameter telling the subroutine whether
%        to calculate the actual values of the Abramowitz function,
%        or the values of the Abramowitz function scaled by e^{nu}.
%        Permitted values: 0 and 1.
%    ifexpon = 1 will cause the subroutine to evaluate the Abramowitz
%        function honestly
%    ifexpon = 0 will cause the subroutine to scale the Abramowitz
%        function by e^{nu}, where nu=3(z/2)^(2/3).
%
%  Output parameters:
%
%  j1 - the said Abramowitz function
%

if( nargin < 2 ), ifexpon = 0; end

ifexpon = double(ifexpon);
[n, m] = size(z);

j1 = zeros(n,m)+1i*zeros(n,m);

npts = double(n*m);

mex_id_ = 'abram1mex(i int[x], i dcomplex[], io dcomplex[], i int[x])';
[j1] = abram_r2017b(mex_id_, npts, z, j1, ifexpon, 1, 1);



