!> @brief
!> A module of different orders.
!> 
!> @author Arin R. Bratt
!> @date 12/07/2014
module orders
#SET<orders><lt>#
  interface #<orders><name>#_order
#SET<data><dble>#
     module procedure #<orders><name>##data#
#SET<data><int>#
     module procedure #<orders><name>##data#
#SET<data><real>#
     module procedure #<orders><name>##data#
  end interface #<orders><name>#_order
#SET<orders><gtabs>#
  interface #<orders><name>#_order
#SET<data><dble>#
     module procedure #<orders><name>##data#
#SET<data><int>#
     module procedure #<orders><name>##data#
#SET<data><real>#
     module procedure #<orders><name>##data#
  end interface #<orders><name>#_order
#SET<orders><gt>#
  interface #<orders><name>#_order
#SET<data><dble>#
     module procedure #<orders><name>##data#
#SET<data><int>#
     module procedure #<orders><name>##data#
#SET<data><real>#
     module procedure #<orders><name>##data#
  end interface #<orders><name>#_order
contains
#SET<orders><lt>#
  
  ! #<orders><full>#
#SET<data><dble>#
     include '#<orders><name>##data#.f90'
#SET<data><int>#
     include '#<orders><name>##data#.f90'
#SET<data><real>#
     include '#<orders><name>##data#.f90'
#SET<orders><gtabs>#
  
  ! #<orders><full>#
#SET<data><dble>#
     include '#<orders><name>##data#.f90'
#SET<data><int>#
     include '#<orders><name>##data#.f90'
#SET<data><real>#
     include '#<orders><name>##data#.f90'
#SET<orders><gt>#
  
  ! #<orders><full>#
#SET<data><dble>#
     include '#<orders><name>##data#.f90'
#SET<data><int>#
     include '#<orders><name>##data#.f90'
#SET<data><real>#
     include '#<orders><name>##data#.f90'
end module orders
     
  
