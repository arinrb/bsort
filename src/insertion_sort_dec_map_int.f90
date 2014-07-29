!> @ingroup insertion_sort_dec
!> 
!> @brief 
!> Run an insertion sort on a vector of integer values. 
!>
!> @details 
!> Run a decending on a vector of integer values to sort them in the specified order.The vector of intergers map is permuted in the same way that the vector vec is permuted to be sorted. It is important that map be at least as long as vec.
!>
!> @param vec
!> The vector integer values to be sorted.
!>
!> @param map
!> Vector of intergers which is permuted in the same way that vec is permuted. If map is a vector of values 1 to N, where N is the length of vec, than, map is the map from vec's original value to vec's final value after the sort.
!> 
!> @warning
!> The length of map is not checked within this subroutine. If the length of vec is larger than the length of map, than this subroutine may attempt to access elements outside of map.
!> 
!> @author Arin R. Bratt
!> @date 11/07/2014
pure subroutine insertion_sort_dec_map_int(vec,map)
  ! Arguments
  integer, intent(inout) :: vec(:)
  integer, intent(inout) :: map(:)
  
  ! Variables
  integer :: integer_value
  integer :: swap_value
  integer :: i
  integer :: j
  
  
  ! Sort to the first element
  if (vec(size(vec,1)) < vec(1)) then
     integer_value = vec(1)
  else
     integer_value = vec(size(vec,1))
     vec(size(vec,1)) = vec(1)
  end if
  
  do i = size(vec,1) - 1,2,-1
     if (integer_value < vec(i)) then
        ! Swap integer values integer_value and vec(i).
        swap_value = integer_value
        integer_value = vec(i)
        vec(i) = swap_value
     end if
  end do

  ! Run regualr insertion sort
  do j = 3,size(vec,1)
     swap_value = vec(j)
     i = j - 1
     if (vec(i) < swap_value) then
        vec(j) = vec(i)
        i = i - 1
        do
           if (.not. vec(i) < swap_value) exit
           vec(i + 1) = vec(i)
           i = i - 1
        end do
        vec(i + 1) = swap_value
     end if
  end do
end subroutine insertion_sort_dec_map_int


