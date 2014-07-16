function lt_dble(x,y) result (ordered)
! Arguments
double precision, intent(in) :: x
double precision, intent(in) :: y
  
! Result
logical :: ordered

! Compare
if (x < y) then
   ordered = .true.
else
   ordered = .false.
end if

end function lt_dble

