!> @ingroup interchange_sort_dec
!> 
!> @brief 
!> Run an interchange sort on a vector of real values. 
!>
!> @details 
!> Run an interchange sort on a vector of real values to sort them in a decending order. 
!>
!> @param vec
!> The vector to be sorted.
!>
!> @author Arin R. Bratt
!> @date 07/07/2014
pure subroutine interchange_sort_vec_dec_real(vec)
  ! Arguments
  real, intent(inout) :: vec(:)
  
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
end subroutine interchange_sort_vec_dec_real


