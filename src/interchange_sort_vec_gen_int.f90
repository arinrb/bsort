!> @ingroup interchange_sort_vec_gen
!> 
!> @brief 
!> Run an interchange sort on a vector of integer values. 
!>
!> @detials 
!> Run an interchange sort on a vector of integer values. 
!>
!> @param vec
!> The vector to be sorted.
!>
!> @param ord
!> A logical function which describes the ordering used. The function must take two integer arguments and return true if and only if the first argument must proceed the second argument in the order.
!>
!> @warning
!> The argument types and counts of ord are not checked within this subroutine.
!> 
!> @author Arin R. Bratt
!> @date 07/07/2014
pure subroutine interchange_sort_vec_gen_ERROR_int(vec,ord)
  ! Arguments
  integer, intent(inout) :: vec(:)
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
end subroutine interchange_sort_vec_gen_ERROR_int


