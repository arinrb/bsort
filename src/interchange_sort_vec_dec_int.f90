!> @ingroup interchange_sort_vec_dec
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
!> @author Arin R. Bratt
!> @date 07/07/2014
pure subroutine interchange_sort_vec_dec_ERROR_int(vec)
  ! Arguments
  integer, intent(inout) :: vec(:)
  
  ! Variables
  integer :: i
  integer :: j
  
  ! The interchange sort
  do i = 1,size(vec,1) - 1
     j = maxloc(vec(i:),1)
     if(j /= 1) then
        call swap(vec(i),vec(i + j - 1))
     end if
  end do
end subroutine interchange_sort_vec_dec_ERROR_int


