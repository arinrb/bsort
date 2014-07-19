!> @ingroup insertion_sort_asc
!> 
!> @brief 
!> Run an insertion sort on a vector of real values. 
!>
!> @details 
!> Run an ascending on a vector of real values to sort them in the specified order.
!>
!> @param vec
!> The vector real values to be sorted.
!>
!> @author Arin R. Bratt
!> @date 11/07/2014
pure subroutine insertion_sort_asc_real(vec)
  ! Arguments
  real, intent(inout) :: vec(:)
  
  ! Variables
  real :: real_value
  real :: swap_value
  integer :: i
  integer :: j
  
  
  ! Sort to the first element
  if (vec(size(vec,1)) > vec(1)) then
     real_value = vec(1)
  else
     real_value = vec(size(vec,1))
     vec(size(vec,1)) = vec(1)
  end if
  
  do i = size(vec,1) - 1,2,-1
     if (real_value > vec(i)) then
        swap_value = real_value
        real_value = vec(i)
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
end subroutine insertion_sort_asc_real


