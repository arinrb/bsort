function gtabs_real(x,y) result (ordered)
! Arguments
real, intent(in) :: x
real, intent(in) :: y
  
! Result
logical :: ordered

! Compare
if (abs(x) > abs(y)) then
   ordered = .true.
else
   ordered = .false.
end if

end function gtabs_real

