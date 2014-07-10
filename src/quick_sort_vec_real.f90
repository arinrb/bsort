!> @ingroup quick_sort
!> 
!> @brief 
!> Run an quick sort on a vector of real values. 
!>
!> @details 
!> Run an quick sort on a vector of real values to sort them in a specified order. 
!>
!> @param vec
!> The vector to be sorted.
!>
!> @param ascending
!> Indicates if the ordering is ascending or decending.
!> 
!> | Value | Meaning         |
!> |:-----:| :-------------- |
!> | true  | Ascending order |
!> | false | Decending order |
!>
!> @author Arin R. Bratt
!> @date 07/07/2014
!pure subroutine quick_sort_vec_real(vec,ascending)
subroutine quick_sort_vec_real(vec,ascending)
  ! Arguments
  real, intent(inout) :: vec(:)
  logical, intent(in) :: ascending
  
  ! Main
  if (ascending) then
     call quick_sort_vec_asc_real(vec)
  else
     call quick_sort_vec_dec_real(vec)
  end if
end subroutine quick_sort_vec_real


