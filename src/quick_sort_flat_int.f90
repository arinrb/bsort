!> @ingroup quick_sort_flat
!> 
!> @brief 
!> Run a flat three way quick sort on a vector of integer values. 
!>
!> @details 
!> Run a flat three way quick sort on a vector of integer values to sort them in a specified order. 
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

pure subroutine quick_sort_flat_int(vec,ascending)
  ! Arguments
  integer, intent(inout) :: vec(:)
  logical, intent(in) :: ascending
  
  ! Main
  if (ascending) then
     call quick_sort_flat_asc_int(vec)
  else
     call quick_sort_flat_dec_int(vec)
  end if
end subroutine quick_sort_flat_int
