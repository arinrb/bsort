#SET<sort><quick_sort_recursive>#
!> @ingroup #<sort><name>##ord#
!> 
!> @brief 
!> Run #<sort><docRef># on a vector of #<data><full># values. 
!>
!> @details 
!> Run #<ord><docRef># on a vector of #<data><full># values to sort them in the specified order.#IF<map><true>THEN<The vector of intergers map is permuted in the same way that the vector #<data><var># is permuted to be sorted. It is important that #<map><var># be at least as long as #<data><var>#.>ENDIF#
!>
!> @param #<data><var>#
!> The vector #<data><full># values to be sorted.
!>
#IF<map><true>#!> @param #<map><var>#
#IF<map><true>#!> Vector of intergers which is permuted in the same way that #<data><var># is permuted. If #<map><var># is a vector of values 1 to N, where N is the length of #<data><var>#, than, #<map><var># is the map from #<data><var>#'s original value to #<data><var>#'s final value after the sort.
#IF<map><true>#!> 
#IF<ord><gen>#!> @param #<ord><var>#
#IF<ord><gen>#!> A logical function which describes the ordering used. The function must take two #<data><full># arguments and return true if and only if the first argument must proceed the second argument in the order.
#IF<ord><gen>#!>
#IF<ord><gen>#!> @warning
#IF<ord><gen>#!> The argument types and counts of #<ord><var># are not checked within this subroutine.
#IF<ord><gen>#!> 
#IF<map><true>#!> @warning
#IF<map><true>#!> The length of #<map><var># is not checked within this subroutine. If the length of #<data><var># is larger than the length of #<map><var>#, than this subroutine may attempt to access elements outside of #<map><var>#.
#IF<map><true>#!> 
!> @author Arin R. Bratt
!> @date 11/07/2014
#IF<ord><gen>THEN<>ELSE<pure >ENDIF#subroutine #<sort><name>##ord##map##data#(#<data><var>##<map><arg>##<ord><arg>#)
  ! Arguments
  #<data><full>#, intent(inout) :: #<data><var>#(:)
  #IF<map><true>#integer, intent(inout) :: #<map><var>#(:)
  #IF<ord><gen>#procedure(logical) :: #<ord><var>#

  ! Variables
  integer :: low
  integer :: high
  integer :: low_eq
  integer :: high_eq
  #<data><full># :: pivot
  #<data><full># :: temp

  ! Go to interchange sort if list is small
  if (size(#<data><var>#,1) <= max_interchange_sort_size) then
     call interchange_sort#ord##map##data#(#<data><var>##<map><arg>##<ord><arg>#)
  else
     ! Initilize values
     low = 1
     high = size(#<data><var>#,1)
     low_eq = 1
     high_eq = size(#<data><var>#,1)

     ! Build pivot
     pivot = (#<data><var>#(low) + #<data><var>#(high)) / 2
     if (#ORD< #<data><var>#(low)><#<data><var>#(high)>#) then
        call swap(#<data><var>#(low),#<data><var>#(high))
        #IF<map><true>#call swap(#<map><var>#(low),#<map><var>#(high))
     end if
     
     ! Main loop with three way partition
     do 
        ! Find pivot points
        do
           low = low + 1
           if (.not. #ORD<pivot><#<data><var>#(low)>#) exit
        end do
        do 
           high = high - 1
           if (.not. #ORD<#<data><var>#(high)><pivot># .or. high == 1) exit
        end do

        ! Exit if they are on the wrong side of the pivot
        if (low >= high) exit

        ! Run main quick sort swap
        call swap(#<data><var>#(low),#<data><var>#(high))
        #IF<map><true>#call swap(#<map><var>#(low),#<map><var>#(high))

        ! Check for if values are equal to pivot, if so swap
        if (.not. #ORD<#<data><var>#(high)><pivot>#) then
           call swap(#<data><var>#(high),#<data><var>#(high_eq))
           #IF<map><true>#call swap(#<map><var>#(high),#<map><var>#(high_eq))
           high_eq = high_eq - 1
        end if

        if (.not. #ORD<pivot><#<data><var>#(low)>#) then
           call swap(#<data><var>#(low),#<data><var>#(low_eq))
           #IF<map><true>#call swap(#<map><var>#(low),#<map><var>#(low_eq))
           low_eq = low_eq + 1
        end if
     end do
     high = low - 1

     ! Move equals to the middle
     do while(1 < low_eq)
        low_eq = low_eq - 1
        call swap(#<data><var>#(low_eq),#<data><var>#(high))
        #IF<map><true>#call swap(#<map><var>#(low_eq),#<map><var>#(high))
        high = high - 1
     end do
     
     do while(high_eq < size(#<data><var>#,1))
        high_eq = high_eq + 1
        call swap(#<data><var>#(high_eq),#<data><var>#(low))
        #IF<map><true>#call swap(#<map><var>#(high_eq),#<map><var>#(low))
        low = low + 1
     end do
     
     ! Recursive calls 
     if (size(#<data><var>#,1) - low > high - 1) then
        if (high > 1) call #<sort><name>##ord##map##data#(#<data><var>#(:high)#IF<map><true>THEN<,#<map><var>#(:high)>ENDIF##<ord><arg>#)
        if (low < size(#<data><var>#,1)) call #<sort><name>##ord##map##data#(#<data><var>#(low:)#IF<map><true>THEN<,#<map><var>#(low:)>ENDIF##<ord><arg>#)
     else
        if (low < size(#<data><var>#,1)) call #<sort><name>##ord##map##data#(#<data><var>#(low:)#IF<map><true>THEN<,#<map><var>#(low:)>ENDIF##<ord><arg>#)
        if (high > 1) call #<sort><name>##ord##map##data#(#<data><var>#(:high)#IF<map><true>THEN<,#<map><var>#(:high)>ENDIF##<ord><arg>#)
     end if
  end if
end subroutine #<sort><name>##ord##map##data#

