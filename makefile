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
clean:
	rm -rfv *#
	rm -rfv *~
	rm -rfv ${OBJPATH}*
	rm -rfv ${BINPATH}*
	rm -fv ${LIBPATH}${LIBPREFIX}${NAME}${LIBEXT}
	rm -fv ${INCPATH}${NAME}${MODEXT}
	rm -rfv *${EXEEXT}

