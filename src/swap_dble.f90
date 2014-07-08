!> @ingroup swap
!> 
!> @brief 
!> Swap two double precision values. 
!>
!> @details 
!> Swap two double precision values.
!>
!> @param x
!> The first value to be swapped.
!> 
!> @param y
!> The second value to be swapped.
!> 
!> @author Arin R. Bratt
!> @date 05/07/2014
pure subroutine swap_dble(x,y)
  ! Arguments
  double precision, intent(inout) :: x
  double precision, intent(inout) :: y
  
  ! Variables
  double precision :: temp

  ! Main
  temp = x
  x = y
  y = temp

end subroutine swap_dble


