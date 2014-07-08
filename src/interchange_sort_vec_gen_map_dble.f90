!> @ingroup interchange_sort_gen
!> 
!> @brief 
!> Run an interchange sort on a vector of double precision values. 
!>
!> @details 
!> Run an interchange sort on a vector of double precision values to sort them in the specified order. The vector of intergers map is permuted in the same way that the vector vec is permuted to be sorted. It is important that map be of equal or greather length than vec.
!>
!> @param vec
!> The vector to be sorted.
!>
!> @param map
!> Vector of intergers which is permuted in the same way that vec is permuted. If map is a vector of values 1 to N, where N is the length of vec, than, map is the map from vec's original value to vec's final value after the sort.
!> 
!> @param ord
!> A logical function which describes the ordering used. The function must take two double precision arguments and return true if and only if the first argument must proceed the second argument in the order.
!>
!> @warning
!> The argument types and counts of ord are not checked within this subroutine.
!> 
!> @warning
!> The length of map is not checked within this subroutine. If the length of vec is larger than the length of map, than this subroutine may attempt to access elements of map that do not exist.
!> 
!> @author Arin R. Bratt
!> @date 07/07/2014
 subroutine interchange_sort_vec_gen_map_dble(vec,map,ord)
  ! Arguments
  double precision, intent(inout) :: vec(:)
  integer, intent(inout) :: map(:)
  procedure(logical) :: ord
  
  ! Variables
  integer :: i
  integer :: j
  
  ! The interchange sort
  do i = 1,size(vec,1) - 1
     do j = i + 1,size(vec,1)
        if (ord(vec(i),vec(j))) then
            call swap(vec(i),vec(j))
            call swap(map(i),map(j))
        end if
     end do
  end do
end subroutine interchange_sort_vec_gen_map_dble


