!> @ingroup insertion_sort_asc
!> 
!> @brief 
!> Run an insertion sort on a vector of double precision values. 
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
pure subroutine insertion_sort_asc_map_dble(vec,map)
  ! Arguments
  double precision, intent(inout) :: vec(:)
  integer, intent(inout) :: map(:)
  
  ! Variables
  double precision :: double_precision_value
  double precision :: swap_value
  integer :: i
  integer :: j
  
  
  ! Sort to the first element
  if (vec(size(vec,1)) > vec(1)) then
     double_precision_value = vec(1)
  else
     double_precision_value = vec(size(vec,1))
     vec(size(vec,1)) = vec(1)
  end if
  
  do i = size(vec,1) - 1,2,-1
     if (double_precision_value > vec(i)) then
        ! Swap double precision values double_precision_value and vec(i).
        swap_value = double_precision_value
        double_precision_value = vec(i)
        vec(i) = swap_value
     end if
  end do

  ! Run regualr insertion sort
  do j = 3,size(vec,1)
     swap_value = vec(j)
     i = j - 1
     if (vec(i) > swap_value) then
        vec(j) = vec(i)
        i = i - 1
        do
           if (.not. vec(i) > swap_value) exit
           vec(i + 1) = vec(i)
           i = i - 1
        end do
        vec(i + 1) = swap_value
     end if
  end do
end subroutine insertion_sort_asc_map_dble


