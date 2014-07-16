!> @ingroup is_sorted
!> 
!> @brief
!> Checks if a vector of double precision values is sorted.
!> 
!> @details
!> Checks if a vector of double precision values is sorted according to the specified ordering.
!> 
!> @retval sorted
!> Indicated if the vector of double precision values is sorted according to the specified ordering.
!> 
!> | Value | Meaning                  |
!> |:-----:|:------------------------ |
!> | true  | The vector is sorted     |
!> | false | The vector is not sorted |
!> 
!> @param vec
!> The vector of double precision values to be checked for being sorted.
!> 
!> @param ascending
!> Indicates if the ordering to be checked for is ascending or decending.
!> 
!> | Value | Meaning         |
!> |:-----:|:--------------- |
!> | true  | Ascending order |
!> | false | Decending order |
!> 
!> @note
!> An empty or single value vector is considered sorted.
!>
!> @author Arin R. Bratt
!> @date 12/07/2014

pure function is_sorted_dble(vec,ascending) result(sorted)

  ! Parameters
  double precision, intent(in) :: vec(:)
  logical, intent(in) :: ascending

  ! Result
  logical :: sorted

  ! Check ascending and call the right function.
  if (ascending) then
     sorted = is_sorted_asc_dble(vec)
  else
     sorted = is_sorted_dec_dble(vec)
  end if

end function is_sorted_dble

