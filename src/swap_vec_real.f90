!> @ingroup swap
!> 
!> @brief 
!> Swap two values in #DATA_DOCREF# vector. 
!>
!> @detials 
!> Swap two values in #DATA_DOCREF# vector.
!>
!> @param x
!> The index of the first value to be swapped.
!> 
!> @param y
!> The index of the second value to be swapped.
!> 
!> @warning
!> The values of x and y are not checked to be inside vec.
!> 
!> @author Arin R. Bratt
!> @date 07/07/2014
pure subroutine swap_vec_real(vec,x,y)
  ! Arguments
  real, intent(inout) :: vec(:)
  integer, intent(in) :: x
  integer, intent(in) :: y

  ! Variables
  real :: temp

  ! Main
  temp = vec(x)
  vec(x) = vec(y)
  vec(y) = temp

end subroutine swap_vec_real


