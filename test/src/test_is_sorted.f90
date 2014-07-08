module ord
contains
  function abs_order_int(x,y) result(out)
    integer :: x
    integer :: y
    logical :: out
    if (abs(x) > abs(y)) then
       out = .true.
    else
       out = .false.
    end if
  end function abs_order_int
  
  function abs_order_real(x,y) result(out)
    real :: x
    real :: y
    logical :: out
    if (abs(x) > abs(y)) then
       out = .true.
    else
       out = .false.
    end if
  end function abs_order_real
  
  function abs_order_dble(x,y) result(out)
    double precision :: x
    double precision :: y
    logical :: out
    if (abs(x) > abs(y)) then
       out = .true.
    else
       out = .false.
    end if
  end function abs_order_dble
end module ord

!> @ingroup test
!> @brief
!> Test the is_sorted interface.
!> 
!> @details
!> Test the is_sorted interface.
!> 
!> @author Arin R. Bratt
!> @date 07/07/2014
program test_is_sorted
  use bsort
  use ord
  integer, parameter :: n = 10000 ! Length of vector

  double precision :: asc(n) ! Ascending vector
  double precision :: dec(n) ! Decending vector
  double precision :: uns(n) ! Unsorted vector
  double precision :: ors(n) ! Vector sorted by absolute value

  integer :: i
  procedure(logical), pointer :: p => null()
  
  call random_number(uns)
  uns = (uns - 0.5d0) * 10.0d0
  ors = uns
  asc(1) = uns(1)
  dec(1) = uns(1)
  do i = 2,n
     asc(i) = asc(i - 1) + abs(uns(i))
     dec(i) = dec(i - 1) - abs(uns(i))
     ors(i) = (abs(ors(i- 1)) + abs(ors(i))) * ors(i) / abs(ors(i))
  end do

  ! Print intro
  print *
  print *
  print *,"Checking is_sorted"
  print *,"------------------"
  print *

  ! Check ascending
  print *,"Check ascending"
  print '(T20,"ASCENDING (T)",T35,"DECENDING (F)",T50,"SORTED BY ABS (F)",T70,"UNSORTED (F)")'
  print '("INTEGER",T20,L,T35,L,T50,L,T70,L)',&
       is_sorted(int(asc)),&
       is_sorted(int(dec)),&
       is_sorted(int(ors)),&
       is_sorted(int(uns))
  print '("REAL",T20,L,T35,L,T50,L,T70,L)',&
       is_sorted(real(asc)),&
       is_sorted(real(dec)),&
       is_sorted(real(ors)),&
       is_sorted(real(uns))
  print '("DOUBLE PRECISION",T20,L,T35,L,T50,L,T70,L)',&
       is_sorted(dble(asc)),&
       is_sorted(dble(dec)),&
       is_sorted(dble(ors)),&
       is_sorted(dble(uns))
  print *
  ! Check decending
  print *,"Check decending"
  print '(T20,"ASCENDING (F)",T35,"DECENDING (T)",T50,"SORTED BY ABS (F)",T70,"UNSORTED (F)")'
  print '("INTEGER",T20,L,T35,L,T50,L,T70,L)',&
       is_sorted(int(asc),.false.),&
       is_sorted(int(dec),.false.),&
       is_sorted(int(ors),.false.),&
       is_sorted(int(uns),.false.)
  print '("REAL",T20,L,T35,L,T50,L,T70,L)',&
       is_sorted(real(asc),.false.),&
       is_sorted(real(dec),.false.),&
       is_sorted(real(ors),.false.),&
       is_sorted(real(uns),.false.)
  print '("DOUBLE PRECISION",T20,L,T35,L,T50,L,T70,L)',&
       is_sorted(dble(asc),.false.),&
       is_sorted(dble(dec),.false.),&
       is_sorted(dble(ors),.false.),&
       is_sorted(dble(uns),.false.)
  print *
  ! Check generic sorting by abs(x)
  print *,"Check generic, using x > y iff abs(x) > abs(y)"
  print '(T20,"ASCENDING (T)",T35,"DECENDING (F)",T50,"SORTED BY ABS (T)",T70,"UNSORTED (F)")'

  p => abs_order_int
  print '("INTEGER",T20,L,T35,L,T50,L,T70,L)',&
       is_sorted(int(asc),p),&
       is_sorted(int(dec),p),&
       is_sorted(int(ors),p),&
       is_sorted(int(uns),p)

  p => abs_order_real
  print '("REAL",T20,L,T35,L,T50,L,T70,L)',&
       is_sorted(real(asc),p),&
       is_sorted(real(dec),p),&
       is_sorted(real(ors),p),&
       is_sorted(real(uns),p)

  p => abs_order_dble
  print '("DOUBLE PRECISION",T20,L,T35,L,T50,L,T70,L)',&
       is_sorted(dble(asc),p),&
       is_sorted(dble(dec),p),&
       is_sorted(dble(ors),p),&
       is_sorted(dble(uns),p)
   print *
end program test_is_sorted
