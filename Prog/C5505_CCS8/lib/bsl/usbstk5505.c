/*
 *  Copyright 2009 by Spectrum Digital Incorporated.
 *  All rights reserved. Property of Spectrum Digital Incorporated.
 */

/*
 *  Board Setup
 *
 */

#include "usbstk5505.h"

/* ------------------------------------------------------------------------ *
 *                                                                          *
 *  USBSTK5505_wait( delay )                                                          *
 *                                                                          *
 *      Wait in a software loop for 'x' delay                               *
 *                                                                          *
 * ------------------------------------------------------------------------ */
void USBSTK5505_wait( Uint32 delay )
{
    volatile Uint32 i;
    for ( i = 0 ; i < delay ; i++ ){ };
}

/* ------------------------------------------------------------------------ *
 *                                                                          *
 *  _waitusec( usec )                                                       *
 *                                                                          *
 *      Wait in a software loop for 'x' microseconds                        *
 *                                                                          *
 * ------------------------------------------------------------------------ */
void USBSTK5505_waitusec( Uint32 usec )
{
    USBSTK5505_wait( (Uint32)usec * 8 );
}

/* ------------------------------------------------------------------------ *
 *                                                                          *
 *  USBSTK5505_init( )                                                      *
 *                                                                          *
 *      Setup board board functions                                         *
 *                                                                          *
 * ------------------------------------------------------------------------ */
Int16 USBSTK5505_init( )
{
    /* Enable clocks to all peripherals */
    SYS_PCGCR1 = 0x0000;
    SYS_PCGCR2 = 0x0000;
	
    return 0;
}
