!> @ingroup quick_sort_recursive
!> 
!> @brief 
!> Run a recursive three way quick sort on a vector of real values. 
!>
!> @details 
!> Run a recursive three way quick sort on a vector of real values to sort them in a specified order. 
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
!> @date 11/07/2014

pure subroutine quick_sort_recursive_real(vec,ascending)
  ! Arguments
  real, intent(inout) :: vec(:)
  logical, intent(in) :: ascending
  
  ! Main
  if (ascending) then
     call quick_sort_recursive_asc_real(vec)
  else
     call quick_sort_recursive_dec_real(vec)
  end if
end subroutine quick_sort_recursive_real
