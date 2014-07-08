!> @ingroup test
!> 
!> @brief
!> Run tests on the interchange_sort interface.
!> 
!> @brief
!> Run a series of tests on the interchange_sort interface.
!>
!> @author Arin R. Bratt
!> @date 07/07/2014

subroutine test_interchange_sort()
  use bsort
  
  ! Parameters
  integer, parameter :: max_ord = 4       ! Maximum order of magnitude of elements to check
  integer, parameter :: test_count = 1000 ! Number of tests to be run
  
  ! Variables
  integer :: data_int(10 ** max_ord,test_count)
  real :: data_real(10 ** max_ord,test_count)
  double precision :: data_dble(10 ** max_ord,test_count)
  double precision :: data(10 ** max_ord,test_count)
  character(3) :: ords(3) = ['asc','dec',rnd']
  real :: time
  real :: start
  real :: end
  integer :: i
  integer :: j
  integer :: k
  integer :: n
  integer :: temp
  logical :: sorted 
  
  ! Main loop
  do i = 1,size(ords,1)
    ! Build data
    call random_number(data)
    data = (data - 0.50d0) * 1000.0d0
    print *
    if (ords(i) .eq. 'asc') then
      ! Build ascending order
      do j = 1,test_count
        do k = 1,10 ** max_ord - 1
          temp = minloc(data(k:,j)) + k - 1
          if (temp > k) call swap(data,i,j)
        end do
      end do
      print '(I5," Ascending ordered vectors")',test_count
    elseif (ord(i) .eq. 'dec') then
      ! Build decending order
      do j = 1,test_count
        do k = 1,10 ** max_ord - 1
          temp = maxloc(data(k:,j)) + k - 1
          if (temp > k) call swap(data,i,j)
        end do
      end do 
      print '(I5," Decending ordered vectors")',test_count
    else
      ! Do nothing for random order.
      print '(I5," Random ordered vectors")',test_count
    end if
    print *,"----"  
    print *      
    ! Write headers
    print '("Length/Data Type",T20,"Ascending",T45,"Decending",T70,"ABS(X) Order")'
    print '(55("-"))'
    do j = 1,max_ord
      n = 10 ** j
      print '(I5)',n
      data_int(1:n,:) = int(data(1:n,:))
      call cpu_time(start)
      do k = 1,test_count
        call interchange_sort(data_int(1:n,k))
      end do
      call cpu_time(end)
      sorted = .true.
      do k = 1,test_count
        if (.not. is_sorted(data_int(1:n,k))) sorted = .false.
      end do
      if (success) then
        print 
      print '(T5)'
    end do
  end do 
end subroutine test_interchange_sort
