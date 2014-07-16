!> @ingroup is_sorted
!>
!> @brief
!> Check if a vector of integer values is sorted by the specified order. 
!> 
!> @details
!> Check if a vector of integer values is sorted by the specified order. Returns a logical value indicating if the vector is sorted.
!> 
!> @result  sorted
!> Indicates if the vector is sorted.
!> 
!> | Value | Meaning                  |
!> |:-----:|:------------------------ |
!> | true  | The vector is sorted     |
!> | false | The vector is not sorted |
!>

!> @param x
!> The vector to be checked for being sorted.
!>
!> @param ord
!> A logical function which describes the ordering used. The function must take two integer arguments and return true if and only if the first argument must proceed the second argument in the order.
!>
!> @note
!> Empty and single value vectors are considered sorted.
!>
!> @warning
!> The argument types and counts of ord are not checked within this function.
!> 
!> @author Arin R. Bratt
!> @date 10/07/2014
function is_sorted_gen_int(x,ord) result(sorted)
  
  ! Result
  logical :: sorted

  ! Arguments
  integer, intent(in) :: x(:)
  procedure(logical) :: ord
  
  ! Variables
  integer :: i
  
  ! This structure avoides checking empty or single value vectors, which are always considered sorted.
  do i = 2,size(x,1)
     if (ord(x(i - 1),x(i))) then
        sorted = .false.
        return
     end if
  end do
  sorted = .true.
end function is_sorted_gen_int

