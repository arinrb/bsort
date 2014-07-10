!> @ingroup quick_sort
!> 
!> @brief 
!> Run an quick sort on a vector of #DATA_FULL# values. 
!>
!> @details 
!> Run an quick sort on a vector of #DATA_FULL# values to sort them in a specified order. #IF#MAP#THEN#The vector of intergers #MAP_NAME# is permuted in the same way that the vector vec is permuted to be sorted. It is important that #MAP_VAR# be of equal or greather length than vec.#ENDIF#
!>
!> @param vec
!> The vector to be sorted.
!>
#IF#MAP#!> @param #MAP_VAR#
#IF#MAP#!> Vector of intergers which is permuted in the same way that vec is permuted. If #MAP_NAME# is a vector of values 1 to N, where N is the length of vec, than, #MAP_NAME# is the map from vec's original value to vec's final value after the sort.
#IF#MAP#!> 
!> @param ascending
!> Indicates if the ordering is ascending or decending.
!> 
!> | Value | Meaning         |
!> |:-----:| :-------------- |
!> | true  | Ascending order |
!> | false | Decending order |
!>
#IF#MAP#!> @warning
#IF#MAP#!> The length of #MAP_VAR# is not checked within this subroutine. If the length of vec is larger than the length of #MAP_NAME#, than this subroutine may attempt to access elements of #MAP_NAME# that do not exist.
#IF#MAP#!> 
!> @author Arin R. Bratt
!> @date 07/07/2014
!pure subroutine quick_sort_vec_#MAP_NAME#_#DATA_NAME#(vec#MAP_ARG#,ascending)
subroutine quick_sort_vec_#MAP_NAME#_#DATA_NAME#(vec#MAP_ARG#,ascending)
  ! Arguments
  #DATA_FULL#, intent(inout) :: vec(:)
  #IF#MAP#integer, intent(inout) :: #MAP_VAR#(:)
  logical, intent(in) :: ascending
  
  ! Main
  if (ascending) then
     call quick_sort_vec_asc_#MAP_NAME#_#DATA_NAME#(vec#MAP_ARG#)
  else
     call quick_sort_vec_dec_#MAP_NAME#_#DATA_NAME#(vec#MAP_ARG#)
  end if
end subroutine quick_sort_vec_#MAP_NAME#_#DATA_NAME#


