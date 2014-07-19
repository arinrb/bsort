!> @ingroup insertion_sort
!> 
!> @brief 
!> Run an insertion sort on a vector of real values. 
!>
!> @details 
!> Run an insertion sort on a vector of real values to sort them in a specified order. 
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

pure subroutine insertion_sort_real(vec,ascending)
  ! Arguments
  real, intent(inout) :: vec(:)
  logical, intent(in) :: ascending
  
  ! Main
  if (ascending) then
     call insertion_sort_asc_real(vec)
  else
     call insertion_sort_dec_real(vec)
  end if
end subroutine insertion_sort_real
