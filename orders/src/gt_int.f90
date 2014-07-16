function gt_int(x,y) result (ordered)
! Arguments
integer, intent(in) :: x
integer, intent(in) :: y
  
! Result
logical :: ordered

! Compare
if (x > y) then
   ordered = .true.
else
   ordered = .false.
end if

end function gt_int

