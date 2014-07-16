!> @ingroup 
!> 
!> @brief 
!> Run  on a vector of  values. 
!>
!> @details 
!> Run  on a vector of  values to sort them in a specified order. 
!>
!> @param 
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

pure subroutine (,ascending)
  ! Arguments
  , intent(inout) :: (:)
  logical, intent(in) :: ascending
  
  ! Main
  if (ascending) then
     call _asc()
  else
     call _dec()
  end if
end subroutine 
