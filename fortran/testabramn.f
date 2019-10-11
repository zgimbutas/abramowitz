        implicit real *8 (a-h,o-z)
        complex *16 z,j0,ima,ztest(1000 000),jtest(1000 000),
     1    jtest2(1000 000),jntest(10 000),nu
        real *8 jtestr(1000 0000),rerrors(10),
     1      jtesti(1000 0000),xtest(1000 0000),ytest(1000 0000)
        data ima/(0.0d0,1.0d0)/

        call prini(6,13)

        n=100 
        
        ntest=100 000
        OPEN(UNIT=66,FILE="../mathematica/xntest.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) xtest(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/yntest.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) ytest(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/jntestr.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) jtestr(i)
        enddo
        close(66)

        OPEN(UNIT=66,FILE="../mathematica/jntesti.txt",
     1      FORM="FORMATTED",STATUS="OLD",ACTION="READ")        
        do i=1,ntest
           read(66,*) jtesti(i)
        enddo
        close(66)

        do i=1,ntest
           ztest(i)=xtest(i)+ima*ytest(i)
        enddo

        do i=1,ntest
           jtest(i)=jtestr(i)+ima*jtesti(i)
           nu=3*(ztest(i)/2)**(2.0d0/3)
           jtest(i)=jtest(i)*exp(-nu)
        enddo
        
        ifexpon=1
        t1=second()
        do i=1,ntest
c           call abramns(ztest(i),jntest,n,ifexpon)
c           jtest2(i)=jntest(n+1)
           call abramn(ztest(i),jtest2(i),n,ifexpon)
        enddo
        t2=second()
        call prin2('evaluation time of J_n=*',t2-t1,1)

cccc        t1=second()
cccc        do i=1,ntest
cccc           j0=exp(ztest(i))
cccc        enddo
cccc        t2=second()
cccc        call prin2('evaluation time of complex exponentials=*',t2-t1,1)
        
        dmax=0
        imax=0
        do i=1,ntest
           dd=abs((jtest(i)-jtest2(i))/jtest(i))
           if (dd .gt. 1d-14) then
              print *, dd, ztest(i)
           endif
           az=abs(ztest(i))
           if (az .lt. 1) then
              if (rerrors(1) .lt. dd) then
                 rerrors(1) = dd
              endif
           elseif (az .ge. 1 .and. az .lt. 3) then
              if (rerrors(2) .lt. dd) then
                 rerrors(2) = dd
              endif
           elseif (az .ge. 3 .and. az .lt. 15) then
              if (rerrors(3) .lt. dd) then
                 rerrors(3) = dd
              endif
           elseif (az .ge. 15 .and. az .lt. 120) then
              if (rerrors(4) .lt. dd) then
                 rerrors(4) = dd
              endif
           elseif (az .gt. 120) then
              if (rerrors(5) .lt. dd) then
                 rerrors(5) = dd
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

        print *, 'done with testing J_n'

        write(31,*) '{S} &  ${Q_1}$ &  ${Q_2}$ &  ${Q_3}$ & {A}\\'
 1600   format(4(2x,ES8.2,'&'), 2x, ES8.2, '\\')
        write(31,1600) (rerrors(j), j=1,5)
        
        stop
        end
