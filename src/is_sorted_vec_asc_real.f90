!> @ingroup is_sorted_asc
!>
!> @brief
!> Check if a vector of real values is sorted by an ascending order. 
!> 
!> @details
!> Check if a vector of real values is sorted by an ascending order. Returns a logical value indicating if the vector is sorted.
!> 
!> @result is_sorted
!> Indicates if the vector is sorted.
!> 
!> | Value | Meaning                  |
!> |:-----:|:------------------------ |
!> | true  | The vector is sorted     |
!> | false | The vector is not sorted |
!>
!> @param vec
!> Te vec to be checked for being sorted.
!>
!> @note
!> Empty and single value vectors are considered sorted.
!>
!> @author Arin R. Bratt
!> @date 05/07/2014
pure function is_sorted_vec_asc_real(vec) result(is_sorted)
  ! Result
  logical :: is_sorted

  ! Arguments
  real, intent(in) :: vec(:)
  
  ! Variables
  integer :: i
  
  ! This structure avodies checking empty or single value vectors which are always considered sorted.
  do i = 2,size(vec,1)
     if (vec(i - 1) > vec(i)) then
        is_sorted = .false.
        return
     end if
  end do
  is_sorted = .true.
end function is_sorted_vec_asc_real

