!> @brief
!> A module of different orders.
!> 
!> @author Arin R. Bratt
!> @date 12/07/2014
module orders
#FOR<#orders#>#
  interface #<orders><name>#_order
#FOR<#data#>#
     module procedure #<orders><name>##data#
#ENDFOR<#data#>#
  end interface #<orders><name>#_order
#ENDFOR<#orders#>#
contains
#FOR<#orders#>#
  
  ! #<orders><full>#
#FOR<#data#>#
     include '#<orders><name>##data#.f90'
#ENDFOR<#data#>#
#ENDFOR<#orders#>#
end module orders
     
  
