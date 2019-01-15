Int16 AIC3204_rget(Uint16 regnum, Uint16* regval);
Int16 AIC3204_rset(Uint16 regnum, Uint16 regval);
Int16 aic3204_init_and_set_fs_and_gain(unsigned long SamplingFrequency, unsigned int ADCgain);
Int16 aic3204_close();
