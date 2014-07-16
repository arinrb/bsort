!> @defgroup bsort bsort
!> @date 03/06/2014
module bsort
  use, intrinsic :: iso_fortran_env, only : error_unit
  implicit none

  !> The maximium length of a vector to be sorted using an interchange sort.
  integer, private, save :: max_interchange_sort_size = 20
#FOR<#sort#>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>#
  interface #<sort><name>#
#FOR<#map##data#>#
     module procedure #<sort><name>##map##data#
     module procedure #<sort><name>#_asc#map##data#
     module procedure #<sort><name>#_gen#map##data#
#ENDFOR<#map##data#>#
  end interface #<sort><name>#
#ENDFOR<#sort#>#
#FOR<#sort#>#
#FOR<#ord#>#

  !> @ingroup bsort
  !> @defgroup #<sort><name>##ord#
  interface #<sort><name>##ord#
#FOR<#map##data#>#
     module procedure #<sort><name>##ord##map##data#
#ENDFOR<#map##data#>#
  end interface #<sort><name>##ord#
#ENDFOR<#ord#>#
#ENDFOR<#sort#>#

  !> @ingroup bsort
  !> @defgroup is_sorted
  interface is_sorted
#FOR<#data#>#
     module procedure is_sorted#data#
     module procedure is_sorted_asc#data#
     module procedure is_sorted_gen#data#
#ENDFOR<#data#>#
  end interface is_sorted
#FOR<#ord#>#

  !> @ingroup bsort
  !> @defgroup is_sorted#ord#
  interface is_sorted#ord#
#FOR<#data#>#
     module procedure is_sorted#ord##data#
#ENDFOR<#data#>#
  end interface is_sorted#ord#
#ENDFOR<#ord#>#

  !> @ingroup bsort
  !> @defgroup swap
  interface swap
#FOR<#data#>#
     module procedure swap#data#
#ENDFOR<#data#>#
  end interface swap
  
contains
#FOR<#sort#>#

  ! #<sort><name>#
#FOR<#map##data#>#
  include '#<sort><name>##map##data#.f90'
#ENDFOR<#map##data#>#
#FOR<#ord#>#

  ! #<sort><name>##ord#
#FOR<#map##data#>#
  include '#<sort><name>##ord##map##data#.f90'
#ENDFOR<#map##data#>#
#ENDFOR<#ord#>#
#ENDFOR<#sort#>#
  
  ! is_sorted
#FOR<#data#>#
  include 'is_sorted#data#.f90'
#ENDFOR<#data#>#
#FOR<#ord#>#

  ! is_sorted#ord#
#FOR<#data#>#
  include 'is_sorted#ord##data#.f90'
#ENDFOR<#data#>#
#ENDFOR<#ord#>#
  
  ! swap
#FOR<#data#>#
  include 'swap#data#.f90'
#ENDFOR<#data#>#
end module bsort
