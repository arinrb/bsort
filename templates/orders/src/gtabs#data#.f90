#SET<orders><gtabs>#
function #<orders><name>##data#(x,y) result (ordered)
! Arguments
#<data><full>#, intent(in) :: x
#<data><full>#, intent(in) :: y
  
! Result
logical :: ordered

! Compare
#IF<data><int>#if (abs(real(x)) > abs(real(y))) then
#UNLESS<data><int>#if (abs(x) > abs(y)) then
   ordered = .true.
else
   ordered = .false.
end if

end function #<orders><name>##data#

