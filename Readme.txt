
Abramowitz function evaluation package
======================================


Copyright (C) 2019: Jiang, Shidong
Contact: Jiang, Shidong <shidong.jiang@njit.edu> 

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


Fortran
=======

abramm1.f - Abramowitz function J_{-1}(z), Re(z) >= 0

abram0.f - Abramowitz function J_0(z), Re(z) >= 0 
abram1.f - Abramowitz function J_1(z), Re(z) >= 0 
abram2.f - Abramowitz function J_2(z), Re(z) >= 0 

abramn.f - Abramowitz function J_n(z), Re(z) >= 0 



Fortran, quad precision
=======================
Note: all quad precision files need to be compiled using -freal-8-real-16 option in gfortran.

abramm1quad.f - Abramowitz function J_{-1}(z), Re(z) >= 0, real *16 version

abram0quad.f - Abramowitz function J_0(z), Re(z) >= 0, real *16 version
abram1quad.f - Abramowitz function J_1(z), Re(z) >= 0, real *16 version
abram2quad.f - Abramowitz function J_2(z), Re(z) >= 0, real *16 version



Matlab
======

abramm1.m - Abramowitz function J_{-1}(z), Re(z) >= 0

abram0.m - Abramowitz function J_0(z), Re(z) >= 0 
abram1.m - Abramowitz function J_1(z), Re(z) >= 0 
abram2.m - Abramowitz function J_2(z), Re(z) >= 0 

