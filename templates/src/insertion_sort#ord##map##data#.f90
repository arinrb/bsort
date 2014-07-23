#SET<sort><insertion_sort>#
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
  #<data><full># :: #<data><scalar>#
  #<data><full># :: #<data><swap>#
  integer :: i
  integer :: j
  
  
  ! Sort to the first element
  if (#ORD<#<data><var>#(#SIZE#)><#<data><var>#(1)>#) then
     #<data><scalar># = #<data><var>#(1)
  else
     #<data><scalar># = #<data><var>#(#SIZE#)
     #<data><var>#(#SIZE#) = #<data><var>#(1)
  end if
  
  do i = #SIZE# - 1,2,-1
     if (#ORD<#<data><scalar>#><#<data><var>#(i)>#) then
        #SWAP<#data#><#<data><scalar>#><#<data><var>#(i)>#
     end if
  end do

  ! Run regualr insertion sort
  do j = 3,#SIZE#
     #<data><swap># = #<data><var>#(j)
     i = j - 1
     if (#ORD<#<data><var>#(i)><#<data><swap>#>#) then
        #<data><var>#(j) = #<data><var>#(i)
        i = i - 1
        do
           if (.not. #ORD<#<data><var>#(i)><#<data><swap>#>#) exit
           #<data><var>#(i + 1) = #<data><var>#(i)
           i = i - 1
        end do
        #<data><var>#(i + 1) = #<data><swap>#
     end if
  end do
end subroutine #<sort><name>##ord##map##data#


