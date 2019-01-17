################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
bsl/usbstk5505.obj: ../bsl/usbstk5505.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C5500 Compiler'
	"C:/ti/C5500 Code Generation Tools 4.4.1/bin/cl55" --include_path="C:/Users/gilles.mottiez/Desktop/C5505_CCS8/include" --include_path="C:/ti/C5500 Code Generation Tools 4.4.1/include" --symdebug:dwarf --diag_warning=225 --memory_model=large --ptrdiff_size=16 --silicon_version=5505 --preproc_with_compile --preproc_dependency="bsl/usbstk5505.d_raw" --obj_directory="bsl" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

bsl/usbstk5505_gpio.obj: ../bsl/usbstk5505_gpio.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C5500 Compiler'
	"C:/ti/C5500 Code Generation Tools 4.4.1/bin/cl55" --include_path="C:/Users/gilles.mottiez/Desktop/C5505_CCS8/include" --include_path="C:/ti/C5500 Code Generation Tools 4.4.1/include" --symdebug:dwarf --diag_warning=225 --memory_model=large --ptrdiff_size=16 --silicon_version=5505 --preproc_with_compile --preproc_dependency="bsl/usbstk5505_gpio.d_raw" --obj_directory="bsl" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

bsl/usbstk5505_i2c.obj: ../bsl/usbstk5505_i2c.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C5500 Compiler'
	"C:/ti/C5500 Code Generation Tools 4.4.1/bin/cl55" --include_path="C:/Users/gilles.mottiez/Desktop/C5505_CCS8/include" --include_path="C:/ti/C5500 Code Generation Tools 4.4.1/include" --symdebug:dwarf --diag_warning=225 --memory_model=large --ptrdiff_size=16 --silicon_version=5505 --preproc_with_compile --preproc_dependency="bsl/usbstk5505_i2c.d_raw" --obj_directory="bsl" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

bsl/usbstk5505_led.obj: ../bsl/usbstk5505_led.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C5500 Compiler'
	"C:/ti/C5500 Code Generation Tools 4.4.1/bin/cl55" --include_path="C:/Users/gilles.mottiez/Desktop/C5505_CCS8/include" --include_path="C:/ti/C5500 Code Generation Tools 4.4.1/include" --symdebug:dwarf --diag_warning=225 --memory_model=large --ptrdiff_size=16 --silicon_version=5505 --preproc_with_compile --preproc_dependency="bsl/usbstk5505_led.d_raw" --obj_directory="bsl" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


