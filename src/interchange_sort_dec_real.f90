!> @ingroup interchange_sort_dec
!> 
!> @brief 
!> Run an interchange sort on a vector of real values. 
!>
!> @details 
!> Run a decending on a vector of real values to sort them in the specified order.
!>
!> @param vec
!> The vector real values to be sorted.
!>
!> @author Arin R. Bratt
!> @date 11/07/2014
pure subroutine interchange_sort_dec_real(vec)
  ! Arguments
  real, intent(inout) :: vec(:)
  
  
  ! Variables
  integer :: i
  integer :: j
  real :: swap_value

  ! The interchange sort
  do i = 1,size(vec,1) - 1
     do j = i + 1,size(vec,1)
        if (vec(i) < vec(j)) then
           ! Swap real values vec(i) and vec(j).
           swap_value = vec(i)
           vec(i) = vec(j)
           vec(j) = swap_value
        end if
     end do
  end do
end subroutine interchange_sort_dec_real


