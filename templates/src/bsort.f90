!> @defgroup bsort bsort
!> @date 03/06/2014
module bsort
  use, intrinsic :: iso_fortran_env, only : error_unit
  implicit none

  !> The maximium length of a vector to be sorted using an interchange sort.
  integer, private, save :: max_interchange_sort_size = 20
#SET<sort><interchange_sort>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>#
  interface #<sort><name>#
#SET<map><0>#
#SET<data><dble>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><0>#
#SET<data><int>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><0>#
#SET<data><real>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><true>#
#SET<data><dble>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><true>#
#SET<data><int>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><true>#
#SET<data><real>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
  end interface #<sort><name>#
#SET<sort><quick_sort_flat>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>#
  interface #<sort><name>#
#SET<map><0>#
#SET<data><dble>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><0>#
#SET<data><int>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><0>#
#SET<data><real>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><true>#
#SET<data><dble>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><true>#
#SET<data><int>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><true>#
#SET<data><real>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
  end interface #<sort><name>#
#SET<sort><quick_sort_recursive>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>#
  interface #<sort><name>#
#SET<map><0>#
#SET<data><dble>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><0>#
#SET<data><int>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><0>#
#SET<data><real>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><true>#
#SET<data><dble>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><true>#
#SET<data><int>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#SET<map><true>#
#SET<data><real>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
  end interface #<sort><name>#
#SET<sort><interchange_sort>#
#SET<ord><asc>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>##ord#
  interface #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
  end interface #<sort><name>##ord#
#SET<ord><dec>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>##ord#
  interface #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
  end interface #<sort><name>##ord#
#SET<ord><gen>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>##ord#
  interface #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
  end interface #<sort><name>##ord#
#SET<sort><quick_sort_flat>#
#SET<ord><asc>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>##ord#
  interface #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
  end interface #<sort><name>##ord#
#SET<ord><dec>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>##ord#
  interface #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
  end interface #<sort><name>##ord#
#SET<ord><gen>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>##ord#
  interface #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
  end interface #<sort><name>##ord#
#SET<sort><quick_sort_recursive>#
#SET<ord><asc>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>##ord#
  interface #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
  end interface #<sort><name>##ord#
#SET<ord><dec>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>##ord#
  interface #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
  end interface #<sort><name>##ord#
#SET<ord><gen>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>##ord#
  interface #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><0>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><dble>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><int>#
     module procedure #<sort><name>##ord##map##data#
#SET<map><true>#
#SET<data><real>#
     module procedure #<sort><name>##ord##map##data#
  end interface #<sort><name>##ord#

  !> @ingroup bsort
  !> @defgroup is_sorted
  interface is_sorted
#SET<data><dble>#
     module procedure is_sorted#data#
     module procedure is_sorted_asc#data#
     module procedure is_sorted_gen#data#
#SET<data><int>#
     module procedure is_sorted#data#
     module procedure is_sorted_asc#data#
     module procedure is_sorted_gen#data#
#SET<data><real>#
     module procedure is_sorted#data#
     module procedure is_sorted_asc#data#
     module procedure is_sorted_gen#data#
  end interface is_sorted
#SET<ord><asc>#

  !> @ingroup bsort
  !> @defgroup is_sorted#ord#
  interface is_sorted#ord#
#SET<data><dble>#
     module procedure is_sorted#ord##data#
#SET<data><int>#
     module procedure is_sorted#ord##data#
#SET<data><real>#
     module procedure is_sorted#ord##data#
  end interface is_sorted#ord#
#SET<ord><dec>#

  !> @ingroup bsort
  !> @defgroup is_sorted#ord#
  interface is_sorted#ord#
#SET<data><dble>#
     module procedure is_sorted#ord##data#
#SET<data><int>#
     module procedure is_sorted#ord##data#
#SET<data><real>#
     module procedure is_sorted#ord##data#
  end interface is_sorted#ord#
#SET<ord><gen>#

  !> @ingroup bsort
  !> @defgroup is_sorted#ord#
  interface is_sorted#ord#
#SET<data><dble>#
     module procedure is_sorted#ord##data#
#SET<data><int>#
     module procedure is_sorted#ord##data#
#SET<data><real>#
     module procedure is_sorted#ord##data#
  end interface is_sorted#ord#

  !> @ingroup bsort
  !> @defgroup swap
  interface swap
#SET<data><dble>#
     module procedure swap#data#
#SET<data><int>#
     module procedure swap#data#
#SET<data><real>#
     module procedure swap#data#
  end interface swap
  
contains
#SET<sort><interchange_sort>#

  ! #<sort><name>#
#SET<map><0>#
#SET<data><dble>#
  include '#<sort><name>##map##data#.f90'
#SET<map><0>#
#SET<data><int>#
  include '#<sort><name>##map##data#.f90'
#SET<map><0>#
#SET<data><real>#
  include '#<sort><name>##map##data#.f90'
#SET<map><true>#
#SET<data><dble>#
  include '#<sort><name>##map##data#.f90'
#SET<map><true>#
#SET<data><int>#
  include '#<sort><name>##map##data#.f90'
#SET<map><true>#
#SET<data><real>#
  include '#<sort><name>##map##data#.f90'
#SET<ord><asc>#

  ! #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<ord><dec>#

  ! #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<ord><gen>#

  ! #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<sort><quick_sort_flat>#

  ! #<sort><name>#
#SET<map><0>#
#SET<data><dble>#
  include '#<sort><name>##map##data#.f90'
#SET<map><0>#
#SET<data><int>#
  include '#<sort><name>##map##data#.f90'
#SET<map><0>#
#SET<data><real>#
  include '#<sort><name>##map##data#.f90'
#SET<map><true>#
#SET<data><dble>#
  include '#<sort><name>##map##data#.f90'
#SET<map><true>#
#SET<data><int>#
  include '#<sort><name>##map##data#.f90'
#SET<map><true>#
#SET<data><real>#
  include '#<sort><name>##map##data#.f90'
#SET<ord><asc>#

  ! #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<ord><dec>#

  ! #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<ord><gen>#

  ! #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<sort><quick_sort_recursive>#

  ! #<sort><name>#
#SET<map><0>#
#SET<data><dble>#
  include '#<sort><name>##map##data#.f90'
#SET<map><0>#
#SET<data><int>#
  include '#<sort><name>##map##data#.f90'
#SET<map><0>#
#SET<data><real>#
  include '#<sort><name>##map##data#.f90'
#SET<map><true>#
#SET<data><dble>#
  include '#<sort><name>##map##data#.f90'
#SET<map><true>#
#SET<data><int>#
  include '#<sort><name>##map##data#.f90'
#SET<map><true>#
#SET<data><real>#
  include '#<sort><name>##map##data#.f90'
#SET<ord><asc>#

  ! #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<ord><dec>#

  ! #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<ord><gen>#

  ! #<sort><name>##ord#
#SET<map><0>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><0>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><dble>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><int>#
  include '#<sort><name>##ord##map##data#.f90'
#SET<map><true>#
#SET<data><real>#
  include '#<sort><name>##ord##map##data#.f90'
  
  ! is_sorted
#SET<data><dble>#
  include 'is_sorted#data#.f90'
#SET<data><int>#
  include 'is_sorted#data#.f90'
#SET<data><real>#
  include 'is_sorted#data#.f90'
#SET<ord><asc>#

  ! is_sorted#ord#
#SET<data><dble>#
  include 'is_sorted#ord##data#.f90'
#SET<data><int>#
  include 'is_sorted#ord##data#.f90'
#SET<data><real>#
  include 'is_sorted#ord##data#.f90'
#SET<ord><dec>#

  ! is_sorted#ord#
#SET<data><dble>#
  include 'is_sorted#ord##data#.f90'
#SET<data><int>#
  include 'is_sorted#ord##data#.f90'
#SET<data><real>#
  include 'is_sorted#ord##data#.f90'
#SET<ord><gen>#

  ! is_sorted#ord#
#SET<data><dble>#
  include 'is_sorted#ord##data#.f90'
#SET<data><int>#
  include 'is_sorted#ord##data#.f90'
#SET<data><real>#
  include 'is_sorted#ord##data#.f90'
  
  ! swap
#SET<data><dble>#
  include 'swap#data#.f90'
#SET<data><int>#
  include 'swap#data#.f90'
#SET<data><real>#
  include 'swap#data#.f90'
end module bsort
