/* 
 * assert.h
 *
 * Define the assert macro for debug output.
 *
 * This file is part of the Mingw32 package.
 *
 * Contributors:
 *  Created by Colin Peters <colin@bird.fu.is.saga-u.ac.jp>
 *
 *  THIS SOFTWARE IS NOT COPYRIGHTED
 *
 *  This source code is offered for use in the public domain. You may
 *  use, modify or distribute it freely.
 *
 *  This code is distributed in the hope that it will be useful but
 *  WITHOUT ANY WARRANTY. ALL WARRANTIES, EXPRESS OR IMPLIED ARE HEREBY
 *  DISCLAIMED. This includes but is not limited to warranties of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * $Revision: 1.4 $
 * $Author: mf $
 * $Date: 2005-01-06 21:58:04 +0800 (四, 06  1 2005) $
 *
 */

#ifndef _ASSERT_H_
#define _ASSERT_H_


#ifdef  __cplusplus
extern "C" {
#endif

#ifdef NDEBUG

/*
 * If not debugging, assert does nothing.
 */
#define assert(x)   ((void)0)

#else /* debugging enabled */

/*
 * CRTDLL nicely supplies a function which does the actual output and
 * call to abort.
 */
#ifndef __ATTRIB_NORETURN
#ifdef  __GNUC__
#define _ATTRIB_NORETURN    __attribute__ ((noreturn))
#else   /* Not __GNUC__ */
#define _ATTRIB_NORETURN
#endif  /* __GNUC__ */
#endif

void _assert(const char* szExpression, const char* szFileName, int nLine) _ATTRIB_NORETURN;

/*
 * Definition of the assert macro.
 */
#define assert(x)   if(!(x)) _assert( #x , __FILE__, __LINE__);
#endif  /* NDEBUG */

#ifdef  __cplusplus
}
#endif

#endif /* Not _ASSERT_H_ */

