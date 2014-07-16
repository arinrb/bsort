!> @ingroup quick_sort_flat_asc
!> 
!> @brief 
!> Run a flat three way quick sort on a vector of double precision values. 
!>
!> @details 
!> Run an ascending on a vector of double precision values to sort them in the specified order.
!>
!> @param vec
!> The vector double precision values to be sorted.
!>
!> @note
!> This flat quick sort works by maintaning a psudo stack.  As the the subroutine runs vec splices of vec are broken into two groups based on comparison to a pivot chosen based on the average value of the first and last element of of the slice.  The same process is then applied to the larger of the two slices.  After a slice is sorted the next smallest slice of vec is sorted.  
!> 
!> Example ignoring the interchange sort     4 3 7 9 1 2
!> i    pivot    lower     upper   
!> 1    3        1         6                |2 1 7 9 3 4|
!> 2    5        3         6                 2 1|4 3 9 7]
!> 3    8        5         6                 2 1 4 3|7 9|
!> 2    4        3         4                 2 1|3 4|7 9
!> 1    1        1         2                |1 2|3 4 7 9
!> 
!> The alogorithm of the flat quick sort is harder to follow than the more conventional flat quick sort; however, it saves system resoruces.  Also on systems with limitations on stack sizes a flat quick sort allows sorting of larger lists.  The natural limit is the value of the vector levels.  This can cause a failure in some cases.  
!>
!> @note
!> Some credit for this implimentation must go to Darel Flex's implimentation that can be found <a href="http://alienryderflex.com/quicksort/">here</a>.
!e
!> @warning
!> Error will occur if max_interchange_sort_size is less than one.
!>>
!> @author Arin R. Bratt
!> @date 11/07/2014
pure subroutine quick_sort_flat_asc_dble(vec)
  ! Arguments
  double precision, intent(inout) :: vec(:)

  ! Parameters
  integer, parameter :: stack_levels = 300

  ! Variables
  integer :: idx
  integer :: low
  integer :: high
  integer :: lower(stack_levels)
  integer :: upper(stack_levels)
  double precision :: pivot
  
  ! Initilize the stack
  idx = 1
  lower(idx) = 1
  upper(idx) = size(vec,1) + 1
  
  ! Main loop
  do while(idx >= 1)     
     ! Sort the slice of vec between lower(idx) and upper(idx)
     low = lower(idx)
     high = upper(idx) - 1
     
     if (low < high) then
        pivot = (vec(high) + vec(low)) / 2
        do while(low < high)
        
           if (high - low < max_interchange_sort_size) then
              ! Run interchange sort on small vectors
              if (low < high) call interchange_sort_asc_dble(vec(low:high))
              idx = idx - 1
           else
              ! Run quick sort on large vectors
              ! This pivot helps avoid n^2 behavior, expect in expontially growning and shrinking (reverse) sorted lists and lists of indentical elements.
              pivot = (vec(high) + vec(low)) / 2
              do
                 ! This loop finds elements on the wrong side of the pivot and swaps until no such elements are left.
                 ! Consider running these in parallel

                 ! Find the first element below the pivot that must be above the pivot.
                 do while(low <= high)
                    if (vec(low) > pivot) exit
                    low = low + 1
                 end do
                 
                 ! Find the first element above the pivot that must be below the pivot.
                 do while (high > lower(idx))
                    if (pivot > vec(high)) exit
                    high = high - 1
                 end do
                 
                 if (high > low) then
                    !If vec(low) must follow vec(high) than swap their values.
                    call swap(vec(low),vec(high))
                    low = low + 1
                    high = high - 1
                 else
                    ! If vec(low) does not have to follow vec(high) than exit.
                    ! There may be a way to rewrite to remove this if.
                    if (low == upper(idx)) then
                       high = low
                       low = low - 1
                    else
                       high = low + 1
                    end if
                    exit
                 end if
              end do

              ! Split splice based on pivot, making sure to throw the smaller splice on the higher end of the stack
              if (upper(idx) - high < low - lower(idx)) then
                 upper(idx + 1) = upper(idx)
                 lower(idx + 1) = high
                 upper(idx) = low
              else
                 upper(idx + 1) = low
                 lower(idx + 1) = lower(idx)
                 lower(idx) = high
              end if
              idx = idx + 1
           end if
        end do
     end if
  end do
end subroutine quick_sort_flat_asc_dble

