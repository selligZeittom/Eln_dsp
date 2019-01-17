/*****************************************************************************
filename:          fix_point_iir.c
kind:              TMS320c5505 C-file
first created:     14.06.2012
created by:        prc
last edited:       18.01.2018
last change by:    
project:

*****************************************************************************

Demonstration program for 5th semester lab.

This file program is a demonstration of a very simple C program which
implements a first order LP-IIR filter in fix point arithmetic to be run
on a tms320c5505 eZdsp USB Stick.

Two functions are defined, illustrating two methods to define the coefficients.

For the simplicity of implementation and comprehension, the filter functions
handle one input sample at a time.

*****************************************************************************/

#include "stdio.h"
#include "usbstk5505.h"
#include "usbstk5505_led.h"
#include "aic3204_init.h"
#define XmitL 0x10
#define XmitR 0x20
#define RcvR 0x08
#define RcvL 0x04

#define Filtre

#define SAMPLES_PER_SECOND 48000
#define GAIN_IN_dB 0            /* Use 30 dB for microphone. Use 0 dB for line. */
                                /* For 0dB gain from in to out, DAC gain has been set to 12dB in aic3204_init.c */

//#include "math.h"

#define TEST_LENGTH 1024
short index = 0;
short testInput[TEST_LENGTH];
short testOutput[TEST_LENGTH];

typedef struct
  {
   short a1;
   short b0;
   short b1;
  } coeff_array_short_struct_type;

 typedef struct
   {
     short b0;
     short b1;
     short b2;
     short a0;
     short a1;
     short a2;

   }coeff_form_II_transp;


#define SHIFT 14

short coeff_LP1_Q14[3]                             = {  -4366,   6008,   6008}; // DC: 0dB; 8kHz: -3dB
coeff_array_short_struct_type coeff_LP1_Q14_struct = {  -4366,   6008,   6008};


coeff_form_II_transp coeff_dsp_1 = {469, 349, 469, 16384, -23699, 10692};
coeff_form_II_transp coeff_dsp_2 = {16384, -11187, 16384, 16384, -19657, 14890};

void iir_trans_second_order(coeff_form_II_transp coeff, short* w1, short* w2, short* input, short* output)
{
    /*
     * [warning : init : w1 and w2 = 0, only do it once before calling the function]
     * first step : output = input * b0 + w1;
     * second step : w1 = input * b1 - output * a1;
     * third step : w2 = input * b2 - output * a2;
     */
    *output = (((long) *input * (long) coeff.b0) >> SHIFT) + *w1;                                             //first step
    *w1 = (((long) *input * (long) coeff.b1) >> SHIFT) - (((long) *output * coeff.a1) >> SHIFT) + *w2;       //second test
    *w2 = (((long) *input * (long) coeff.b2) >> SHIFT) - (((long) *output * coeff.a2) >> SHIFT);            //third step
}

void iir_biquad_dir_a(short *Coeff, short *W, short *Input, short *Output)
/* First order IIR filter : Canonical Direct form II (D-N)
 
          -   1/a0=1       b0     -
     --->¦+¦---->-----o----->--->¦+¦--->
          -           ¦           -
          ^           ¦           ^
          ¦          ---          ¦
          ¦         ¦ -1¦         ¦
          ¦         ¦z  ¦         ¦
          ¦          ---          ¦
          ¦           ¦           ¦
          ¦           ¦           ¦
           -----<-----o----->-----
               -a1         b1
               
   Signals       : 16 bits,  range [-1 .. ~1] ==> Q15 format
   Coefficients  : 16 bits,  range [-2 .. ~2] ==> Q14 format  ==> SHIFT  = 14

*/


{
  register short temp;


  temp = (long)*Input - (((long)Coeff[0] * (long)*W) >> SHIFT);

  *Output = (((long)Coeff[1] * (long)temp) >> SHIFT) + (((long)Coeff[2] * (long)*W) >> SHIFT);

  *W = temp;
}


void iir_biquad_dir_s(coeff_array_short_struct_type Coeff, short *W, short *Input, short *Output)
/* First order IIR filter : Canonical Direct form II (D-N) */

/*
          -   1/a0=1       b0     -
     --->¦+¦---->-----o----->--->¦+¦--->
          -           ¦           -
          ^           ¦           ^
          ¦          ---          ¦
          ¦         ¦ -1¦         ¦
          ¦         ¦z  ¦         ¦
          ¦          ---          ¦
          ¦           ¦           ¦
          ¦           ¦           ¦
           -----<-----o----->-----
               -a1         b1
               
   Signals       : 16 bits,  range [-1 .. ~1] ==> Q15 format
   Coefficients  : 16 bits,  range [-2 .. ~2] ==> Q14 format  ==> SHIFT  = 14
      
*/

{
  register short temp;


  temp = (long)*Input - (((long)Coeff.a1 * (long)*W) >> SHIFT);

  *Output = (((long)Coeff.b0 * (long)temp) >> SHIFT) + (((long)Coeff.b1 * (long)*W) >> SHIFT);

  *W = temp;
}



#ifdef Example
/* ------------------------------------------------------------------------ *
 *                                                                          *
 *  main( ) EXAMPLE                                                          *
 *                                                                          *
 * ------------------------------------------------------------------------ */
void main( void )
{

    Int16  data_L, data_R, data_L2, data_R2;

    /* Initialize BSL */
    USBSTK5505_init( );
    USBSTK5505_LED_init( );
    aic3204_init_and_set_fs_and_gain(SAMPLES_PER_SECOND, GAIN_IN_dB);


//    USBSTK5505_LED_on(0);
//    USBSTK5505_LED_off(0);
//    USBSTK5505_waitusec(500000);


    W1=0;
    W2=0;
    data_L2=0;
    data_R2=0;

    while(1)
      {
        /* Read Digital audio input */
        while((RcvR & I2S0_IR) == 0);  // Wait for receive interrupt to be pending

        data_L = I2S0_W0_MSW_R;  // 16 bit left channel received audio data
        data_R = I2S0_W1_MSW_R;  // 16 bit right channel received audio data


        /* Write Digital audio input */
//        while((XmitR & I2S0_IR) == 0); // Wait for transmit interrupt to be pending    ??? NOT NECESSARY ???
        I2S0_W0_MSW_W = (Int16)data_L2;  // 16 bit left channel transmit audio data
        I2S0_W1_MSW_W = (Int16)data_R2;  // 16 bit right channel transmit audio data


        /* FILTER */
       USBSTK5505_LED_on(0);             // LED is on during processing time
       iir_biquad_dir_a(coeff_LP1_Q14, &W1, &data_L, &data_L2);
       //iir_biquad_dir_s(coeff_LP1_Q14_struct, &W2, &data_L2, &data_L2); // WARNING: Depending how the routine is written, using the same
                                                                         //          variable for input and output may lead to wrong result !

       USBSTK5505_LED_off(0);

       data_R2 = data_R;                 // Just to avoid following warning : "data_R" was set but never used

       data_R2 = data_L2;                // Right channel output is same as left channel

       //data_L2 = data_L;                 // Bypass filter

       if (index < TEST_LENGTH)
         {
           testInput[index]= data_L;  /* Only for testing */
           testOutput[index++]= data_L2;  /* Only for testing */
         }
      }
}
#endif

#ifdef Filtre
/* ------------------------------------------------------------------------ *
 *                                                                          *
 *  main( ) EXAMPLE                                                          *
 *                                                                          *
 * ------------------------------------------------------------------------ */
void main( void )
{

    short W1_1;
    short W2_1;
    short W1_2;
    short W2_2;

    Int16  data_L, data_R, data_L2, data_L3, data_R2;

    /* Initialize BSL */
    USBSTK5505_init( );
    USBSTK5505_LED_init( );
    aic3204_init_and_set_fs_and_gain(SAMPLES_PER_SECOND, GAIN_IN_dB);

    //init registers to 0
    W1_1=0;
    W2_1=0;
    W1_2=0;
    W2_2=0;

    //init inputs/outputs to 0
    data_L2=0;
    data_L3 = 0;
    data_R2=0;

    while(1)
      {
        /* Read Digital audio input */
        while((RcvR & I2S0_IR) == 0);  // Wait for receive interrupt to be pending

        data_L = I2S0_W0_MSW_R;  // 16 bit left channel received audio data
        data_R = I2S0_W1_MSW_R;  // 16 bit right channel received audio data

        /* Write Digital audio output */
        I2S0_W0_MSW_W = (Int16)data_L3;  // 16 bit left channel transmit audio data
        I2S0_W1_MSW_W = (Int16)data_R2;  // 16 bit right channel transmit audio data

        /* FILTER */
       USBSTK5505_LED_on(0);             // LED is on during processing time

       iir_trans_second_order(coeff_dsp_1, &W1_1, &W2_1, &data_L, &data_L2);
       iir_trans_second_order(coeff_dsp_2, &W1_2, &W2_2, &data_L2, &data_L3);

       USBSTK5505_LED_off(0);

       data_R2 = data_R;                 // Just to avoid following warning : "data_R" was set but never used
       data_R2 = data_L3;                // Right channel output is same as left channel

       if (index < TEST_LENGTH)
         {
           testInput[index]= data_L;  /* Only for testing */
           testOutput[index++]= data_L3;  /* Only for testing */
         }
      }
}
#endif
