!> @ingroup quick_sort_#ORD_NAME#
!>
!> @brief 
!> Sort a vector of #DATA_FULL# values using a quick sort.
!>
!> @details
!> Sort a vector of #DATA_FULL# values using a three partition recursive quick sort that uses a median pivot and uses a interchange sort for short vectors.
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
!>  
!> @note
!> Error will occur if max_interchange_sort_size is less than one.
!>
#IF#ORD#gen#!> @warning
#IF#ORD#gen#!> The argument types and counts of #ORD_VAR# are not checked within this subroutine.
#IF#ORD#gen#!> 
#IF#MAP#!> @warning
#IF#MAP#!> The length of #MAP_VAR# is not checked within this subroutine. If the length of vec is larger than the length of #MAP_NAME#, than this subroutine may attempt to access elements of #MAP_NAME# that do not exist.
#IF#MAP#!> 
!> @author Arin R. Bratt
!> @date 07/07/2014

!#IF#ORD#gen#THEN##ELSE#pure#ENDIF# subroutine quick_sort_vec_#ORD_NAME#_#MAP_NAME#_#DATA_NAME#(vec#MAP_ARG##ORD_ARG#)
!> 
!> @warning
!> Still working!
recursive subroutine quick_sort_vec_#ORD_NAME#_#MAP_NAME#_#DATA_NAME#(vec#MAP_ARG##ORD_ARG#)
  ! Arguments
  #DATA_FULL#, intent(inout) :: vec(:)
  #IF#MAP#integer, intent(inout) :: #MAP_VAR#(:)
  #IF#ORD#gen#procedure(logical) :: #ORD_VAR#

  ! Variables
  integer, parameter :: n = 300
  integer :: low
  integer :: high
  integer :: low_eq
  integer :: high_eq
  integer :: lower(n)
  integer :: upper(n)
  integer :: idx
  #DATA_FULL# :: pivot

  if (size(vec,1) <= 1) return
  idx = 1
  lower(idx) = 1
  upper(idx) = size(vec,1)
  ! Main loop 
  do while(idx > 0)
     ! Initilize values
     low = lower(idx)
     low_eq = lower(idx)
     high = upper(idx)
     high_eq = upper(idx)

     ! Run interchange sort on small vectors (note this is actually max_interchange_sort_size - 1
     if ((high - low) <= max_interchange_sort_size) then
        #IF#MAP#call interchange_sort_vec_#ORD_NAME#_#MAP_NAME#_#DATA_NAME#(vec(low:high)#MAP_ARG#(low:high)#ORD_ARG#)
        #IF#NOT#MAP#call interchange_sort_vec_#ORD_NAME#_#MAP_NAME#_#DATA_NAME#(vec(low:high)#ORD_ARG#)
        idx = idx - 1
        cycle
     end if
     
     ! Build pivot
     pivot = (vec(high) + vec(low)) / 2
     if (#ORD#vec(low)#vec(high)#) call swap(vec(low),vec(high))

     ! Main quicksort loop with three way partition
     do 
        ! Find pivot points
        do
           low = low + 1
           if (.not. #ORD#pivot#vec(low)#) exit
        end do
        do 
           high = high - 1
           if (.not. #ORD#vec(high)#pivot# .or. high == lower(idx)) exit
        end do

        ! Exit if they are on the wrong side of the pivot
        if (low >= high) exit

        ! Run main quick sort swap
        call swap(vec(low),vec(high))

        ! Check for if values are equal to pivot, if so swap
        if (.not. #ORD#vec(high)#pivot#) then
           call swap(vec(high),vec(high_eq))
           high_eq = high_eq - 1
        end if

        if (.not. #ORD#pivot#vec(low)#) then
           call swap(vec(low),vec(low_eq))
           low_eq = low_eq + 1
        end if
     end do
     high = low - 1


     ! Move equals to the middle
     do while(lower(idx) < low_eq)
        low_eq = low_eq - 1
        call swap(vec(low_eq),vec(high))
        high = high - 1
     end do
     
     do while(high_eq < upper(idx))
        high_eq = high_eq + 1
        call swap(vec(high_eq),vec(low))
        low = low + 1
     end do
     
     ! Build Stack
     if (upper(idx) - low > high - lower(idx)) then
        upper(idx + 1) = high
        lower(idx + 1) = lower(idx)
        lower(idx) = low
     else
        upper(idx + 1) = upper(idx)
        lower(idx + 1) = low
        upper(idx) = high
     end if
     idx = idx + 1
  end do
end subroutine quick_sort_vec_#ORD_NAME#_#MAP_NAME#_#DATA_NAME#

