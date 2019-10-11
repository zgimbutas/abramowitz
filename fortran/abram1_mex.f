
        subroutine abram1mex(n,z,j0,ifexpon)
        implicit real *8 (a-h,o-z)
        complex *16 z(n),j0(n)

        do i = 1,n
        call abram1(z(i),j0(i),ifexpon)
        enddo

        return
        end

