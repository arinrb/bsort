!> @ingroup swap
!> 
!> @brief 
!> Swap two values. 
!>
!> @detials 
!> Swap two real values.
!>
!> @param x
!> First value to be swapped.
!> 
!> @param y
!> Second value to be swapped.
!> 
!> @author Arin R. Bratt
!> @date 05/07/2014
pure subroutine swap_vec_real(x,y)
  ! Arguments
  real, intent(inout) :: x
  real, intent(inout) :: y
  
  ! Variables
  real :: temp

  ! Main
  temp = x
  x = y
  y = temp

end subroutine swap_vec_real


