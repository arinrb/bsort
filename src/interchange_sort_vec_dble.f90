!> @ingroup interchange_sort
!> 
!> @brief 
!> Run an interchange sort on a vector of double precision values. 
!>
!> @details 
!> Run an interchange sort on a vector of double precision values to sort them in a specified order. 
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
pure subroutine interchange_sort_vec_dble(vec,ascending)
  ! Arguments
  double precision, intent(inout) :: vec(:)
  logical, intent(in) :: ascending
  
  ! Main
  if (ascending) then
     call interchange_sort_vec_asc_dble(vec)
  else
     call interchange_sort_vec_dec_dble(vec)
  end if
end subroutine interchange_sort_vec_dble


