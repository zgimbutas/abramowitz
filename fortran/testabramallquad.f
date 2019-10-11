        implicit real *8 (a-h,o-z)
        complex *16 z,j0,ima,ztest(1000 000),jtest(1000 000),
     1    jtest2(1000 000),jtest3(1000 000)
        real *8 rtest(1000 0000),thetatest(1000 0000),jtestr(1000 0000),
     1      jtesti(1000 0000),xtest(1000 0000),ytest(1000 0000)
        data ima/(0.0d0,1.0d0)/

        call prini(6,13)

        ntest=10 000
        OPEN(UNIT=66,FILE="../mathematica/rm1test.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) rtest(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/thetam1test.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) thetatest(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/jm1testr.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) jtestr(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/jm1testi.txt",
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
        t1=second()
        do i=1,ntest
           call abramm1(ztest(i),jtest2(i),ifexpon)
        enddo
        t2=second()
        call prin2('evaluation time of J_{-1}=*',t2-t1,1)

        t1=second()
        do i=1,ntest
           jtest3(i)=exp(ztest(i))
        enddo
        t2=second()
        write(11,*) jtest3(1)
        call prin2('evaluation time of complex exponentials=*',t2-t1,1)
        
        dmax=0
        imax=0
        do i=1,ntest
           dd=abs((jtest(i)-jtest2(i))/jtest(i))
           if (dd .gt. 1d-32) then
              print *, dd, ztest(i)
           endif
           if (dmax .lt. dd) then
              dmax=dd
              imax=i
           endif
        enddo

        print *, 'maximum relative error = ', dmax
        print *, 'occured at ', ztest(imax), imax
        print *, 'true value = ', jtest(imax)
        print *, 'computed value = ', jtest2(imax)        
        print *, 'done with testing J_{-1}'

cc        ntest=10 000
        OPEN(UNIT=66,FILE="../mathematica/r0test.txt",FORM="FORMATTED",
     1      STATUS="OLD",ACTION="READ")        
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

        OPEN(UNIT=66,FILE="../mathematica/j0testr.txt",FORM="FORMATTED",
     1      STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) jtestr(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/j0testi.txt",FORM="FORMATTED",
     1      STATUS="OLD",ACTION="READ")        
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
        t1=second()
        do i=1,ntest
           call abram0(ztest(i),jtest2(i),ifexpon)
        enddo
        t2=second()
        call prin2('evaluation time of J_0=*',t2-t1,1)

        t1=second()
        do i=1,ntest
           jtest3(i)=exp(ztest(i))
        enddo
        t2=second()
        write(11,*) jtest3(1)
        call prin2('evaluation time of complex exponentials=*',t2-t1,1)
        
        dmax=0
        imax=0
        do i=1,ntest
           dd=abs((jtest(i)-jtest2(i))/jtest(i))
           if (dd .gt. 1d-32) then
              print *, dd, ztest(i)
           endif
           if (dmax .lt. dd) then
              dmax=dd
              imax=i
           endif
        enddo

        print *, 'maximum relative error = ', dmax
        print *, 'occured at ', ztest(imax), imax
        print *, 'true value = ', jtest(imax)
        print *, 'computed value = ', jtest2(imax)        
        print *, 'done with testing J_0'

cc        ntest=10 000
        OPEN(UNIT=66,FILE="../mathematica/r1test.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) rtest(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/theta1test.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) thetatest(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/j1testr.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) jtestr(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/j1testi.txt",
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
        t1=second()
        do i=1,ntest
           call abram1(ztest(i),jtest2(i),ifexpon)
        enddo
        t2=second()
        call prin2('evaluation time of J_1=*',t2-t1,1)

        t1=second()
        do i=1,ntest
           jtest3(i)=exp(ztest(i))
        enddo
        t2=second()
        write(11,*) jtest3(1)
        call prin2('evaluation time of complex exponentials=*',t2-t1,1)
        
        dmax=0
        imax=0
        do i=1,ntest
           dd=abs((jtest(i)-jtest2(i))/jtest(i))
           if (dd .gt. 1d-32) then
              print *, dd, ztest(i)
           endif
           if (dmax .lt. dd) then
              dmax=dd
              imax=i
           endif
        enddo

        print *, 'maximum relative error = ', dmax
        print *, 'occured at ', ztest(imax), imax
        print *, 'true value = ', jtest(imax)
        print *, 'computed value = ', jtest2(imax)        
        print *, 'done with testing J_1'

cc        ntest=10 000
        OPEN(UNIT=66,FILE="../mathematica/r2test.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) rtest(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/theta2test.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) thetatest(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/j2testr.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) jtestr(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/j2testi.txt",
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
        t1=second()
        do i=1,ntest
           call abram2(ztest(i),jtest2(i),ifexpon)
        enddo
        t2=second()
        call prin2('evaluation time of J_2=*',t2-t1,1)

        t1=second()
        do i=1,ntest
           jtest3(i)=exp(ztest(i))
        enddo
        t2=second()
        write(11,*) jtest3(1)
        call prin2('evaluation time of complex exponentials=*',t2-t1,1)
        
        dmax=0
        imax=0
        do i=1,ntest
           dd=abs((jtest(i)-jtest2(i))/jtest(i))
           if (dd .gt. 1d-32) then
              print *, dd, ztest(i)
           endif
           if (dmax .lt. dd) then
              dmax=dd
              imax=i
           endif
        enddo

        print *, 'maximum relative error = ', dmax
        print *, 'occured at ', ztest(imax), imax
        print *, 'true value = ', jtest(imax)
        print *, 'computed value = ', jtest2(imax)        

        print *, 'done with testing J_2'
        
        stop
        end
