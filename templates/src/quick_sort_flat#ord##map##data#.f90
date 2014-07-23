#SET<sort><quick_sort_flat>#
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
!> @note
!> This flat quick sort works by maintaning a psudo stack.  As the the subroutine runs vec splices of vec are broken into two groups based on comparison to a pivot chosen based on the average value of the first and last element of of the slice.  The same process is then applied to the larger of the two slices.  After a slice is sorted the next smallest slice of vec is sorted.  
!> 
!> Example ignoring the interchange sort     4 3 7 9 1 2
!> i    pivot    lower     upper   
!> 1    3        1         6                |2 1 7 9 3 4|
!> 2    5        3         6                 2 1|4 3 9 7]
!> 3    8        5         6                 2 1 4 3|7 9|
!> 2    4        3         4                 2 1|3 4|7 9
!> 1    1        1         2                |1 2|3 4 7 9
!> 
!> The alogorithm of the flat quick sort is harder to follow than the more conventional flat quick sort; however, it saves system resoruces.  Also on systems with limitations on stack sizes a flat quick sort allows sorting of larger lists.  The natural limit is the value of the vector levels.  This can cause a failure in some cases.  
!>
!> @note
!> Some credit for this implimentation must go to Darel Flex's implimentation that can be found <a href="http://alienryderflex.com/quicksort/">here</a>.
!e
!> @warning
!> Error will occur if max_interchange_sort_size is less than one.
!>>
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

  ! Parameters
  integer, parameter :: stack_levels = 300

  ! Variables
  integer :: idx
  integer :: low
  integer :: high
  integer :: lower(stack_levels)
  integer :: upper(stack_levels)
  #<data><full># :: pivot
  #<data><full># :: #<data><swap>#
  
  ! Initilize the stack
  idx = 1
  lower(idx) = 1
  upper(idx) = #SIZE# + 1
  
  ! Main loop
  do while(idx >= 1)     
     ! Sort the slice of #<data><var># between lower(idx) and upper(idx)
     low = lower(idx)
     high = upper(idx) - 1
     
     if (low < high) then
        pivot = (#<data><var>#(high) + #<data><var>#(low)) / 2
        do while(low < high)
        
           if (high - low < max_interchange_sort_size) then
              ! Run interchange sort on small vectors
              if (low < high) call interchange_sort#ord##map##data#(#<data><var>#(low:high)#IF<map><true>THEN<,#<map><var>#(low:high)>ENDIF##<ord><arg>#)
              idx = idx - 1
           else
              ! Run quick sort on large vectors
              ! This pivot helps avoid n^2 behavior, expect in expontially growning and shrinking (reverse) sorted lists and lists of indentical elements.
              pivot = (#<data><var>#(high) + #<data><var>#(low)) / 2
              do
                 ! This loop finds elements on the wrong side of the pivot and swaps until no such elements are left.
                 ! Consider running these in parallel

                 ! Find the first element below the pivot that must be above the pivot.
                 do while(low <= high)
                    if (#ORD<#<data><var>#(low)><pivot>#) exit
                    low = low + 1
                 end do
                 
                 ! Find the first element above the pivot that must be below the pivot.
                 do while (high > lower(idx))
                    if (#ORD<pivot><#<data><var>#(high)>#) exit
                    high = high - 1
                 end do
                 
                 if (high > low) then
                    !If #<data><var>#(low) must follow #<data><var>#(high) than swap their values.
                    #SWAP<#<data><var>#(low)><#<data><var>#(high)>#
                    low = low + 1
                    high = high - 1
                 else
                    ! If #<data><var>#(low) does not have to follow #<data><var>#(high) than exit.
                    ! There may be a way to rewrite to remove this if.
                    if (low == upper(idx)) then
                       high = low
                       low = low - 1
                    else
                       high = low + 1
                    end if
                    exit
                 end if
              end do

              ! Split splice based on pivot, making sure to throw the smaller splice on the higher end of the stack
              if (upper(idx) - high < low - lower(idx)) then
                 upper(idx + 1) = upper(idx)
                 lower(idx + 1) = high
                 upper(idx) = low
              else
                 upper(idx + 1) = low
                 lower(idx + 1) = lower(idx)
                 lower(idx) = high
              end if
              idx = idx + 1
           end if
        end do
     end if
  end do
end subroutine #<sort><name>##ord##map##data#

