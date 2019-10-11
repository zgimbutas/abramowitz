c
c
c
c
        subroutine abramns(z,abrams,n,ifexpon)
        implicit real *8 (a-h,o-z)
        complex *16 z,abrams(1)
        external abram0,abram1,abram2
c
c       This subroutine evaluates the first n+1 Abramowitz functions of the
c       argument z. The user also has the option of evaluating the 
c       functions J_n(z) scaled by the (complex) coefficient e^{\nu}
c       with \nu=3(z/2)^(2/3). 
c       This option is provided via the parameter ifexpon (see below)
c
c
c                      input parameters:
c
c  z - the complex number for which the Abramowitz functions
c        J_0, ..., J_n are to be evaluated
c  n - the highest order of any Abramowitz function to be evaluated
c  ifexpon - the integer parameter telling the subroutine whether
c        to calculate the actual values of the Abramowitz functions,
c        or the values of Abramowitz functions scaled by e^{\nu}.
c        Permitted values: 0 and 1. 
c    ifexpon = 1 will cause the subroutine to evaluate the Abramowitz functions
c        honestly
c    ifexpon = 0 will cause the subroutine to scale the Abramowitz functions
c        by e^{\nu}.
c
c                      output parameters:
c
c  abrams - the first n+1 Abramowitz functions of the (complex) argument z.
c        Please note that abrams(1) is the Abramowitz function of order 0,
c        abrams(2) is the Abramowitz function of order 1, ..., abrams(n+1)
c        is the Abramowitz function of order n
c
c       . . . evaluate the functions J_0,J_1, J_2
c
        call abram0(z,abrams(1),ifexpon)
        call abram1(z,abrams(2),ifexpon)
        call abram2(z,abrams(3),ifexpon)
c
c
c       conduct recursion
c
        do 1200 i1=3,n
c
        abrams(i1+1)=((i1-1)*abrams(i1-1)+z*abrams(i1-2))/2
 1200 continue
c
        return
        end
c
c
c
c
c
        subroutine abramn(z,jn,n,ifexpon)
        implicit real *8 (a-h,o-z)
        complex *16 z,jn,jnm1,jnm2,jnm3
        external abram0,abram1,abram2,abramm1
c
c       This subroutine evaluates the Abramowitz function J_n of the
c       argument z. The user also has the option of evaluating the 
c       function J_n(z) scaled by the (complex) coefficient e^{\nu}
c       with \nu=3(z/2)^(2/3). 
c       This option is provided via the parameter ifexpon (see below)
c
c
c                      input parameters:
c
c  z - the complex number for which the Abramowitz function
c        J_n are to be evaluated
c  n - the order of the Abramowitz function to be evaluated
c  ifexpon - the integer parameter telling the subroutine whether
c        to calculate the actual value of the Abramowitz function,
c        or the value of Abramowitz function scaled by e^{\nu}.
c        Permitted values: 0 and 1. 
c    ifexpon = 1 will cause the subroutine to evaluate the Abramowitz function
c        honestly
c    ifexpon = 0 will cause the subroutine to scale the Abramowitz function
c        by e^{\nu}.
c
c                      output parameters:
c
c  jn - the Abramowitz function J_n(z).
c
c       . . . evaluate the functions J_0,J_1, J_2
c
        if (n .eq. -1) then
           call abramm1(z,jn,ifexpon)
           return
        elseif (n .eq. 0) then
           call abram0(z,jn,ifexpon)
           return
        elseif (n .eq. 1) then
           call abram1(z,jn,ifexpon)
           return
        elseif (n .eq. 2) then
           call abram2(z,jn,ifexpon)
           return
        else
           call abram0(z,jnm3,ifexpon)
           call abram1(z,jnm2,ifexpon)
           call abram2(z,jnm1,ifexpon)
c
c
c       conduct recursion
c
           do 1200 k=3,n
c     
              jn=((k-1)*jnm2+z*jnm3)/2
              jnm3=jnm2
              jnm2=jnm1
              jnm1=jn
 1200      continue
c
           return
        endif
        end
c
c
c
c
c
