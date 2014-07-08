module ord
  implicit none
contains
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
end module ord


!> @ingroup test
!> @brief
!> Test the interchange_sort interface.
!> 
!> @details
!> Test the interchange_sort interface for real values.
!> 
!> @author Arin R. Bratt
!> @date 07/07/2014
program test_interchange_sort_real
  use bsort
  use ord

  implicit none 

  ! Parameters
  integer, parameter :: max_order = 3 ! Maximum order of magnitude of elements in vectors to be checked.
  integer, parameter :: test_count = 1000 ! Number of tests to be run.
  
  ! Variables
  double precision :: data(10 ** max_order,test_count)
  real :: data_asc(10 ** max_order,test_count)
  real :: data_dec(10 ** max_order,test_count)
  real :: data_rnd(10 ** max_order,test_count)
  real :: sorted_data(10 ** max_order,test_count)
  character(3) :: order_types(3) = ['asc','dec','abs']
  Character(15) :: order_names(3) = ['Ascending      ','Decending      ','Absolute Value ']
  character(20) :: vec_names(3) = ['Ascending Vector    ', 'Decending Vector    ','Random Vector       ']
  
  real :: times(3)
  real :: start
  real :: end

  integer :: i
  integer :: j
  integer :: k
  integer :: n
  integer :: idx

  logical :: sorted
  character(4) :: passed(3)

  ! Build data
  call random_number(data)
  data_asc = real(data)
  do i = 1,test_count
     do j = 2,size(data_asc,1) 
        if (data_asc(j,i) < data_asc(j - 1,i)) data_asc(j,i) = data_asc(j - 1,i) + abs(data_asc(j,i))
     end do
  end do
  
  call random_number(data)
  data_dec = real(data)
  do i = 1,test_count
     do j = 2,size(data_dec,1) 
        if (data_dec(j,i) < data_dec(j - 1,i)) data_dec(j,i) = data_dec(j - 1,i) + abs(data_dec(j,i))
     end do
  end do
  
  call random_number(data)
  data_rnd = real(data)

  ! Headers
  print *
  print *,"Test interchange_sort with real values."
  print *,test_count," different vectors."
  print '(40("-"))'
  print *

  print '("Sort By",T20,"Vector Length",T35,A20,T55,A20,T75,A20)',vec_names
  ! Main loop
  do i = 1,size(order_types,1)
     do j = 1,max_order
        n = 10 ** j
       
        ! Ascending 
        idx = 1
        sorted_data(1:n,:) = data_asc(1:n,:)
        if (order_types(i) .eq. 'asc') then 
           call cpu_time(start)
           do k = 1,test_count
              call interchange_sort(sorted_data(1:n,k))
           end do
           call cpu_time(end)
           times(idx) = end - start
           sorted = .true.
           do k = 1,test_count
              if (.not. is_sorted(sorted_data(1:n,k))) sorted = .false.
           end do
        else if(order_types(i) .eq. 'dec') then 
           call cpu_time(start)
           do k = 1,test_count
              call interchange_sort(sorted_data(1:n,k),.false.)
           end do
           call cpu_time(end)
           times(idx) = end - start
           sorted = .true.
           do k = 1,test_count
              if (.not. is_sorted(sorted_data(1:n,k),.false.)) sorted = .false.
           end do
        else
           call cpu_time(start)
           do k = 1,test_count
              call interchange_sort(sorted_data(1:n,k),abs_order_real)
           end do
           call cpu_time(end)
           times(idx) = end - start
           sorted = .true.
           do k = 1,test_count
              if (.not. is_sorted(sorted_data(1:n,k),abs_order_real)) sorted = .false.
           end do
        end if

        if (sorted) then
           passed(idx) = 'pass'
        else
           passed(idx) = 'fail'
        end if
        
        ! Decending 
        idx = 2
        sorted_data(1:n,:) = data_dec(1:n,:)
        if (order_types(i) .eq. 'asc') then 
           call cpu_time(start)
           do k = 1,test_count
              call interchange_sort(sorted_data(1:n,k))
           end do
           call cpu_time(end)
           times(idx) = end - start
           sorted = .true.
           do k = 1,test_count
              if (.not. is_sorted(sorted_data(1:n,k))) sorted = .false.
           end do
        else if(order_types(i) .eq. 'dec') then 
           call cpu_time(start)
           do k = 1,test_count
              call interchange_sort(sorted_data(1:n,k),.false.)
           end do
           call cpu_time(end)
           times(idx) = end - start
           sorted = .true.
           do k = 1,test_count
              if (.not. is_sorted(sorted_data(1:n,k),.false.)) sorted = .false.
           end do
        else
           call cpu_time(start)
           do k = 1,test_count
              call interchange_sort(sorted_data(1:n,k),abs_order_real)
           end do
           call cpu_time(end)
           times(idx) = end - start
           sorted = .true.
           do k = 1,test_count
              if (.not. is_sorted(sorted_data(1:n,k),abs_order_real)) sorted = .false.
           end do
        end if

        if (sorted) then
           passed(idx) = 'pass'
        else
           passed(idx) = 'fail'
        end if

        ! Random
        idx = 3
        sorted_data(1:n,:) = data_rnd(1:n,:)
        if (order_types(i) .eq. 'asc') then 
           call cpu_time(start)
           do k = 1,test_count
              call interchange_sort(sorted_data(1:n,k))
           end do
           call cpu_time(end)
           times(idx) = end - start
           sorted = .true.
           do k = 1,test_count
              if (.not. is_sorted(sorted_data(1:n,k))) sorted = .false.
           end do
        else if(order_types(i) .eq. 'dec') then 
           call cpu_time(start)
           do k = 1,test_count
              call interchange_sort(sorted_data(1:n,k),.false.)
           end do
           call cpu_time(end)
           times(idx) = end - start
           sorted = .true.
           do k = 1,test_count
              if (.not. is_sorted(sorted_data(1:n,k),.false.)) sorted = .false.
           end do
        else
           call cpu_time(start)
           do k = 1,test_count
              call interchange_sort(sorted_data(1:n,k),abs_order_real)
           end do
           call cpu_time(end)
           times(idx) = end - start
           sorted = .true.
           do k = 1,test_count
              if (.not. is_sorted(sorted_data(1:n,k),abs_order_real)) sorted = .false.
           end do
        end if

        if (sorted) then
           passed(idx) = 'pass'
        else
           passed(idx) = 'fail'
        end if
        
        times = times / real(test_count)
        ! Write line 
        print '(A15,T20,I8,T35,A4,"(",F10.8,"sec)",T55,A4,"(",F10.8,"sec)",T75,A4,"(",F10.8,"sec)")',&
             order_names(i),&
             n,&
             passed(1),&
             times(1),&
             passed(2),&
             times(2),&
             passed(3),&
             times(3)
             
     end do
  end do
  print *
end program test_interchange_sort_real

     
  
