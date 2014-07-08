!> @defgroup bsort bsort
!> @date 03/06/2014
module bsort
  use, intrinsic :: iso_fortran_env, only : error_unit
  implicit none

  !> The maximium length of a vector to be sorted using an interchange sort.
  integer, private, save :: max_interchange_sort_size = 20

  !> @ingroup bsort
  !> @defgroup is_sorted
  !> 
  !> @brief
  !> Checks if a vector is sorted.
  !> 
  !> @details
  !> Checks if a vector is sorted.
  !> 
  !> @retval sorted
  !> Indicated if the vector vec is sorted in the specified order.
  !> 
  !> | Value | Meaning                  |
  !> |:-----:|:-------------------------|
  !> | T     | The vector is sorted     |
  !> | F     | The vector is not sorted |
  !> 
  !> @param x
  !> The vector to be sorted.
  !> 
  !> @param sort_type
  !> Indicates the ordering to be checked for. The default value is 'A'. If an invalid value is passed, than a value of not sorted is returned.
  !> 
  !> | Value | Meaning         |
  !> |:-----:|:----------------|
  !> | A     | Ascending order |
  !> | F     | Decending order |
  !> 
  !> @note
  !> In prior versions of this function, an interger was returns instread of a logical. If the vector was not sorted, than the interger would indicate the position of the first two pairwise elements where one element was larger than the following element. This proved to not be useful and was taken out. If need for this functionally is determined in the future, than it has been decided that it will be implimented in a different function, most likely wrapped in the same interface.
  !> 
  !> @note
  !> An empty vector is considered sorted.
  !>
  !> @author Arin R. Bratt
  !> @date 01/07/2014
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

  !> @defgroup is_sorted_asc
  interface is_sorted_asc
     module procedure is_sorted_vec_asc_dble
     module procedure is_sorted_vec_asc_int
     module procedure is_sorted_vec_asc_real
  end interface is_sorted_asc
  

  !> @defgroup is_sorted_dec
  interface is_sorted_dec
     module procedure is_sorted_vec_dec_dble
     module procedure is_sorted_vec_dec_int
     module procedure is_sorted_vec_dec_real
  end interface is_sorted_dec

  !> @defgroup swap
  !> 
  !> @brief
  !> Swap two values.
  !> 
  !> @detials
  !> Swap two values or swap two values in a vector.
  !>
  !> @author Arin R. 
  !> @date 07/07/2014            

  interface swap
     module procedure swap_dble
     module procedure swap_int
     module procedure swap_real
     module procedure swap_vec_dble
     module procedure swap_vec_int
     module procedure swap_vec_real
  end interface swap
  
contains

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
