!> @ingroup insertion_sort_dec
!> 
!> @brief 
!> Run an insertion sort on a vector of integer values. 
!>
!> @details 
!> Run a decending on a vector of integer values to sort them in the specified order.
!>
!> @param vec
!> The vector integer values to be sorted.
!>
!> @author Arin R. Bratt
!> @date 11/07/2014
pure subroutine insertion_sort_dec_int(vec)
  ! Arguments
  integer, intent(inout) :: vec(:)
  
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
end subroutine insertion_sort_dec_int


