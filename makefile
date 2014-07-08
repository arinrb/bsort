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

doc:
	rm -rfv $(DOCPATH)
	mkdir -fp $(DOCPATH)
	doxygen Doxyfile
preprocess:
	perl preprocessor.pl
build:	preprocess
	mkdir -p ${OBJPATH}
	mkdir -p $(INCPATH)
	mkdir -p $(LIBPATH)
	mkdir -p $(BINPATH)
	@echo "${NAME}"
	@echo "===================================="
	@echo "Compiling ${NAME}"
	$(FC) -c $(FFLAGS) -o ${OBJPATH}${NAME}.o ${SRC}${NAME}.f90
ifeq (${MAKELIB},0)
else
	@echo "Making ${NAME}"
	ar rc ${NAME}${LIBEXT} ${OBJPATH}${NAME}.o
	@echo "Moving library"
	mv ${NAME}${LIBEXT} ${LIBPATH}${LIBPREFIX}${NAME}${LIBEXT}	
endif
	@echo "Moving mod file"
	mv ${NAME}.mod ${INCPATH}${NAME}.mod
test: build
	mkdir -p ${TESTPATH}${BINPATH}
test_is_sorted: test
	@echo "Build test_is_sorted"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_is_sorted${EXEEXT} ${TESTPATH}${SRC}test_is_sorted.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	rm -rfv ord.mod
	${TESTPATH}${BINPATH}test_is_sorted${EXEEXT}

test_interchange_sort_int: test
	@echo "Build test_interchange_sort_int"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_interchange_sort_int${EXEEXT} ${TESTPATH}${SRC}test_interchange_sort_int.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	rm -rfv ord.mod
	${TESTPATH}${BINPATH}test_interchange_sort_int${EXEEXT}

test_interchange_sort_real: test
	@echo "Build test_interchange_sort_real"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_interchange_sort_real${EXEEXT} ${TESTPATH}${SRC}test_interchange_sort_real.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	rm -rfv ord.mod
	${TESTPATH}${BINPATH}test_interchange_sort_real${EXEEXT}

test_interchange_sort_dble: test
	@echo "Build test_interchange_sort_dble"
	${FC} ${FCFLAGS} -o ${TESTPATH}${BINPATH}test_interchange_sort_dble${EXEEXT} ${TESTPATH}${SRC}test_interchange_sort_dble.f90 -I${INCPATH} -L${LIBPATH} -l${NAME}
	rm -rfv ord.mod
	${TESTPATH}${BINPATH}test_interchange_sort_dble${EXEEXT}

test_interchange_sort: test_interchange_sort_int test_interchange_sort_real test_interchange_sort_dble 

clean:
	rm -rfv /*#
	rm -rfv /*~
	rm -rfv *${OBJPATH}*
	rm -rfv *${BINPATH}*
	rm -fv ${LIBPATH}${LIBPREFIX}${NAME}${LIBEXT}
	rm -fv ${INCPATH}${NAME}${MODEXT}
	rm -rfv *${EXEEXT}
	rm -rfv *.mod
	rm -rfv ${TEMPPATH}${TESTPATH}*~
	rm -rfv ${TEMPPATH}${SRC}*~
	rm -rfv ${TESTPATH}*~
	rm -rfv ${SRC}*~
