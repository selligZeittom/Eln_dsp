################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
aic3204_init.obj: ../aic3204_init.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C5500 Compiler'
	"C:/ti/C5500 Code Generation Tools 4.4.1/bin/cl55" -v5505 --memory_model=large -g --include_path="C:/Users/gilles.mottiez/Desktop/C5505_CCS8/include" --include_path="C:/ti/C5500 Code Generation Tools 4.4.1/include" --define=vc5505 --display_error_number --diag_warning=225 --ptrdiff_size=16 --preproc_with_compile --preproc_dependency="aic3204_init.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

fix_point_iir_example_for_students.obj: ../fix_point_iir_example_for_students.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C5500 Compiler'
	"C:/ti/C5500 Code Generation Tools 4.4.1/bin/cl55" -v5505 --memory_model=large -g --include_path="C:/Users/gilles.mottiez/Desktop/C5505_CCS8/include" --include_path="C:/ti/C5500 Code Generation Tools 4.4.1/include" --define=vc5505 --display_error_number --diag_warning=225 --ptrdiff_size=16 --preproc_with_compile --preproc_dependency="fix_point_iir_example_for_students.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


