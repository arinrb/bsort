#IF#NOT#ORD#gen#!> @ingroup is_sorted_#ORD_NAME#
#IF#ORD#gen#!> @ingroup is_sorted
!>
!> @brief
!> Check if a vector of #DATA_FULL# values is sorted by #ORD_DOCREF# order. 
!> 
!> @details
!> Check if a vector of #DATA_FULL# values is sorted by #ORD_DOCREF# order. Returns a logical value indicating if the vector is sorted.
!> 
!> @result is_sorted
!> Indicates if the vector is sorted.
!> 
!> | Value | Meaning                  |
!> |:-----:|:------------------------ |
!> | true  | The vector is sorted     |
!> | false | The vector is not sorted |
!>
!> @param vec
!> Te vec to be checked for being sorted.
!>
#IF#ORD#gen#!> @param #ORD_VAR#
#IF#ORD#gen#!> A logical function which describes the ordering used. The function must take two #DATA_FULL# arguments and return true if and only if the first argument must proceed the second argument in the order.
#IF#ORD#gen#!>
!> @note
!> Empty and single value vectors are considered sorted.
!>
#IF#ORD#gen#!> @warning
#IF#ORD#gen#!> The argument types and counts of #ORD_VAR# are not checked within this function.
#IF#ORD#gen#!> 
!> @author Arin R. Bratt
!> @date 05/07/2014
#IF#ORD#gen#THEN##ELSE#pure #ENDIF#function is_sorted_vec_#ORD_NAME#_#DATA_NAME#(vec#ORD_ARG#) result(is_sorted)
  ! Result
  logical :: is_sorted

  ! Arguments
  #DATA_FULL#, intent(in) :: vec(:)
  #IF#ORD#gen#procedure(logical) :: #ORD_VAR#
  
  ! Variables
  integer :: i
  
  ! This structure avodies checking empty or single value vectors which are always considered sorted.
  do i = 2,size(vec,1)
     if (#ORD#vec(i - 1)#vec(i)#) then
        is_sorted = .false.
        return
     end if
  end do
  is_sorted = .true.
end function is_sorted_vec_#ORD_NAME#_#DATA_NAME#

