!> @ingroup is_sorted
!>
!> @brief
!> Check if a vector of real values is sorted by the specified order. 
!> 
!> @details
!> Check if a vector of real values is sorted by the specified order. Returns a logical value indicating if the vector is sorted.
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
!> @param ord
!> A logical function which describes the ordering used. The function must take two real arguments and return true if and only if the first argument must proceed the second argument in the order.
!>
!> @note
!> Empty and single value vectors are considered sorted.
!>
!> @warning
!> The argument types and counts of ord are not checked within this function.
!> 
!> @author Arin R. Bratt
!> @date 05/07/2014
function is_sorted_vec_gen_real(vec,ord) result(is_sorted)
  ! Result
  logical :: is_sorted

  ! Arguments
  real, intent(in) :: vec(:)
  procedure(logical) :: ord
  
  ! Variables
  integer :: i
  
  ! This structure avodies checking empty or single value vectors which are always considered sorted.
  do i = 2,size(vec,1)
     if (ord(vec(i - 1),vec(i))) then
        is_sorted = .false.
        return
     end if
  end do
  is_sorted = .true.
end function is_sorted_vec_gen_real

