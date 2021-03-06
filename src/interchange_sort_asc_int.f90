!> @ingroup interchange_sort_asc
!> 
!> @brief 
!> Run an interchange sort on a vector of integer values. 
!>
!> @details 
!> Run an ascending on a vector of integer values to sort them in the specified order.
!>
!> @param vec
!> The vector integer values to be sorted.
!>
!> @author Arin R. Bratt
!> @date 11/07/2014
pure subroutine interchange_sort_asc_int(vec)
  ! Arguments
  integer, intent(inout) :: vec(:)
  
  
  ! Variables
  integer :: i
  integer :: j
  integer :: swap_value

  ! The interchange sort
  do i = 1,size(vec,1) - 1
     do j = i + 1,size(vec,1)
        if (vec(i) > vec(j)) then
           ! Swap integer values vec(i) and vec(j).
           swap_value = vec(i)
           vec(i) = vec(j)
           vec(j) = swap_value
        end if
     end do
  end do
end subroutine interchange_sort_asc_int


