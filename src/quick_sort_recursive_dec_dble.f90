!> @ingroup quick_sort_recursive_dec
!> 
!> @brief 
!> Run a recursive three way quick sort on a vector of double precision values. 
!>
!> @details 
!> Run a decending on a vector of double precision values to sort them in the specified order.
!>
!> @param vec
!> The vector double precision values to be sorted.
!>
!> @author Arin R. Bratt
!> @date 11/07/2014
pure subroutine quick_sort_recursive_dec_dble(vec)
  ! Arguments
  double precision, intent(inout) :: vec(:)

  ! Variables
  integer :: low
  integer :: high
  integer :: low_eq
  integer :: high_eq
  double precision :: pivot
  double precision :: temp

  ! Go to interchange sort if list is small
  if (size(vec,1) <= max_interchange_sort_size) then
     call interchange_sort_dec_dble(vec)
  else
     ! Initilize values
     low = 1
     high = size(vec,1)
     low_eq = 1
     high_eq = size(vec,1)

     ! Build pivot
     pivot = (vec(low) + vec(high)) / 2
     if ( vec(low) < vec(high)) then
        call swap(vec(low),vec(high))
     end if
     
     ! Main loop with three way partition
     do 
        ! Find pivot points
        do
           low = low + 1
           if (.not. pivot < vec(low)) exit
        end do
        do 
           high = high - 1
           if (.not. vec(high) < pivot .or. high == 1) exit
        end do

        ! Exit if they are on the wrong side of the pivot
        if (low >= high) exit

        ! Run main quick sort swap
        call swap(vec(low),vec(high))

        ! Check for if values are equal to pivot, if so swap
        if (.not. vec(high) < pivot) then
           call swap(vec(high),vec(high_eq))
           high_eq = high_eq - 1
        end if

        if (.not. pivot < vec(low)) then
           call swap(vec(low),vec(low_eq))
           low_eq = low_eq + 1
        end if
     end do
     high = low - 1

     ! Move equals to the middle
     do while(1 < low_eq)
        low_eq = low_eq - 1
        call swap(vec(low_eq),vec(high))
        high = high - 1
     end do
     
     do while(high_eq < size(vec,1))
        high_eq = high_eq + 1
        call swap(vec(high_eq),vec(low))
        low = low + 1
     end do
     
     ! Recursive calls 
     if (size(vec,1) - low > high - 1) then
        if (high > 1) call quick_sort_recursive_dec_dble(vec(:high))
        if (low < size(vec,1)) call quick_sort_recursive_dec_dble(vec(low:))
     else
        if (low < size(vec,1)) call quick_sort_recursive_dec_dble(vec(low:))
        if (high > 1) call quick_sort_recursive_dec_dble(vec(:high))
     end if
  end if
end subroutine quick_sort_recursive_dec_dble

