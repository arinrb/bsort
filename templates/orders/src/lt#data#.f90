#SET<orders><lt>#
function #<orders><name>##data#(x,y) result (ordered)
! Arguments
#<data><full>#, intent(in) :: x
#<data><full>#, intent(in) :: y
  
! Result
logical :: ordered

! Compare
if (x < y) then
   ordered = .true.
else
   ordered = .false.
end if

end function #<orders><name>##data#

