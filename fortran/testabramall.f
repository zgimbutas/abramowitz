        implicit real *8 (a-h,o-z)
        complex *16 z,j0,ima,ztest(1000 000),jtest(1000 000),
     1    jtest2(1000 000),jtest3(1000 000)
        real *8 rtest(1000 0000),thetatest(1000 0000),jtestr(1000 0000),
     1      jtesti(1000 0000),xtest(1000 0000),ytest(1000 0000),
     2      rerrors(5,4),times(4,2)
        data ima/(0.0d0,1.0d0)/

        call prini(6,13)

        do i=1,4
           do j=1,5
              rerrors(j,i)=0
           enddo
        enddo
        
        ntest=10000
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
c           ztest(i) = ztest(i)/10
           write(79,*) dble(ztest(i)), imag(ztest(i))
        enddo

        do i=1,ntest
           jtest(i)=jtestr(i)+ima*jtesti(i)
        enddo


        ifexpon=0
        t1=second()
        do k = 1,10
        do i=1,ntest
           call abramm1(ztest(i),jtest2(i),ifexpon)
        enddo
        enddo
        t2=second()
        call prin2('evaluation time of J_{-1}=*',t2-t1,1)
        times(1,1)=t2-t1
        
        t1=second()
        do k = 1,10
        do i=1,ntest
           jtest3(i)=exp(ztest(i))
        enddo
        enddo
        t2=second()
        write(11,*) jtest3(1)
        call prin2('evaluation time of complex exponentials=*',t2-t1,1)
        times(1,2)=t2-t1
        
        dmax=0
        imax=0
        do i=1,ntest
           dd=abs((jtest(i)-jtest2(i))/jtest(i))
           if (dd .gt. 1d-14) then
              print *, dd, ztest(i)
           endif
           az=abs(ztest(i))
           if (az .lt. 1) then
              if (rerrors(1,1) .lt. dd) then
                 rerrors(1,1) = dd
              endif
           elseif (az .ge. 1 .and. az .lt. 3) then
              if (rerrors(2,1) .lt. dd) then
                 rerrors(2,1) = dd
              endif
           elseif (az .ge. 3 .and. az .lt. 15) then
              if (rerrors(3,1) .lt. dd) then
                 rerrors(3,1) = dd
              endif
           elseif (az .ge. 15 .and. az .lt. 120) then
              if (rerrors(4,1) .lt. dd) then
                 rerrors(4,1) = dd
              endif
           elseif (az .gt. 120) then
              if (rerrors(5,1) .lt. dd) then
                 rerrors(5,1) = dd
              endif
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

ccc        ntest=100 000
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
c           ztest(i) = ztest(i)/10
           write(80,*) dble(ztest(i)), imag(ztest(i))
        enddo

        do i=1,ntest
           jtest(i)=jtestr(i)+ima*jtesti(i)
        enddo

        ifexpon=0
        t1=second()
        do k=1,10
        do i=1,ntest
           call abram0(ztest(i),jtest2(i),ifexpon)
        enddo
        enddo
        t2=second()
        call prin2('evaluation time of J_0=*',t2-t1,1)
        times(2,1)=t2-t1

        t1=second()
        do k=1,10
        do i=1,ntest
           jtest3(i)=exp(ztest(i))
        enddo
        enddo
        t2=second()
        write(11,*) jtest3(1)
        call prin2('evaluation time of complex exponentials=*',t2-t1,1)
        times(2,2)=t2-t1
        
        dmax=0
        imax=0
        do i=1,ntest
           dd=abs((jtest(i)-jtest2(i))/jtest(i))
           if (dd .gt. 1d-14) then
              print *, dd, ztest(i)
           endif
           az=abs(ztest(i))
           if (az .lt. 1) then
              if (rerrors(1,2) .lt. dd) then
                 rerrors(1,2) = dd
              endif
           elseif (az .ge. 1 .and. az .lt. 3) then
              if (rerrors(2,2) .lt. dd) then
                 rerrors(2,2) = dd
              endif
           elseif (az .ge. 3 .and. az .lt. 15) then
              if (rerrors(3,2) .lt. dd) then
                 rerrors(3,2) = dd
              endif
           elseif (az .ge. 15 .and. az .lt. 120) then
              if (rerrors(4,2) .lt. dd) then
                 rerrors(4,2) = dd
              endif
           elseif (az .gt. 120) then
              if (rerrors(5,2) .lt. dd) then
                 rerrors(5,2) = dd
              endif
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

ccc        ntest=100 000
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
c           ztest(i) = ztest(i)/10
           write(81,*) dble(ztest(i)), imag(ztest(i))
        enddo

        do i=1,ntest
           jtest(i)=jtestr(i)+ima*jtesti(i)
        enddo

        ifexpon=0
        t1=second()
        do k=1,10
        do i=1,ntest
           call abram1(ztest(i),jtest2(i),ifexpon)
        enddo
        enddo
        t2=second()
        call prin2('evaluation time of J_1=*',t2-t1,1)
        times(3,1)=t2-t1

        t1=second()
        do k=1,10
        do i=1,ntest
           jtest3(i)=exp(ztest(i))
        enddo
        enddo
        t2=second()
        write(11,*) jtest3(1)
        call prin2('evaluation time of complex exponentials=*',t2-t1,1)
        times(3,2)=t2-t1
        
        dmax=0
        imax=0
        do i=1,ntest
           dd=abs((jtest(i)-jtest2(i))/jtest(i))
           if (dd .gt. 1d-14) then
              print *, dd, ztest(i)
           endif
           az=abs(ztest(i))
           if (az .lt. 1) then
              if (rerrors(1,3) .lt. dd) then
                 rerrors(1,3) = dd
              endif
           elseif (az .ge. 1 .and. az .lt. 3) then
              if (rerrors(2,3) .lt. dd) then
                 rerrors(2,3) = dd
              endif
           elseif (az .ge. 3 .and. az .lt. 15) then
              if (rerrors(3,3) .lt. dd) then
                 rerrors(3,3) = dd
              endif
           elseif (az .ge. 15 .and. az .lt. 120) then
              if (rerrors(4,3) .lt. dd) then
                 rerrors(4,3) = dd
              endif
           elseif (az .gt. 120) then
              if (rerrors(5,3) .lt. dd) then
                 rerrors(5,3) = dd
              endif
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

ccc        ntest=100 000
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
c           ztest(i)=xtest(i)+ima*ytest(i)
c           ztest(i)=rtest(i)
c           ztest(i) = ztest(i)/10
           write(82,*) dble(ztest(i)), imag(ztest(i))
        enddo

        do i=1,ntest
           jtest(i)=jtestr(i)+ima*jtesti(i)
        enddo
        
        ifexpon=0
        t1=second()
        do k=1,10
        do i=1,ntest
           call abram2(ztest(i),jtest2(i),ifexpon)
        enddo
        enddo
        t2=second()
        call prin2('evaluation time of J_2=*',t2-t1,1)
        times(4,1)=t2-t1

        t1=second()
        do k=1,10
        do i=1,ntest
           jtest3(i)=exp(ztest(i))
        enddo
        enddo
        t2=second()
        write(11,*) jtest3(1)
        call prin2('evaluation time of complex exponentials=*',t2-t1,1)
        times(4,2)=t2-t1
        
        dmax=0
        imax=0
        do i=1,ntest
           dd=abs((jtest(i)-jtest2(i))/jtest(i))
           if (dd .gt. 1d-14) then
              print *, dd, ztest(i)
           endif
           az=abs(ztest(i))
           if (az .lt. 1) then
              if (rerrors(1,4) .lt. dd) then
                 rerrors(1,4) = dd
              endif
           elseif (az .ge. 1 .and. az .lt. 3) then
              if (rerrors(2,4) .lt. dd) then
                 rerrors(2,4) = dd
              endif
           elseif (az .ge. 3 .and. az .lt. 15) then
              if (rerrors(3,4) .lt. dd) then
                 rerrors(3,4) = dd
              endif
           elseif (az .ge. 15 .and. az .lt. 120) then
              if (rerrors(4,4) .lt. dd) then
                 rerrors(4,4) = dd
              endif
           elseif (az .gt. 120) then
              if (rerrors(5,4) .lt. dd) then
                 rerrors(5,4) = dd
              endif
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
        
        write(29,*) '  &     S     &    Q_1 &     Q_2 &    Q_3 &    A\\'
 1600   format('J_{',I2,'}',2x,'&',4(2x,ES8.2,'&'), 2x, ES8.2, '\\')
        do i=1,4
           write(29,1600) i-2, (rerrors(j,i), j=1,5)
        enddo

        write(30,*) '  &     J_{-1} &     J_0 &     J_1 &     J_2\\'
 1800 format('T_E &', 3(2x,ES8.2,'&'),2x,ES8.2,'\\')
        do i=1,2
           write(30,1800) (times(j,i), j=1,4)
        enddo
        
        stop
        end
