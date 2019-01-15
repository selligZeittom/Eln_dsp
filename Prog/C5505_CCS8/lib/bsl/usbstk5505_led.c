/*
 *  Copyright 2009 by Spectrum Digital Incorporated.
 *  All rights reserved. Property of Spectrum Digital Incorporated.
 */

/*
 *  LED implementation
 *
 */

#include "usbstk5505.h"
#include "usbstk5505_led.h"

/* ------------------------------------------------------------------------ *
 *                                                                          *
 *  USBSTK5505_LED_init( )                                                  *
 *                                                                          *
 *      Clear LEDs                                                          *
 *                                                                          *
 * ------------------------------------------------------------------------ */
Int16 USBSTK5505_LED_init( )
{
    /* Turn OFF all LEDs */
    return USBSTK5505_LED_off( 0 );
}


/* ------------------------------------------------------------------------ *
 *                                                                          *
 *  USBSTK5505_LED_on( number )                                             *
 *                                                                          *
 *      number <- 0                                                         *
 *                                                                          *
 * ------------------------------------------------------------------------ */
Int16 USBSTK5505_LED_on(Uint16 number)
{
	asm(" bset XF");
	asm(" nop");
	asm(" nop");
	asm(" nop");
	asm(" nop");
	asm(" nop");

    return 0;
}

/* ------------------------------------------------------------------------ *
 *                                                                          *
 *  USBSTK5505_LED_off( number )                                            *
 *                                                                          *
 *      number <- 0                                                         *
 *                                                                          *
 * ------------------------------------------------------------------------ */

Int16 USBSTK5505_LED_off(Uint16 number)
{
	asm(" bclr XF");
	asm(" nop");
	asm(" nop");
	asm(" nop");
	asm(" nop");
	asm(" nop");

    return 0;
}

