!> @ingroup swap
!> 
!> @brief 
!> Swap two #<data><full># values. 
!>
!> @details 
!> Swap two #<data><full># values.
!>
!> @param x
!> The first value to be swapped.
!> 
!> @param y
!> The second value to be swapped.
!> 
!> @author Arin R. Bratt
!> @date 11/07/2014
elemental subroutine swap#data#(x,y)
  ! Arguments
  #<data><full>#, intent(inout) :: x
  #<data><full>#, intent(inout) :: y
  
  ! Variables
   #<data><full># :: temp

  ! Main
  temp = x
  x = y
  y = temp
  
end subroutine swap#data#


