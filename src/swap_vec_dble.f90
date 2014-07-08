!> @ingroup swap
!> 
!> @brief 
!> Swap two values. 
!>
!> @detials 
!> Swap two double precision values.
!>
!> @param x
!> First value to be swapped.
!> 
!> @param y
!> Second value to be swapped.
!> 
!> @author Arin R. Bratt
!> @date 05/07/2014
pure subroutine swap_vec_dble(x,y)
  ! Arguments
  double precision, intent(inout) :: x
  double precision, intent(inout) :: y
  
  ! Variables
  double precision :: temp

  ! Main
  temp = x
  x = y
  y = temp

end subroutine swap_vec_dble


