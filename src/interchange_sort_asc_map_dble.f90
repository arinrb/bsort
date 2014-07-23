!> @ingroup interchange_sort_asc
!> 
!> @brief 
!> Run an interchange sort on a vector of double precision values. 
!>
!> @details 
!> Run an ascending on a vector of double precision values to sort them in the specified order.The vector of intergers map is permuted in the same way that the vector vec is permuted to be sorted. It is important that map be at least as long as vec.
!>
!> @param vec
!> The vector double precision values to be sorted.
!>
!> @param map
!> Vector of intergers which is permuted in the same way that vec is permuted. If map is a vector of values 1 to N, where N is the length of vec, than, map is the map from vec's original value to vec's final value after the sort.
!> 
!> @warning
!> The length of map is not checked within this subroutine. If the length of vec is larger than the length of map, than this subroutine may attempt to access elements outside of map.
!> 
!> @author Arin R. Bratt
!> @date 11/07/2014
pure subroutine interchange_sort_asc_map_dble(vec,map)
  ! Arguments
  double precision, intent(inout) :: vec(:)
  integer, intent(inout) :: map(:)
  
  ! Variables
  integer :: i
  integer :: j
  double precision :: swap_value
  
  ! The interchange sort
  do i = 1,size(vec,1) - 1
     do j = i + 1,size(vec,1)
        if (vec(i) > vec(j)) then
           swap_value = vec(i)
           vec(i) = vec(j)
           vec(j) = swap_value
            swap_value = map(i)
            map(i) = map(j)
            map(j) = swap_value
        end if
     end do
  end do
end subroutine interchange_sort_asc_map_dble


