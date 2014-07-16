function gtabs_int(x,y) result (ordered)
! Arguments
integer, intent(in) :: x
integer, intent(in) :: y
  
! Result
logical :: ordered

! Compare
if (abs(real(x)) > abs(real(y))) then
   ordered = .true.
else
   ordered = .false.
end if

end function gtabs_int

