#UNLESS<ord><gen>#!> @ingroup is_sorted_#ORD_NAME#
#IF<ord><gen>#!> @ingroup is_sorted
!>
!> @brief
!> Check if a vector of #<data><full># values is sorted by #<ord><docRef># order. 
!> 
!> @details
!> Check if a vector of #<data><full># values is sorted by #<ord><docRef># order. Returns a logical value indicating if the vector is sorted.
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
#IF<ord><gen>#!> @param #<ord><var>#
#IF<ord><gen>#!> A logical function which describes the ordering used. The function must take two #<data><full># arguments and return true if and only if the first argument must proceed the second argument in the order.
#IF<ord><gen>#!>
!> @note
!> Empty and single value vectors are considered sorted.
!>
#IF<ord><gen>#!> @warning
#IF<ord><gen>#!> The argument types and counts of #<ord><var># are not checked within this function.
#IF<ord><gen>#!> 
!> @author Arin R. Bratt
!> @date 10/07/2014
#IF<ord><gen>THEN<>ELSE<pure >ENDIF#function is_sorted#ord##data#(x#<ord><arg>#) result(sorted)
  
  ! Result
  logical :: sorted

  ! Arguments
  #<data><full>#, intent(in) :: x(:)
  #IF<ord><gen>#procedure(logical) :: #<ord><var>#
  
  ! Variables
  integer :: i
  
  ! This structure avoides checking empty or single value vectors, which are always considered sorted.
  do i = 2,size(x,1)
     if (#ORD<x(i - 1)><x(i)>#) then
        sorted = .false.
        return
     end if
  end do
  sorted = .true.
end function is_sorted#ord##data#

