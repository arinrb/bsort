!> @ingroup interchange_sort_#ORD_NAME#
!> 
!> @brief 
!> Run an interchange sort on a vector of #DATA_FULL# values. 
!>
!> @details 
!> Run an interchange sort on a vector of #DATA_FULL# values to sort them in #ORD_DOCREF# order. #IF#MAP#THEN#The vector of intergers #MAP_NAME# is permuted in the same way that the vector vec is permuted to be sorted. It is important that #MAP_VAR# be of equal or greather length than vec.#ENDIF#
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
#IF#ORD#gen#!> @warning
#IF#ORD#gen#!> The argument types and counts of #ORD_VAR# are not checked within this subroutine.
#IF#ORD#gen#!> 
#IF#MAP#!> @warning
#IF#MAP#!> The length of #MAP_VAR# is not checked within this subroutine. If the length of vec is larger than the length of #MAP_NAME#, than this subroutine may attempt to access elements of #MAP_NAME# that do not exist.
#IF#MAP#!> 
!> @author Arin R. Bratt
!> @date 07/07/2014
#IF#ORD#gen#THEN##ELSE#pure#ENDIF# subroutine interchange_sort_vec_#ORD_NAME#_#MAP_NAME#_#DATA_NAME#(vec#MAP_ARG##ORD_ARG#)
  ! Arguments
  #DATA_FULL#, intent(inout) :: vec(:)
  #IF#MAP#integer, intent(inout) :: #MAP_VAR#(:)
  #IF#ORD#gen#procedure(logical) :: #ORD_VAR#
  
  ! Variables
  integer :: i
  integer :: j
  
  ! The interchange sort
  do i = 1,size(vec,1) - 1
     #CC# generic sort
     #IF#ORD#gen#do j = i + 1,size(vec,1)
        #IF#ORD#gen#if (#ORD#vec(i)#vec(j)#) then
            #IF#ORD#gen#call swap(vec(i),vec(j))
            #IF#ORD#gen##IF#MAP#call swap(#MAP_VAR#(i),#MAP_VAR#(j))
        #IF#ORD#gen#end if
     #IF#ORD#gen#end do
     #CC#
     #CC# ascedning and decending sort
     #IF#ORD#asc#j = minloc(vec(i:),1)
     #IF#ORD#dec#j = maxloc(vec(i:),1)
     #IF#NOT#ORD#gen#if(j /= 1) then
        #IF#NOT#ORD#gen#call swap(vec(i),vec(i + j - 1))
        #IF#NOT#ORD#gen##IF#MAP#call swap(#MAP_VAR#(i),#MAP_VAR#(i + j - 1))
     #IF#NOT#ORD#gen#end if
  end do
end subroutine interchange_sort_vec_#ORD_NAME#_#MAP_NAME#_#DATA_NAME#


