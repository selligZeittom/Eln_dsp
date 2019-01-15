################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsl/usbstk5505.c \
../bsl/usbstk5505_gpio.c \
../bsl/usbstk5505_i2c.c \
../bsl/usbstk5505_led.c 

OBJS += \
./bsl/usbstk5505.obj \
./bsl/usbstk5505_gpio.obj \
./bsl/usbstk5505_i2c.obj \
./bsl/usbstk5505_led.obj 

C_DEPS += \
./bsl/usbstk5505.pp \
./bsl/usbstk5505_gpio.pp \
./bsl/usbstk5505_i2c.pp \
./bsl/usbstk5505_led.pp 


# Each subdirectory must supply rules for building sources it contributes
bsl/usbstk5505.obj: ../bsl/usbstk5505.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: C5500 Compiler'
	"C:/ccsv4_bld_14.37/ccsv4/tools/compiler/c5500/bin/cl55" -v5505 -g -O2 --include_path="C:/ccsv4_bld_14.37/ccsv4/tools/compiler/c5500/include" --include_path="C:/New Folder/usbstk5505/lib/../include" --diag_warning=225 --sat_reassoc=off --ptrdiff_size=16 --fp_reassoc=off --memory_model=large --asm_source=mnemonic $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="bsl/usbstk5505.pp" --obj_directory="bsl" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

bsl/usbstk5505_gpio.obj: ../bsl/usbstk5505_gpio.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: C5500 Compiler'
	"C:/ccsv4_bld_14.37/ccsv4/tools/compiler/c5500/bin/cl55" -v5505 -g -O2 --include_path="C:/ccsv4_bld_14.37/ccsv4/tools/compiler/c5500/include" --include_path="C:/New Folder/usbstk5505/lib/../include" --diag_warning=225 --sat_reassoc=off --ptrdiff_size=16 --fp_reassoc=off --memory_model=large --asm_source=mnemonic $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="bsl/usbstk5505_gpio.pp" --obj_directory="bsl" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

bsl/usbstk5505_i2c.obj: ../bsl/usbstk5505_i2c.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: C5500 Compiler'
	"C:/ccsv4_bld_14.37/ccsv4/tools/compiler/c5500/bin/cl55" -v5505 -g -O2 --include_path="C:/ccsv4_bld_14.37/ccsv4/tools/compiler/c5500/include" --include_path="C:/New Folder/usbstk5505/lib/../include" --diag_warning=225 --sat_reassoc=off --ptrdiff_size=16 --fp_reassoc=off --memory_model=large --asm_source=mnemonic $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="bsl/usbstk5505_i2c.pp" --obj_directory="bsl" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

bsl/usbstk5505_led.obj: ../bsl/usbstk5505_led.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: C5500 Compiler'
	"C:/ccsv4_bld_14.37/ccsv4/tools/compiler/c5500/bin/cl55" -v5505 -g -O2 --include_path="C:/ccsv4_bld_14.37/ccsv4/tools/compiler/c5500/include" --include_path="C:/New Folder/usbstk5505/lib/../include" --diag_warning=225 --sat_reassoc=off --ptrdiff_size=16 --fp_reassoc=off --memory_model=large --asm_source=mnemonic $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="bsl/usbstk5505_led.pp" --obj_directory="bsl" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '


