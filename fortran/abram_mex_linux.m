% Build MEX file undef Linux using gcc+gfortran

mex -v -c abramm1.f abramm1_mex.f  abram0.f abram0_mex.f abram1.f abram1_mex.f abram2.f abram2_mex.f 

mex -v -c abram_r2017b.c

mex -v -output abram_r2017b.mexa64 abram_r2017b.c abramm1.o abramm1_mex.o  abram0.o abram0_mex.o abram1.o abram1_mex.o abram2.o abram2_mex.o -lgfortran
