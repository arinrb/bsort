module ord
  implicit none
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
end module ord


!> @ingroup test
!> @brief
!> Test the quick_sort interface.
!> 
!> @details
!> Test the quick_sort interface for integer values.
!> 
!> @author Arin R. Bratt
!> @date 07/07/2014
program test_quick_sort_int
  use bsort
  use ord

  implicit none 

  ! Parameters
  integer, parameter :: max_order = 5 ! Maximum order of magnitude of elements in vectors to be checked.
  integer, parameter :: test_count = 100 ! Number of tests to be run.
  
  ! Variables
  double precision :: data(10 ** max_order,test_count)
  integer :: data_asc(10 ** max_order,test_count)
  integer :: data_dec(10 ** max_order,test_count)
  integer :: data_rnd(10 ** max_order,test_count)
  integer :: data_eql(10 ** max_order,test_count)
  integer :: sorted_data(10 ** max_order,test_count)
  character(3) :: order_types(3) = ['asc','dec','abs']
  Character(15) :: order_names(3) = ['Ascending      ','Decending      ','Absolute Value ']
  character(20) :: vec_names(4) = ['Ascending Vector    ', 'Decending Vector    ','Random Vector       ','Identicial Vector   ']
  
  real :: times(4)
  real :: start
  real :: end

  integer :: i
  integer :: j
  integer :: k
  integer :: n
  integer :: idx

  logical :: sorted
  character(4) :: passed(4)

  ! Build data
  call random_number(data)
  data = (data - 0.0d0) * 10
  data_asc = int(data)
  do j = 2,size(data_asc,1) 
       data_asc(j,:) = data_asc(j - 1,:) + data_asc(j,:)
  end do
  
  data_dec = int(data)
  do j = 2,size(data_dec,1) 
       data_dec(j,:) = data_dec(j - 1,:) - data_dec(j,:)
  end do
  
  data_rnd = int(data)

  do i = 1,test_count
     data_eql(:,i) = int(data(1,i))
  end do

  ! Headers
  print *
  print '(60("-"))'
  print *,"Test quick_sort with integer values."
  print *,test_count," different vectors."
  print '(60("-"))'
  print *
  print *
  print '(115("-"))'
  print '("Sort By",T20,"Vector Length",T35,A20,T55,A20,T75,A20,T95,A20)',vec_names
  print '(115("-"))'
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
              call quick_sort(sorted_data(1:n,k))
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
              call quick_sort(sorted_data(1:n,k),.false.)
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
              call quick_sort(sorted_data(1:n,k),abs_order_int)
           end do
           call cpu_time(end)
           times(idx) = end - start
           sorted = .true.
           do k = 1,test_count
              if (.not. is_sorted(sorted_data(1:n,k),abs_order_int)) sorted = .false.
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
              call quick_sort(sorted_data(1:n,k))
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
              call quick_sort(sorted_data(1:n,k),.false.)
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
              call quick_sort(sorted_data(1:n,k),abs_order_int)
           end do
           call cpu_time(end)
           times(idx) = end - start
           sorted = .true.
           do k = 1,test_count
              if (.not. is_sorted(sorted_data(1:n,k),abs_order_int)) sorted = .false.
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
              call quick_sort(sorted_data(1:n,k))
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
              call quick_sort(sorted_data(1:n,k),.false.)
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
              call quick_sort(sorted_data(1:n,k),abs_order_int)
           end do
           call cpu_time(end)
           times(idx) = end - start
           sorted = .true.
           do k = 1,test_count
              if (.not. is_sorted(sorted_data(1:n,k),abs_order_int)) sorted = .false.
           end do
        end if

        if (sorted) then
           passed(idx) = 'pass'
        else
           passed(idx) = 'fail'
        end if

        ! Identicial vector
        idx = 4
        sorted_data(1:n,:) = data_eql(1:n,:)
        if (order_types(i) .eq. 'asc') then 
           call cpu_time(start)
           do k = 1,test_count
              call quick_sort(sorted_data(1:n,k))
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
              call quick_sort(sorted_data(1:n,k),.false.)
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
              call quick_sort(sorted_data(1:n,k),abs_order_int)
           end do
           call cpu_time(end)
           times(idx) = end - start
           sorted = .true.
           do k = 1,test_count
              if (.not. is_sorted(sorted_data(1:n,k),abs_order_int)) sorted = .false.
           end do
        end if

        if (sorted) then
           passed(idx) = 'pass'
        else
           passed(idx) = 'fail'
        end if
        
        times = times / real(test_count)
        ! Write line 
        print '(A15,T20,I8,T35,A4,"(",F10.8,"sec)",T55,A4,"(",F10.8,"sec)",T75,A4,"(",F10.8,"sec)",T95,A4,"(",F10.8,"sec)")',&
             order_names(i),&
             n,&
             passed(1),&
             times(1),&
             passed(2),&
             times(2),&
             passed(3),&
             times(3),&
             passed(4),&
             times(4)
             
     end do
  end do
  print '(115("-"))'
  print *
end program test_quick_sort_int

     
  
