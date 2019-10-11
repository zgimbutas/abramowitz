        implicit real *8 (a-h,o-z)
        complex *16 z,j0,ima,ztest(10000),jtest(10000),jtest2(10000)
        real *8 rtest(10000),thetatest(10000),jtestr(10000),
     1      jtesti(10000)
        data ima/(0.0d0,1.0d0)/

        call prini(6,13)

        ntimes=1

        ntest=1000
        OPEN(UNIT=66,FILE="../mathematica/r0test.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) rtest(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/theta0test.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) thetatest(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/j0testr.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) jtestr(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/j0testi.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) jtesti(i)
        enddo
        close(66)

        do i=1,ntest
           ztest(i)=rtest(i)*exp(ima*thetatest(i))
c           ztest(i)=rtest(i)
        enddo

        do i=1,ntest
           jtest(i)=jtestr(i)+ima*jtesti(i)
        enddo

        ifexpon=0
        do i=1,ntest
           call abram0(ztest(i),jtest2(i),ifexpon)
        enddo

        dmax=0
        imax=0
        do i=1,ntest
           dd=abs((jtest(i)-jtest2(i))/jtest(i))
           if (dd .gt. 1d-14) then
              print *, dd, ztest(i)
           endif
           if (dmax .lt. dd) then
              dmax=dd
              imax=i
           endif
        enddo

        print *, 'maximum relative error = ', dmax
        print *, 'occured at ', ztest(imax), imax
        print *, 'done with testing'
        
cccc        z=2.0d1*ima+5.0d1
cccc        call abram0(z,j0,ifexpon)
cccc        print *, j0

        stop
        end
