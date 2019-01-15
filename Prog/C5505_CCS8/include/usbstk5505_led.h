/*
 *  Copyright 2007 by Spectrum Digital Incorporated.
 *  All rights reserved. Property of Spectrum Digital Incorporated.
 */

/*
 *  LED header file
 *
 */

#ifndef LED_
#define LED_

#include "usbstk5505.h"

/* ------------------------------------------------------------------------ *
 *  Prototypes                                                              *
 * ------------------------------------------------------------------------ */
Int16 USBSTK5505_LED_init  ( );
Int16 USBSTK5505_LED_on    ( Uint16 number );
Int16 USBSTK5505_LED_off   ( Uint16 number );

#endif
