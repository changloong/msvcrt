/* @(#)s_modf.c 1.3 95/01/18 */
/*
 * ====================================================
 * Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
 *
 * Developed at SunSoft, a Sun Microsystems, Inc. business.
 * Permission to use, copy, modify, and distribute this
 * software is freely granted, provided that this notice 
 * is preserved.
 * ====================================================
 */

#include <msvcrt/float.h>
#include <msvcrt/math.h>
#include <msvcrt/internal/ieee.h>



//static const double one = 1.0;

double modf(double __x, double *__i)
{
	union
	{
		double*   __x;
		double_t*   x;
	} x;
	union
	{
		double*     __i;
		double_t*  iptr;
	} iptr;

	int j0;
	unsigned int i;

	x.__x = &__x;
	iptr.__i = __i;


	j0 = x.x->exponent - 0x3ff;  /* exponent of x */	
	if(j0<20) {                     /* integer part in high x */
		if(j0<0) {                  /* |x|<1 */
			*__i = 0.0;
			iptr.iptr->sign = x.x->sign;
			return __x;
		} else {

			if ( x.x->mantissah == 0 && x.x->mantissal == 0 ) {
				*__i = __x;
				return 0.0;
			}

			i = (0x000fffff)>>j0;
			iptr.iptr->sign = x.x->sign;
			iptr.iptr->exponent = x.x->exponent;
			iptr.iptr->mantissah = x.x->mantissah&(~i);
			iptr.iptr->mantissal = 0;
			if ( __x == *__i ) {
				__x = 0.0;
				x.x->sign = iptr.iptr->sign;
				return __x;
			}
			return __x - *__i;
		}
	} else if (j0>51) {             /* no fraction part */
		*__i = __x;
		if ( _isnan(__x) || _isinf(__x) )
			return __x;

		__x = 0.0;
		x.x->sign = iptr.iptr->sign;
		return __x;
	} else {                        /* fraction part in low x */

		i = ((unsigned)(0xffffffff))>>(j0-20);
		iptr.iptr->sign = x.x->sign;
		iptr.iptr->exponent = x.x->exponent;
		iptr.iptr->mantissah = x.x->mantissah;
		iptr.iptr->mantissal = x.x->mantissal&(~i);
		if ( __x == *__i ) {
			__x = 0.0;
			x.x->sign = iptr.iptr->sign;
			return __x;
		}
		return __x - *__i;
	}
}


long double modfl(long double __x, long double *__i)
{
	union
	{
		long double*   __x;
		long_double_t*   x;
	} x;
	union
	{
		long double*    __i;
		long_double_t* iptr;
	} iptr;

	int j0;
	unsigned int i;

	x.__x = &__x;
	iptr.__i = __i;


	j0 = x.x->exponent - 0x3fff;  /* exponent of x */

	if(j0<32) {                     /* integer part in high x */
		if(j0<0) {                  /* |x|<1 */
			*__i = 0.0L;
			iptr.iptr->sign = x.x->sign;
			return __x;
		} else {

			i = ((unsigned int)(0xffffffff))>>(j0+1);
			if ( x.x->mantissal == 0 && (x.x->mantissal & i) == 0 ) {
				*__i =  __x;
				__x = 0.0L;
				x.x->sign = iptr.iptr->sign;
				return __x;
			}
			iptr.iptr->sign = x.x->sign;
			iptr.iptr->exponent = x.x->exponent;
			iptr.iptr->mantissah = x.x->mantissah&((~i));
			iptr.iptr->mantissal = 0;
		
			return __x - *__i;
		}
	} else if (j0>63) {             /* no fraction part */
		*__i = __x;
		if (  _isnanl(__x) ||  _isinfl(__x)  )
			return __x;

		__x = 0.0L;
		x.x->sign = iptr.iptr->sign;
		return __x;
	} else {                        /* fraction part in low x */

		i = ((unsigned int)(0xffffffff))>>(j0-32);
		if ( x.x->mantissal == 0 ) {
			*__i =  __x;
			__x = 0.0L;
			x.x->sign = iptr.iptr->sign;
			return __x;
		}
		iptr.iptr->sign = x.x->sign;
		iptr.iptr->exponent = x.x->exponent;
		iptr.iptr->mantissah = x.x->mantissah;
		iptr.iptr->mantissal = x.x->mantissal&(~i);
	
		return __x - *__i;
	}
}
