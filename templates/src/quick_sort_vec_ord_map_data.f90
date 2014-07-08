!> @ingroup quick_sort_#ORD_NAME#
!>
!> @brief 
!> Sort a vector of #DATA_FULL# values using a quick sort.
!>
!> @details
!> Sort a vector of #DATA_FULL# values using a flatt quick sort.
!> 
!> @param vec
!> The vector to be sorted.
!>
#IF#MAP#!> @param #MAP_VAR#
#IF#MAP#!> Vector of intergers which is permuted in the same way that vec is permuted. If #MAP_NAME# is a vector of values 1 to N, where N is the length of vec, than, #MAP_NAME# is the map from vec's original value to vec's final value after the sort.
#IF#MAP#!> 
#IF#ORD#gen#!> @param #ORD_VAR#
#IF#ORD#gen#!> A logical function which describes the ordering used. The function must take two #DATA_FULL# arguments and return true if and only if the first argument must proceed the second argument in the order.
#IF#ORD#gen#!>
!> @notes 
!> This flat quick sort works by maintaning a psudo stack.  As the the subroutine runs vec splices of vec are broken into two groups based on comparison to a pivot chosen based on the average value of the first and last element of of the slice.  The same process is then applied to the larger of the two slices.  After a slice is sorted the next smallest slice of vec is sorted.  
!> 
!> Example ignoring the interchange sort     4 3 7 9 1 2
!> i    pivot    l_bound   u_bound    
!> 1    3        1         6                |2 1 7 9 3 4|
!> 2    5        3         6                 2 1|4 3 9 7]
!> 3    8        5         6                 2 1 4 3|7 9|
!> 2    4        3         4                 2 1|3 4|7 9
!> 1    1        1         2                |1 2|3 4 7 9
!> 
!> The alogorithm of the flat quick sort is harder to follow than the more conventional flat quick sort; however, it saves system resoruces.  Also on systems with limitations on stack sizes a flat quick sort allows sorting of larger lists.  The natural limit is the value of the vector levels.  This can cause a failure in some cases.  
!>
#IF#ORD#gen#!> @warning
#IF#ORD#gen#!> The argument types and counts of #ORD_VAR# are not checked within this subroutine.
#IF#ORD#gen#!> 
#IF#MAP#!> @warning
#IF#MAP#!> The length of #MAP_VAR# is not checked within this subroutine. If the length of vec is larger than the length of #MAP_NAME#, than this subroutine may attempt to access elements of #MAP_NAME# that do not exist.
#IF#MAP#!> 
!> @author Arin R. Bratt
!> @date 07/07/2014

#IF#ORD#gen#THEN##ELSE#pure#ENDIF# subroutine quick_sort_vec_#ORD_NAME#_#MAP_NAME#_#DATA_NAME#(vec#MAP_ARG##ORD_ARG#)
  ! Arguments
  #DATA_FULL#, intent(inout) :: vec(:)
  #IF#MAP#integer, intent(inout) :: #MAP_VAR#(:)
  #IF#ORD#gen#procedure(logical) :: #ORD_VAR#

  ! Parameters
  integer, parameter :: levels = 300

  ! Variables
  integer :: idx
  integer :: left
  integer :: right
  integer :: lower(n)
  integer :: upper(n)
  integer :: pivot
  
  ! Initilize the stack
  idx = 1
  lower(idx) = 1
  upper(idx) = size(vec,1)
  
  ! Main loop
  do while(idx >= 1)
     
     ! Sort the slice of vec between lower(i) and upper(i)
     left = lower(i)
     right = upper(i)
     if (right - left < max_interchange_sort_size) then
        ! Run interchange sort on small vectors
        if (left < right) call interchange_sort_vec_#ORD_NAME#_#MAP_NAME#_#DATA_NAME#(vec(left:right)#MAP_ARG##ORD_ARG#)
        idx = idx - 1
     else
        ! Run quick sort on large vectors
        ! This pivot helps avoid n^2 behavior, expect in expontially growning and shrinking (reverse) sorted lists and lists of indentical elements
        pivot = (vec(left) + vec(right)) / 2
        left = left - 1
        right = right + 1
        do
           ! This loop finds elements on the wrong side of the pivot and swaps.  If no such elements are found, exit the loop.
           do
              left = left + 1
              if (vec(left) >= pivot) exit
           end do
           do
              right = right - 1
              if (vec(right) <= pivot) exit
           end do
           if (left < right) then
              call swap(vec(left),vec(right))
           elseif(left == right) then
              ! This adjustment avoids over swaping
              if (left == lower(idx)) then
                 left = left + 1
              else
                 right = right - 1
              end if
              exit
           else
              exit
           end if
        end do
        
        ! Split splice based on pivot
        upper(idx + 1) = upper(idx)
        lower(idx + 1) = left
        upper(idx) = right
        idx = idx + 1
     end if
  end do
end subroutine quick_sort_vec_#ORD_NAME#_#MAP_NAME#_#DATA_NAME#
