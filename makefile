#Fortran complier, currently the following compliers are supported by this make
#file; however, this is not a limitation on the list of compliers the library
#will work with.
# ifort
# gfortran	
FC=gfortran

#Name
NAME=bsort

#Optimization level set this to override the complier default
FCOPT=-O3

#Documention path
DOCPATH=doc/

#Library path
LIBPATH=lib/

#Include path
INCPATH=inc/

#Library extension
LIBEXT=.a

#Library prefix
LIBPREFIX=lib

#Object files
OBJPATH=obj/

#Executable file extension
EXEEXT=.out

#Binary path
BINPATH=bin/

#Module extention
MODEXT=.mod

#Fortran warnings
FCWARN=-Wall
ifeq ($(FC),ifort)
FCWARN=-warn
endif

#OPENMP
FOPENMP=-fopenmp

#Test path
TESTPATH=test/

#Template path
TEMPPATH=templates/

#SRC
SRC=src/

#Fortran debug
FCDEBUG=

#Make library
MAKELIB=1

#Set Fortran flags
FCFLAGS=${FCOPT} ${FCWARN} ${FCDEBUG}
.PHONY: orders build
doc:
	rm -rfv $(DOCPATH)
	mkdir -fp $(DOCPATH)
	doxygen Doxyfile
preprocess:
	perl preprocessor.pl
build:	
	mkdir -p ${OBJPATH}
	mkdir -p $(INCPATH)
	mkdir -p $(LIBPATH)
	mkdir -p $(BINPATH)
	@echo "${NAME}"
	@echo "===================================="
	@echo "Compiling ${NAME}"
	$(FC) -c $(FFLAGS) -o ${OBJPATH}${NAME}.o ${SRC}${NAME}.f90 ${FOPENMP}
ifeq (${MAKELIB},0)
else
	@echo "Making ${NAME}"
	ar rc ${NAME}${LIBEXT} ${OBJPATH}${NAME}.o
	@echo "Moving library"
	mv ${NAME}${LIBEXT} ${LIBPATH}${LIBPREFIX}${NAME}${LIBEXT}	
endif
	@echo "Moving mod file"
	mv ${NAME}.mod ${INCPATH}${NAME}.mod

orders:	
	mkdir -p orders/${BINPATH}
		@echo "orders"
	@echo "==================================="
	@echo "Compiling orders"
	$(FC) -c $(FFLAGS) -o ${OBJPATH}orders.o orders/${SRC}orders.f90 ${FOPENMP}
	@echo "Moving mod file"
	mv orders.mod ${INCPATH}orders.mod

test: build orders test_interchange_sort test_insertion_sort test_quick_sort_flat test_quick_sort_recursive
	mkdir -p ${TESTPATH}${BINPATH}
test_interchange_sort: test_interchange_sort_dble test_interchange_sort_int test_interchange_sort_real
test_interchange_sort_dble:
	@echo "Build test_interchange_sort_dble"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_interchange_sort_dble${EXEEXT} ${OBJPATH}orders.o ${TESTPATH}${SRC}test_interchange_sort_dble.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	${TESTPATH}${BINPATH}test_interchange_sort_dble${EXEEXT}
test_interchange_sort_int:
	@echo "Build test_interchange_sort_int"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_interchange_sort_int${EXEEXT} ${OBJPATH}orders.o ${TESTPATH}${SRC}test_interchange_sort_int.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	${TESTPATH}${BINPATH}test_interchange_sort_int${EXEEXT}
test_interchange_sort_real:
	@echo "Build test_interchange_sort_real"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_interchange_sort_real${EXEEXT} ${OBJPATH}orders.o ${TESTPATH}${SRC}test_interchange_sort_real.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	${TESTPATH}${BINPATH}test_interchange_sort_real${EXEEXT}
test_insertion_sort: test_insertion_sort_dble test_insertion_sort_int test_insertion_sort_real
test_insertion_sort_dble:
	@echo "Build test_insertion_sort_dble"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_insertion_sort_dble${EXEEXT} ${OBJPATH}orders.o ${TESTPATH}${SRC}test_insertion_sort_dble.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	${TESTPATH}${BINPATH}test_insertion_sort_dble${EXEEXT}
test_insertion_sort_int:
	@echo "Build test_insertion_sort_int"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_insertion_sort_int${EXEEXT} ${OBJPATH}orders.o ${TESTPATH}${SRC}test_insertion_sort_int.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	${TESTPATH}${BINPATH}test_insertion_sort_int${EXEEXT}
test_insertion_sort_real:
	@echo "Build test_insertion_sort_real"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_insertion_sort_real${EXEEXT} ${OBJPATH}orders.o ${TESTPATH}${SRC}test_insertion_sort_real.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	${TESTPATH}${BINPATH}test_insertion_sort_real${EXEEXT}
test_quick_sort_flat: test_quick_sort_flat_dble test_quick_sort_flat_int test_quick_sort_flat_real
test_quick_sort_flat_dble:
	@echo "Build test_quick_sort_flat_dble"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_quick_sort_flat_dble${EXEEXT} ${OBJPATH}orders.o ${TESTPATH}${SRC}test_quick_sort_flat_dble.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	${TESTPATH}${BINPATH}test_quick_sort_flat_dble${EXEEXT}
test_quick_sort_flat_int:
	@echo "Build test_quick_sort_flat_int"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_quick_sort_flat_int${EXEEXT} ${OBJPATH}orders.o ${TESTPATH}${SRC}test_quick_sort_flat_int.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	${TESTPATH}${BINPATH}test_quick_sort_flat_int${EXEEXT}
test_quick_sort_flat_real:
	@echo "Build test_quick_sort_flat_real"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_quick_sort_flat_real${EXEEXT} ${OBJPATH}orders.o ${TESTPATH}${SRC}test_quick_sort_flat_real.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	${TESTPATH}${BINPATH}test_quick_sort_flat_real${EXEEXT}
test_quick_sort_recursive: test_quick_sort_recursive_dble test_quick_sort_recursive_int test_quick_sort_recursive_real
test_quick_sort_recursive_dble:
	@echo "Build test_quick_sort_recursive_dble"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_quick_sort_recursive_dble${EXEEXT} ${OBJPATH}orders.o ${TESTPATH}${SRC}test_quick_sort_recursive_dble.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	${TESTPATH}${BINPATH}test_quick_sort_recursive_dble${EXEEXT}
test_quick_sort_recursive_int:
	@echo "Build test_quick_sort_recursive_int"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_quick_sort_recursive_int${EXEEXT} ${OBJPATH}orders.o ${TESTPATH}${SRC}test_quick_sort_recursive_int.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	${TESTPATH}${BINPATH}test_quick_sort_recursive_int${EXEEXT}
test_quick_sort_recursive_real:
	@echo "Build test_quick_sort_recursive_real"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_quick_sort_recursive_real${EXEEXT} ${OBJPATH}orders.o ${TESTPATH}${SRC}test_quick_sort_recursive_real.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	${TESTPATH}${BINPATH}test_quick_sort_recursive_real${EXEEXT}
clean:
	rm -rfv *~
	rm -rfv *${OBJPATH}*
	rm -rfv *${BINPATH}*
	rm -fv ${LIBPATH}${LIBPREFIX}${NAME}${LIBEXT}
	rm -fv ${INCPATH}${NAME}${MODEXT}
	rm -fv ${INCPATH}orders${MODEXT}
	rm -rfv *${EXEEXT}
	rm -rfv *.mod
	rm -rfv ${TEMPPATH}${TESTPATH}${SRC}*~
	rm -rfv ${TEMPPATH}${SRC}*~
	rm -rfv ${TESTPATH}*
	rm -rfv ${SRC}*
