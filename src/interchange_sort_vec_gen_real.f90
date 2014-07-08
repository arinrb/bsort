!> @ingroup interchange_sort_gen
!> 
!> @brief 
!> Run an interchange sort on a vector of real values. 
!>
!> @details 
!> Run an interchange sort on a vector of real values to sort them in the specified order. 
!>
!> @param vec
!> The vector to be sorted.
!>
!> @param ord
!> A logical function which describes the ordering used. The function must take two real arguments and return true if and only if the first argument must proceed the second argument in the order.
!>
!> @warning
!> The argument types and counts of ord are not checked within this subroutine.
!> 
!> @author Arin R. Bratt
!> @date 07/07/2014
 subroutine interchange_sort_vec_gen_real(vec,ord)
  ! Arguments
  real, intent(inout) :: vec(:)
  procedure(logical) :: ord
  
  ! Variables
  integer :: i
  integer :: j
  
  ! The interchange sort
  do i = 1,size(vec,1) - 1
     do j = i + 1,size(vec,1)
        if (ord(vec(i),vec(j))) then
            call swap(vec(i),vec(j))
        end if
     end do
  end do
end subroutine interchange_sort_vec_gen_real


