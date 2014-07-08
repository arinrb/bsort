!> @ingroup interchange_sort_vec_dec
!> 
!> @brief 
!> Run an interchange sort on a vector of real values. 
!>
!> @detials 
!> Run an interchange sort on a vector of real values. The vector of intergers map is permuted in the same way that the vector vec is permuted to be sorted. It is important that map be of equal or greather length than vec.
!>
!> @param vec
!> The vector to be sorted.
!>
!> @param map
!> Vector of intergers which is permuted in the same way that vec is permuted. If map is a vector of values 1 to N, where N is the length of vec, than, map is the map from vec's original value to vec's final value after the sort.
!> 
!> @warning
!> The length of map is not checked within this subroutine. If the length of vec is larger than the length of map, than this subroutine may attempt to access elements of map that do not exist.
!> 
!> @author Arin R. Bratt
!> @date 07/07/2014
pure subroutine interchange_sort_vec_dec_map_real(vec,map)
  ! Arguments
  real, intent(inout) :: vec(:)
  integer, intent(inout) :: map(:)
  
  ! Variables
  integer :: i
  integer :: j
  
  ! The interchange sort
  do i = 1,size(vec,1) - 1
     j = maxloc(vec(i:),1)
     if(j /= 1) then
        call swap(vec(i),vec(i + j - 1))
        call swap(map(i),map(i + j - 1))
     end if
  end do
end subroutine interchange_sort_vec_dec_map_real


