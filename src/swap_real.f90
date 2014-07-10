!> @ingroup swap
!> 
!> @brief 
!> Swap two real values. 
!>
!> @details 
!> Swap two real values.
!>
!> @param x
!> The first value to be swapped.
!> 
!> @param y
!> The second value to be swapped.
!> 
!> @author Arin R. Bratt
!> @date 05/07/2014
elemental subroutine swap_real(x,y)
  ! Arguments
  real, intent(inout) :: x
  real, intent(inout) :: y
  
  ! Variables
  real :: temp

  ! Main
  temp = x
  x = y
  y = temp

end subroutine swap_real


