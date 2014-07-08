!> @ingroup is_sorted
!> 
!> @brief
!> Checks if a vector is sorted.
!> 
!> @details
!> Checks if a vector is sorted using a specified ordering.
!> 
!> @retval is_sorted
!> Indicated if the vector is sorted in the specified order.
!> 
!> | Value | Meaning                  |
!> |:-----:|:------------------------ |
!> | true  | The vector is sorted     |
!> | false | The vector is not sorted |
!> 
!> @param vec
!> The vector to be checked.
!> 
!> @param ascending
!> Indicates if the ordering to be checked for is in ascending or decending.
!> 
!> | Value | Meaning         |
!> |:-----:|:--------------- |
!> | true  | Ascending order |
!> | false | Decending order |
!> 
!> @note
!> An empty or single value vector is considered sorted.
!>
!> @warning
!> The target of  is not checked within the function, care should be used that the target functon is of the right form.
!> 
!> @author Arin R. Bratt
!> @date 06/07/2014

pure function is_sorted_vec_real(vec,ascending) result(is_sorted)

  ! Parameters
  real, intent(in) :: vec(:)
  logical, intent(in) :: ascending

  ! Result
  logical :: is_sorted

  ! Check ascending and call the right function.
  if (ascending) then
     is_sorted = is_sorted_vec_asc_real(vec)
  else
     is_sorted = is_sorted_vec_dec_real(vec)
  end if

end function is_sorted_vec_real

