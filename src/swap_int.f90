!> @ingroup swap
!> 
!> @brief 
!> Swap two integer values. 
!>
!> @detials 
!> Swap two integer values.
!>
!> @param x
!> The first value to be swapped.
!> 
!> @param y
!> The second value to be swapped.
!> 
!> @author Arin R. Bratt
!> @date 05/07/2014
pure subroutine swap_int(x,y)
  ! Arguments
  integer, intent(inout) :: x
  integer, intent(inout) :: y
  
  ! Variables
  integer :: temp

  ! Main
  temp = x
  x = y
  y = temp

end subroutine swap_int

