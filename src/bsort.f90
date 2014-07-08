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
     module procedure interchange_sort_vec_int
     module procedure interchange_sort_vec_real
     module procedure interchange_sort_vec_dble
     module procedure interchange_sort_vec_map_int
     module procedure interchange_sort_vec_map_real
     module procedure interchange_sort_vec_map_dble
     module procedure interchange_sort_vec_asc_int
     module procedure interchange_sort_vec_asc_real
     module procedure interchange_sort_vec_asc_dble
     module procedure interchange_sort_vec_asc_map_int
     module procedure interchange_sort_vec_asc_map_real
     module procedure interchange_sort_vec_asc_map_dble
     module procedure interchange_sort_vec_gen_int
     module procedure interchange_sort_vec_gen_real
     module procedure interchange_sort_vec_gen_dble
     module procedure interchange_sort_vec_gen_map_int
     module procedure interchange_sort_vec_gen_map_real
     module procedure interchange_sort_vec_gen_map_dble
  end interface interchange_sort

  !> @ingroup bsort
  !> @defgroup interchange_sort_asc
  interface interchange_sort_asc
     module procedure interchange_sort_vec_asc_int
     module procedure interchange_sort_vec_asc_real
     module procedure interchange_sort_vec_asc_dble
     module procedure interchange_sort_vec_asc_map_int
     module procedure interchange_sort_vec_asc_map_real
     module procedure interchange_sort_vec_asc_map_dble
  end interface interchange_sort_asc

  !> @ingroup bsort
  !> @defgroup interchange_sort_dec
  interface interchange_sort_dec
     module procedure interchange_sort_vec_dec_int
     module procedure interchange_sort_vec_dec_real
     module procedure interchange_sort_vec_dec_dble
     module procedure interchange_sort_vec_dec_map_int
     module procedure interchange_sort_vec_dec_map_real
     module procedure interchange_sort_vec_dec_map_dble
  end interface interchange_sort_dec

  !> @ingroup bsort
  !> @defgroup interchange_sort_gen
  interface interchange_sort_gen
     module procedure interchange_sort_vec_gen_int
     module procedure interchange_sort_vec_gen_real
     module procedure interchange_sort_vec_gen_dble
     module procedure interchange_sort_vec_gen_map_int
     module procedure interchange_sort_vec_gen_map_real
     module procedure interchange_sort_vec_gen_map_dble
  end interface interchange_sort_gen
  

  !> @ingroup bsort
  !> @defgroup is_sorted
  interface is_sorted
     module procedure is_sorted_vec_dble
     module procedure is_sorted_vec_int
     module procedure is_sorted_vec_real
     module procedure is_sorted_vec_asc_dble
     module procedure is_sorted_vec_asc_int
     module procedure is_sorted_vec_asc_real
     module procedure is_sorted_vec_gen_dble
     module procedure is_sorted_vec_gen_int
     module procedure is_sorted_vec_gen_real
  end interface is_sorted

  !> @ingroup bsort
  !> @defgroup is_sorted_asc
  interface is_sorted_asc
     module procedure is_sorted_vec_asc_dble
     module procedure is_sorted_vec_asc_int
     module procedure is_sorted_vec_asc_real
  end interface is_sorted_asc
  
  !> @ingroup bsort
  !> @defgroup is_sorted_dec
  interface is_sorted_dec
     module procedure is_sorted_vec_dec_dble
     module procedure is_sorted_vec_dec_int
     module procedure is_sorted_vec_dec_real
  end interface is_sorted_dec

  !> @ingroup bsort
  !> @defgroup is_sorted_gen
  interface is_sorted_gen
     module procedure is_sorted_vec_gen_dble
     module procedure is_sorted_vec_gen_int
     module procedure is_sorted_vec_gen_real
  end interface is_sorted_gen

  !> @ingroup bsort
  !> @defgroup swap
  interface swap
     module procedure swap_dble
     module procedure swap_int
     module procedure swap_real
     module procedure swap_vec_dble
     module procedure swap_vec_int
     module procedure swap_vec_real
  end interface swap
  
contains

  ! interchange_sort_vec
  include 'interchange_sort_vec_int.f90'
  include 'interchange_sort_vec_real.f90'
  include 'interchange_sort_vec_dble.f90'
  include 'interchange_sort_vec_map_int.f90'
  include 'interchange_sort_vec_map_real.f90'
  include 'interchange_sort_vec_map_dble.f90'

  ! interchange_sort_vec_asc
  include 'interchange_sort_vec_asc_int.f90'
  include 'interchange_sort_vec_asc_real.f90'
  include 'interchange_sort_vec_asc_dble.f90'
  include 'interchange_sort_vec_asc_map_int.f90'
  include 'interchange_sort_vec_asc_map_real.f90'
  include 'interchange_sort_vec_asc_map_dble.f90'

  ! interchange_sort_vec_dec
  include 'interchange_sort_vec_dec_int.f90'
  include 'interchange_sort_vec_dec_real.f90'
  include 'interchange_sort_vec_dec_dble.f90'
  include 'interchange_sort_vec_dec_map_int.f90'
  include 'interchange_sort_vec_dec_map_real.f90'
  include 'interchange_sort_vec_dec_map_dble.f90'

  ! interchange_sort_vec_gen
  include 'interchange_sort_vec_gen_int.f90'
  include 'interchange_sort_vec_gen_real.f90'
  include 'interchange_sort_vec_gen_dble.f90'
  include 'interchange_sort_vec_gen_map_int.f90'
  include 'interchange_sort_vec_gen_map_real.f90'
  include 'interchange_sort_vec_gen_map_dble.f90'
  
  ! is_sorted_vec
  include 'is_sorted_vec_dble.f90'
  include 'is_sorted_vec_int.f90'
  include 'is_sorted_vec_real.f90'

  ! is_sorted_vec_asc
  include 'is_sorted_vec_asc_dble.f90'
  include 'is_sorted_vec_asc_int.f90'
  include 'is_sorted_vec_asc_real.f90'

  ! is_sorted_vec_dec
  include 'is_sorted_vec_dec_dble.f90'
  include 'is_sorted_vec_dec_int.f90'
  include 'is_sorted_vec_dec_real.f90'

  ! is_sorted_vec_gen
  include 'is_sorted_vec_gen_dble.f90'
  include 'is_sorted_vec_gen_int.f90'
  include 'is_sorted_vec_gen_real.f90'
  
  ! swap
  include 'swap_dble.f90'
  include 'swap_int.f90'
  include 'swap_real.f90'
  include 'swap_vec_dble.f90'
  include 'swap_vec_int.f90'
  include 'swap_vec_real.f90'

end module bsort
