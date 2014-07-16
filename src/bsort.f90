!> @defgroup bsort bsort
!> @date 03/06/2014
module bsort
  use, intrinsic :: iso_fortran_env, only : error_unit
  implicit none

  !> The maximium length of a vector to be sorted using an interchange sort.
  integer, private, save :: max_interchange_sort_size = 20

  !> @ingroup bsort
  !> @defgroup interchange_sort
  interface interchange_sort
     module procedure interchange_sort_dble
     module procedure interchange_sort_asc_dble
     module procedure interchange_sort_gen_dble
     module procedure interchange_sort_int
     module procedure interchange_sort_asc_int
     module procedure interchange_sort_gen_int
     module procedure interchange_sort_real
     module procedure interchange_sort_asc_real
     module procedure interchange_sort_gen_real
     module procedure interchange_sort_map_dble
     module procedure interchange_sort_asc_map_dble
     module procedure interchange_sort_gen_map_dble
     module procedure interchange_sort_map_int
     module procedure interchange_sort_asc_map_int
     module procedure interchange_sort_gen_map_int
     module procedure interchange_sort_map_real
     module procedure interchange_sort_asc_map_real
     module procedure interchange_sort_gen_map_real
  end interface interchange_sort

  !> @ingroup bsort
  !> @defgroup quick_sort_flat
  interface quick_sort_flat
     module procedure quick_sort_flat_dble
     module procedure quick_sort_flat_asc_dble
     module procedure quick_sort_flat_gen_dble
     module procedure quick_sort_flat_int
     module procedure quick_sort_flat_asc_int
     module procedure quick_sort_flat_gen_int
     module procedure quick_sort_flat_real
     module procedure quick_sort_flat_asc_real
     module procedure quick_sort_flat_gen_real
     module procedure quick_sort_flat_map_dble
     module procedure quick_sort_flat_asc_map_dble
     module procedure quick_sort_flat_gen_map_dble
     module procedure quick_sort_flat_map_int
     module procedure quick_sort_flat_asc_map_int
     module procedure quick_sort_flat_gen_map_int
     module procedure quick_sort_flat_map_real
     module procedure quick_sort_flat_asc_map_real
     module procedure quick_sort_flat_gen_map_real
  end interface quick_sort_flat

  !> @ingroup bsort
  !> @defgroup quick_sort_recursive
  interface quick_sort_recursive
     module procedure quick_sort_recursive_dble
     module procedure quick_sort_recursive_asc_dble
     module procedure quick_sort_recursive_gen_dble
     module procedure quick_sort_recursive_int
     module procedure quick_sort_recursive_asc_int
     module procedure quick_sort_recursive_gen_int
     module procedure quick_sort_recursive_real
     module procedure quick_sort_recursive_asc_real
     module procedure quick_sort_recursive_gen_real
     module procedure quick_sort_recursive_map_dble
     module procedure quick_sort_recursive_asc_map_dble
     module procedure quick_sort_recursive_gen_map_dble
     module procedure quick_sort_recursive_map_int
     module procedure quick_sort_recursive_asc_map_int
     module procedure quick_sort_recursive_gen_map_int
     module procedure quick_sort_recursive_map_real
     module procedure quick_sort_recursive_asc_map_real
     module procedure quick_sort_recursive_gen_map_real
  end interface quick_sort_recursive

  !> @ingroup bsort
  !> @defgroup interchange_sort_asc
  interface interchange_sort_asc
     module procedure interchange_sort_asc_dble
     module procedure interchange_sort_asc_int
     module procedure interchange_sort_asc_real
     module procedure interchange_sort_asc_map_dble
     module procedure interchange_sort_asc_map_int
     module procedure interchange_sort_asc_map_real
  end interface interchange_sort_asc

  !> @ingroup bsort
  !> @defgroup interchange_sort_dec
  interface interchange_sort_dec
     module procedure interchange_sort_dec_dble
     module procedure interchange_sort_dec_int
     module procedure interchange_sort_dec_real
     module procedure interchange_sort_dec_map_dble
     module procedure interchange_sort_dec_map_int
     module procedure interchange_sort_dec_map_real
  end interface interchange_sort_dec

  !> @ingroup bsort
  !> @defgroup interchange_sort_gen
  interface interchange_sort_gen
     module procedure interchange_sort_gen_dble
     module procedure interchange_sort_gen_int
     module procedure interchange_sort_gen_real
     module procedure interchange_sort_gen_map_dble
     module procedure interchange_sort_gen_map_int
     module procedure interchange_sort_gen_map_real
  end interface interchange_sort_gen

  !> @ingroup bsort
  !> @defgroup quick_sort_flat_asc
  interface quick_sort_flat_asc
     module procedure quick_sort_flat_asc_dble
     module procedure quick_sort_flat_asc_int
     module procedure quick_sort_flat_asc_real
     module procedure quick_sort_flat_asc_map_dble
     module procedure quick_sort_flat_asc_map_int
     module procedure quick_sort_flat_asc_map_real
  end interface quick_sort_flat_asc

  !> @ingroup bsort
  !> @defgroup quick_sort_flat_dec
  interface quick_sort_flat_dec
     module procedure quick_sort_flat_dec_dble
     module procedure quick_sort_flat_dec_int
     module procedure quick_sort_flat_dec_real
     module procedure quick_sort_flat_dec_map_dble
     module procedure quick_sort_flat_dec_map_int
     module procedure quick_sort_flat_dec_map_real
  end interface quick_sort_flat_dec

  !> @ingroup bsort
  !> @defgroup quick_sort_flat_gen
  interface quick_sort_flat_gen
     module procedure quick_sort_flat_gen_dble
     module procedure quick_sort_flat_gen_int
     module procedure quick_sort_flat_gen_real
     module procedure quick_sort_flat_gen_map_dble
     module procedure quick_sort_flat_gen_map_int
     module procedure quick_sort_flat_gen_map_real
  end interface quick_sort_flat_gen

  !> @ingroup bsort
  !> @defgroup quick_sort_recursive_asc
  interface quick_sort_recursive_asc
     module procedure quick_sort_recursive_asc_dble
     module procedure quick_sort_recursive_asc_int
     module procedure quick_sort_recursive_asc_real
     module procedure quick_sort_recursive_asc_map_dble
     module procedure quick_sort_recursive_asc_map_int
     module procedure quick_sort_recursive_asc_map_real
  end interface quick_sort_recursive_asc

  !> @ingroup bsort
  !> @defgroup quick_sort_recursive_dec
  interface quick_sort_recursive_dec
     module procedure quick_sort_recursive_dec_dble
     module procedure quick_sort_recursive_dec_int
     module procedure quick_sort_recursive_dec_real
     module procedure quick_sort_recursive_dec_map_dble
     module procedure quick_sort_recursive_dec_map_int
     module procedure quick_sort_recursive_dec_map_real
  end interface quick_sort_recursive_dec

  !> @ingroup bsort
  !> @defgroup quick_sort_recursive_gen
  interface quick_sort_recursive_gen
     module procedure quick_sort_recursive_gen_dble
     module procedure quick_sort_recursive_gen_int
     module procedure quick_sort_recursive_gen_real
     module procedure quick_sort_recursive_gen_map_dble
     module procedure quick_sort_recursive_gen_map_int
     module procedure quick_sort_recursive_gen_map_real
  end interface quick_sort_recursive_gen

  !> @ingroup bsort
  !> @defgroup is_sorted
  interface is_sorted
     module procedure is_sorted_dble
     module procedure is_sorted_asc_dble
     module procedure is_sorted_gen_dble
     module procedure is_sorted_int
     module procedure is_sorted_asc_int
     module procedure is_sorted_gen_int
     module procedure is_sorted_real
     module procedure is_sorted_asc_real
     module procedure is_sorted_gen_real
  end interface is_sorted

  !> @ingroup bsort
  !> @defgroup is_sorted_asc
  interface is_sorted_asc
     module procedure is_sorted_asc_dble
     module procedure is_sorted_asc_int
     module procedure is_sorted_asc_real
  end interface is_sorted_asc

  !> @ingroup bsort
  !> @defgroup is_sorted_dec
  interface is_sorted_dec
     module procedure is_sorted_dec_dble
     module procedure is_sorted_dec_int
     module procedure is_sorted_dec_real
  end interface is_sorted_dec

  !> @ingroup bsort
  !> @defgroup is_sorted_gen
  interface is_sorted_gen
     module procedure is_sorted_gen_dble
     module procedure is_sorted_gen_int
     module procedure is_sorted_gen_real
  end interface is_sorted_gen

  !> @ingroup bsort
  !> @defgroup swap
  interface swap
     module procedure swap_dble
     module procedure swap_int
     module procedure swap_real
  end interface swap
  
contains

  ! interchange_sort
  include 'interchange_sort_dble.f90'
  include 'interchange_sort_int.f90'
  include 'interchange_sort_real.f90'
  include 'interchange_sort_map_dble.f90'
  include 'interchange_sort_map_int.f90'
  include 'interchange_sort_map_real.f90'

  ! interchange_sort_asc
  include 'interchange_sort_asc_dble.f90'
  include 'interchange_sort_asc_int.f90'
  include 'interchange_sort_asc_real.f90'
  include 'interchange_sort_asc_map_dble.f90'
  include 'interchange_sort_asc_map_int.f90'
  include 'interchange_sort_asc_map_real.f90'

  ! interchange_sort_dec
  include 'interchange_sort_dec_dble.f90'
  include 'interchange_sort_dec_int.f90'
  include 'interchange_sort_dec_real.f90'
  include 'interchange_sort_dec_map_dble.f90'
  include 'interchange_sort_dec_map_int.f90'
  include 'interchange_sort_dec_map_real.f90'

  ! interchange_sort_gen
  include 'interchange_sort_gen_dble.f90'
  include 'interchange_sort_gen_int.f90'
  include 'interchange_sort_gen_real.f90'
  include 'interchange_sort_gen_map_dble.f90'
  include 'interchange_sort_gen_map_int.f90'
  include 'interchange_sort_gen_map_real.f90'

  ! quick_sort_flat
  include 'quick_sort_flat_dble.f90'
  include 'quick_sort_flat_int.f90'
  include 'quick_sort_flat_real.f90'
  include 'quick_sort_flat_map_dble.f90'
  include 'quick_sort_flat_map_int.f90'
  include 'quick_sort_flat_map_real.f90'

  ! quick_sort_flat_asc
  include 'quick_sort_flat_asc_dble.f90'
  include 'quick_sort_flat_asc_int.f90'
  include 'quick_sort_flat_asc_real.f90'
  include 'quick_sort_flat_asc_map_dble.f90'
  include 'quick_sort_flat_asc_map_int.f90'
  include 'quick_sort_flat_asc_map_real.f90'

  ! quick_sort_flat_dec
  include 'quick_sort_flat_dec_dble.f90'
  include 'quick_sort_flat_dec_int.f90'
  include 'quick_sort_flat_dec_real.f90'
  include 'quick_sort_flat_dec_map_dble.f90'
  include 'quick_sort_flat_dec_map_int.f90'
  include 'quick_sort_flat_dec_map_real.f90'

  ! quick_sort_flat_gen
  include 'quick_sort_flat_gen_dble.f90'
  include 'quick_sort_flat_gen_int.f90'
  include 'quick_sort_flat_gen_real.f90'
  include 'quick_sort_flat_gen_map_dble.f90'
  include 'quick_sort_flat_gen_map_int.f90'
  include 'quick_sort_flat_gen_map_real.f90'

  ! quick_sort_recursive
  include 'quick_sort_recursive_dble.f90'
  include 'quick_sort_recursive_int.f90'
  include 'quick_sort_recursive_real.f90'
  include 'quick_sort_recursive_map_dble.f90'
  include 'quick_sort_recursive_map_int.f90'
  include 'quick_sort_recursive_map_real.f90'

  ! quick_sort_recursive_asc
  include 'quick_sort_recursive_asc_dble.f90'
  include 'quick_sort_recursive_asc_int.f90'
  include 'quick_sort_recursive_asc_real.f90'
  include 'quick_sort_recursive_asc_map_dble.f90'
  include 'quick_sort_recursive_asc_map_int.f90'
  include 'quick_sort_recursive_asc_map_real.f90'

  ! quick_sort_recursive_dec
  include 'quick_sort_recursive_dec_dble.f90'
  include 'quick_sort_recursive_dec_int.f90'
  include 'quick_sort_recursive_dec_real.f90'
  include 'quick_sort_recursive_dec_map_dble.f90'
  include 'quick_sort_recursive_dec_map_int.f90'
  include 'quick_sort_recursive_dec_map_real.f90'

  ! quick_sort_recursive_gen
  include 'quick_sort_recursive_gen_dble.f90'
  include 'quick_sort_recursive_gen_int.f90'
  include 'quick_sort_recursive_gen_real.f90'
  include 'quick_sort_recursive_gen_map_dble.f90'
  include 'quick_sort_recursive_gen_map_int.f90'
  include 'quick_sort_recursive_gen_map_real.f90'
  
  ! is_sorted
  include 'is_sorted_dble.f90'
  include 'is_sorted_int.f90'
  include 'is_sorted_real.f90'

  ! is_sorted_asc
  include 'is_sorted_asc_dble.f90'
  include 'is_sorted_asc_int.f90'
  include 'is_sorted_asc_real.f90'

  ! is_sorted_dec
  include 'is_sorted_dec_dble.f90'
  include 'is_sorted_dec_int.f90'
  include 'is_sorted_dec_real.f90'

  ! is_sorted_gen
  include 'is_sorted_gen_dble.f90'
  include 'is_sorted_gen_int.f90'
  include 'is_sorted_gen_real.f90'
  
  ! swap
  include 'swap_dble.f90'
  include 'swap_int.f90'
  include 'swap_real.f90'
end module bsort
