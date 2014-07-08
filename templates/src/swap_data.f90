!> @ingroup swap
!> 
!> @brief 
!> Swap two #DATA_FULL# values. 
!>
!> @detials 
!> Swap two #DATA_FULL# values.
!>
!> @param x
!> The first value to be swapped.
!> 
!> @param y
!> The second value to be swapped.
!> 
!> @author Arin R. Bratt
!> @date 05/07/2014
pure subroutine swap_#DATA_NAME#(x,y)
  ! Arguments
  #DATA_FULL#, intent(inout) :: x
  #DATA_FULL#, intent(inout) :: y
  
  ! Variables
  #DATA_FULL# :: temp

  ! Main
  temp = x
  x = y
  y = temp

end subroutine swap_#DATA_NAME#


