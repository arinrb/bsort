!> @ingroup quick_sort_recursive_dec
!> 
!> @brief 
!> Run a recursive three way quick sort on a vector of integer values. 
!>
!> @details 
!> Run a decending on a vector of integer values to sort them in the specified order.The vector of intergers map is permuted in the same way that the vector vec is permuted to be sorted. It is important that map be at least as long as vec.
!>
!> @param vec
!> The vector integer values to be sorted.
!>
!> @param map
!> Vector of intergers which is permuted in the same way that vec is permuted. If map is a vector of values 1 to N, where N is the length of vec, than, map is the map from vec's original value to vec's final value after the sort.
!> 
!> @warning
!> The length of map is not checked within this subroutine. If the length of vec is larger than the length of map, than this subroutine may attempt to access elements outside of map.
!> 
!> @author Arin R. Bratt
!> @date 11/07/2014
pure subroutine quick_sort_recursive_dec_map_int(vec,map)
  ! Arguments
  integer, intent(inout) :: vec(:)
  integer, intent(inout) :: map(:)

  ! Variables
  integer :: low
  integer :: high
  integer :: low_eq
  integer :: high_eq
  integer :: pivot
  integer :: temp

  ! Go to interchange sort if list is small
  if (size(vec,1) <= max_interchange_sort_size) then
     call interchange_sort_dec_map_int(vec,map)
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
        call swap(map(low),map(high))
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
        call swap(map(low),map(high))

        ! Check for if values are equal to pivot, if so swap
        if (.not. vec(high) < pivot) then
           call swap(vec(high),vec(high_eq))
           call swap(map(high),map(high_eq))
           high_eq = high_eq - 1
        end if

        if (.not. pivot < vec(low)) then
           call swap(vec(low),vec(low_eq))
           call swap(map(low),map(low_eq))
           low_eq = low_eq + 1
        end if
     end do
     high = low - 1

     ! Move equals to the middle
     do while(1 < low_eq)
        low_eq = low_eq - 1
        call swap(vec(low_eq),vec(high))
        call swap(map(low_eq),map(high))
        high = high - 1
     end do
     
     do while(high_eq < size(vec,1))
        high_eq = high_eq + 1
        call swap(vec(high_eq),vec(low))
        call swap(map(high_eq),map(low))
        low = low + 1
     end do
     
     ! Recursive calls 
     if (size(vec,1) - low > high - 1) then
        if (high > 1) call quick_sort_recursive_dec_map_int(vec(:high),map(:high))
        if (low < size(vec,1)) call quick_sort_recursive_dec_map_int(vec(low:),map(low:))
     else
        if (low < size(vec,1)) call quick_sort_recursive_dec_map_int(vec(low:),map(low:))
        if (high > 1) call quick_sort_recursive_dec_map_int(vec(:high),map(:high))
     end if
  end if
end subroutine quick_sort_recursive_dec_map_int

