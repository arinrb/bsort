!> @brief
!> A module of different orders.
!> 
!> @author Arin R. Bratt
!> @date 12/07/2014
module orders
  interface lt_order
     module procedure lt_dble
     module procedure lt_int
     module procedure lt_real
  end interface lt_order
  interface gtabs_order
     module procedure gtabs_dble
     module procedure gtabs_int
     module procedure gtabs_real
  end interface gtabs_order
  interface gt_order
     module procedure gt_dble
     module procedure gt_int
     module procedure gt_real
  end interface gt_order
contains
  
  ! less than
     include 'lt_dble.f90'
     include 'lt_int.f90'
     include 'lt_real.f90'
  
  ! absoulte value
     include 'gtabs_dble.f90'
     include 'gtabs_int.f90'
     include 'gtabs_real.f90'
  
  ! greater than
     include 'gt_dble.f90'
     include 'gt_int.f90'
     include 'gt_real.f90'
end module orders
     
  
