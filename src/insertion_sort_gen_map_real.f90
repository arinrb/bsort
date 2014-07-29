!> @ingroup insertion_sort_gen
!> 
!> @brief 
!> Run an insertion sort on a vector of real values. 
!>
!> @details 
!> Run the specified on a vector of real values to sort them in the specified order.The vector of intergers map is permuted in the same way that the vector vec is permuted to be sorted. It is important that map be at least as long as vec.
!>
!> @param vec
!> The vector real values to be sorted.
!>
!> @param map
!> Vector of intergers which is permuted in the same way that vec is permuted. If map is a vector of values 1 to N, where N is the length of vec, than, map is the map from vec's original value to vec's final value after the sort.
!> 
!> @param ord
!> A logical function which describes the ordering used. The function must take two real arguments and return true if and only if the first argument must proceed the second argument in the order.
!>
!> @warning
!> The argument types and counts of ord are not checked within this subroutine.
!> 
!> @warning
!> The length of map is not checked within this subroutine. If the length of vec is larger than the length of map, than this subroutine may attempt to access elements outside of map.
!> 
!> @author Arin R. Bratt
!> @date 11/07/2014
subroutine insertion_sort_gen_map_real(vec,map,ord)
  ! Arguments
  real, intent(inout) :: vec(:)
  integer, intent(inout) :: map(:)
  procedure(logical) :: ord
  
  ! Variables
  real :: real_value
  real :: swap_value
  integer :: i
  integer :: j
  
  
  ! Sort to the first element
  if (ord(vec(size(vec,1)),vec(1))) then
     real_value = vec(1)
  else
     real_value = vec(size(vec,1))
     vec(size(vec,1)) = vec(1)
  end if
  
  do i = size(vec,1) - 1,2,-1
     if (ord(real_value,vec(i))) then
        ! Swap real values real_value and vec(i).
        swap_value = real_value
        real_value = vec(i)
        vec(i) = swap_value
     end if
  end do

  ! Run regualr insertion sort
  do j = 3,size(vec,1)
     swap_value = vec(j)
     i = j - 1
     if (ord(vec(i),swap_value)) then
        vec(j) = vec(i)
        i = i - 1
        do
           if (.not. ord(vec(i),swap_value)) exit
           vec(i + 1) = vec(i)
           i = i - 1
        end do
        vec(i + 1) = swap_value
     end if
  end do
end subroutine insertion_sort_gen_map_real


