!> @ingroup quick_sort_recursive
!> 
!> @brief 
!> Run a recursive three way quick sort on a vector of integer values. 
!>
!> @details 
!> Run a recursive three way quick sort on a vector of integer values to sort them in a specified order. The vector of intergers map is permuted in the same way that the vector vec is permuted to be sorted. It is important that map be of equal or greather length than vec.
!>
!> @param vec
!> The vector to be sorted.
!>
!> @param map
!> Vector of intergers which is permuted in the same way that vec is permuted. If map is a vector of values 1 to N, where N is the length of vec, than, map is the map from vec's original value to vec's final value after being sort.
!> 
!> @param ascending
!> Indicates if the ordering is ascending or decending.
!> 
!> | Value | Meaning         |
!> |:-----:| :-------------- |
!> | true  | Ascending order |
!> | false | Decending order |
!>
!> @warning
!> The length of map is not checked within this subroutine. If the length of vec is larger than the length of map, than this subroutine may attempt to access elements of map that do not exist.
!> 
!> @author Arin R. Bratt
!> @date 11/07/2014

pure subroutine quick_sort_recursive_map_int(vec,map,ascending)
  ! Arguments
  integer, intent(inout) :: vec(:)
  integer, intent(inout) :: map(:)
  logical, intent(in) :: ascending
  
  ! Main
  if (ascending) then
     call quick_sort_recursive_asc_map_int(vec,map)
  else
     call quick_sort_recursive_dec_map_int(vec,map)
  end if
end subroutine quick_sort_recursive_map_int
