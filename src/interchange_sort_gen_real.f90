!> @ingroup interchange_sort_gen
!> 
!> @brief 
!> Run an interchange sort on a vector of real values. 
!>
!> @details 
!> Run the specified on a vector of real values to sort them in the specified order.
!>
!> @param vec
!> The vector real values to be sorted.
!>
!> @param ord
!> A logical function which describes the ordering used. The function must take two real arguments and return true if and only if the first argument must proceed the second argument in the order.
!>
!> @warning
!> The argument types and counts of ord are not checked within this subroutine.
!> 
!> @author Arin R. Bratt
!> @date 11/07/2014
subroutine interchange_sort_gen_real(vec,ord)
  ! Arguments
  real, intent(inout) :: vec(:)
  procedure(logical) :: ord
  
  ! Variables
  integer :: i
  integer :: j
  real :: swap_value
  
  ! The interchange sort
  do i = 1,size(vec,1) - 1
     do j = i + 1,size(vec,1)
        if (ord(vec(i),vec(j))) then
           swap_value = vec(i)
           vec(i) = vec(j)
           vec(j) = swap_value
        end if
     end do
  end do
end subroutine interchange_sort_gen_real


