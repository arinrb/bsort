!> @ingroup is_sorted
!> 
!> @brief
!> Checks if a vector of #<data><full># values is sorted.
!> 
!> @details
!> Checks if a vector of #<data><full># values is sorted according to the specified ordering.
!> 
!> @retval sorted
!> Indicated if the vector of #<data><full># values is sorted according to the specified ordering.
!> 
!> | Value | Meaning                  |
!> |:-----:|:------------------------ |
!> | true  | The vector is sorted     |
!> | false | The vector is not sorted |
!> 
!> @param #<data><var>#
!> The vector of #<data><full># values to be checked for being sorted.
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

pure function is_sorted#data#(#<data><var>#,ascending) result(sorted)

  ! Parameters
  #<data><full>#, intent(in) :: #<data><var>#(:)
  logical, intent(in) :: ascending

  ! Result
  logical :: sorted

  ! Check ascending and call the right function.
  if (ascending) then
     sorted = is_sorted_asc#data#(#<data><var>#)
  else
     sorted = is_sorted_dec#data#(#<data><var>#)
  end if

end function is_sorted#data#

