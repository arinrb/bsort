!> @ingroup is_sorted_#ORD_NAME#
!>
!> @brief
!> Check if a vector of double precision values is sorted by a decending order. 
!> 
!> @details
!> Check if a vector of double precision values is sorted by a decending order. Returns a logical value indicating if the vector is sorted.
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
!> @note
!> Empty and single value vectors are considered sorted.
!>
!> @author Arin R. Bratt
!> @date 10/07/2014
pure function is_sorted_dec_dble(x) result(sorted)
  
  ! Result
  logical :: sorted

  ! Arguments
  double precision, intent(in) :: x(:)
  
  ! Variables
  integer :: i
  
  ! This structure avoides checking empty or single value vectors, which are always considered sorted.
  do i = 2,size(x,1)
     if (x(i - 1) < x(i)) then
        sorted = .false.
        return
     end if
  end do
  sorted = .true.
end function is_sorted_dec_dble

