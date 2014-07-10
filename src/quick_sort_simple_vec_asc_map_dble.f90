!> @ingroup quick_sort_asc
!>
!> @brief 
!> Sort a vector of double precision values using a quick sort.
!>
!> @details
!> Sort a vector of double precision values using a three partition recursive quick sort that uses a median pivot and uses a interchange sort for short vectors.
!> 
!> @param vec
!> The vector to be sorted.
!>
!> @param map
!> Vector of intergers which is permuted in the same way that vec is permuted. If map is a vector of values 1 to N, where N is the length of vec, than, map is the map from vec's original value to vec's final value after the sort.
!> 
!>  
!> @note
!> Error will occur if max_interchange_sort_size is less than one.
!>
!> @warning
!> The length of map is not checked within this subroutine. If the length of vec is larger than the length of map, than this subroutine may attempt to access elements of map that do not exist.
!> 
!> @author Arin R. Bratt
!> @date 07/07/2014

!pure subroutine quick_sort_vec_asc_map_dble(vec,map)
!> 
!> @warning
!> Still working!
recursive subroutine quick_sort_vec_asc_map_dble(vec,map)
  ! Arguments
  double precision, intent(inout) :: vec(:)
  integer, intent(inout) :: map(:)

  ! Variables
  integer :: low
  integer :: high
  integer :: low_eq
  integer :: high_eq
!  integer :: mid
  double precision :: pivot
  double precision :: temp

  ! Go to interchange sort if too small
  if (size(vec,1) <= max_interchange_sort_size) then
     ! Run interchange sort on small vectors
     call interchange_sort_vec_asc_map_dble(vec,map)
  else
     ! Initilize values
     low = 1
     high = size(vec,1)
!     low_eq = 2
     low_eq = 1
     high_eq = size(vec,1)

     ! Build pivot
     pivot = (vec(high) + vec(low)) / 2
     if (vec(low) > vec(high)) call swap(vec(low),vec(high))
     
     ! Process median
     
     !mid = (low + high) / 2
     !if (vec(high) > vec(mid)) then
     !   if (vec(low) > vec(mid)) then
     !      if (vec(high) > vec(low)) then
     !         ! high low mid
     !         call swap(vec(mid),vec(low))
     !      else
     !         ! low high mid
     !         temp = vec(low)
     !         vec(low) = vec(mid)
     !         vec(mid) = vec(high)
     !         vec(high) = temp
     !      end if
     !   end if
     !else
      !  if (vec(low) > vec(mid)) then
       !    ! low mid high
        !   call swap(vec(low),vec(high))
       ! else
        !   if (vec(high) > vec(low)) then
          !    ! mid high low
         !     call swap(vec(mid),vec(high))
  !         else
   !           ! mid low high
    !          temp = vec(low)
     !         vec(low) = vec(high)
      !        vec(high) = vec(mid)
       !       vec(mid) = temp
       !    end if
       ! end if
     !end if
     !pivot = vec(mid)
     ! Move pivot to low eq
     !low = low + 1
    ! call swap(vec(mid),vec(low))
    ! call swap(vec(low - 1),vec(low))

     ! Initilize values for main loop

     ! Main loop with three way partition
     do 
        ! Find pivot points
        do
           low = low + 1
           if (.not. pivot > vec(low)) exit
        end do
        do 
           high = high - 1
           if (.not. vec(high) > pivot .or. high == 1) exit
        end do

        ! Exit if they are on the wrong side of the pivot
        if (low >= high) exit

        ! Run main quick sort swap
        call swap(vec(low),vec(high))

        ! Check for if values are equal to pivot, if so swap
        if (.not. vec(high) > pivot) then
           call swap(vec(high),vec(high_eq))
           high_eq = high_eq - 1
        end if

        if (.not. pivot > vec(low)) then
           call swap(vec(low),vec(low_eq))
           low_eq = low_eq + 1
        end if
     end do
     high = low - 1


     ! Move equals to the middle
     do while(1 < low_eq)
        low_eq = low_eq - 1
        call swap(vec(low_eq),vec(high))
        high = high - 1
     end do
     
     do while(high_eq < size(vec,1))
        high_eq = high_eq + 1
        call swap(vec(high_eq),vec(low))
        low = low + 1
     end do
     
     ! Recursive calls 
     if (size(vec,1) - low > high - 1) then
        if (high > 1) then
            call quick_sort_vec_asc_map_dble(vec(1:high),map(1:high))
        end if
   
        if (low < size(vec,1)) then
           call quick_sort_vec_asc_map_dble(vec(low:),map(low:))
        end if
     else
        if (low < size(vec,1)) then
           call quick_sort_vec_asc_map_dble(vec(low:),map(low:))
        end if

        if (high > 1) then
            call quick_sort_vec_asc_map_dble(vec(1:high),map(1:high))
        end if
     end if
  end if
end subroutine quick_sort_vec_asc_map_dble

