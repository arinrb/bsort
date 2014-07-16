!> @ingroup #<sort><name>#
!> 
!> @brief 
!> Run #<sort><docRef># on a vector of #<data><full># values. 
!>
!> @details 
!> Run #<sort><docRef># on a vector of #<data><full># values to sort them in a specified order. #IF<map><true>THEN<The vector of intergers #<map><name># is permuted in the same way that the vector vec is permuted to be sorted. It is important that #<map><var># be of equal or greather length than vec.>ENDIF#
!>
!> @param #<data><var>#
!> The vector to be sorted.
!>
#IF<map><true>#!> @param #<map><var>#
#IF<map><true>#!> Vector of intergers which is permuted in the same way that #<data><var># is permuted. If #<map><name># is a vector of values 1 to N, where N is the length of #<data><var>#, than, #<map><name># is the map from #<data><var>#'s original value to #<data><var>#'s final value after being sort.
#IF<map><true>#!> 
!> @param ascending
!> Indicates if the ordering is ascending or decending.
!> 
!> | Value | Meaning         |
!> |:-----:| :-------------- |
!> | true  | Ascending order |
!> | false | Decending order |
!>
#IF<map><true>#!> @warning
#IF<map><true>#!> The length of #<map><var># is not checked within this subroutine. If the length of #<data><var># is larger than the length of #<map><name>#, than this subroutine may attempt to access elements of #<map><name># that do not exist.
#IF<map><true>#!> 
!> @author Arin R. Bratt
!> @date 11/07/2014

pure subroutine #<sort><name>##map##data#(#<data><var>##<map><arg>#,ascending)
  ! Arguments
  #<data><full>#, intent(inout) :: #<data><var>#(:)
  #IF<map><true>#integer, intent(inout) :: #<map><var>#(:)
  logical, intent(in) :: ascending
  
  ! Main
  if (ascending) then
     call #<sort><name>#_asc#map##data#(#<data><var>##<map><arg>#)
  else
     call #<sort><name>#_dec#map##data#(#<data><var>##<map><arg>#)
  end if
end subroutine #<sort><name>##map##data#
