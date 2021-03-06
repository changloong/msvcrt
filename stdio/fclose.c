/* Copyright (C) 1995 DJ Delorie, see COPYING.DJ for details */

#include <msvcrt/stdio.h>
#include <msvcrt/io.h>
#include <msvcrt/sys/types.h>
#include <msvcrt/sys/stat.h>
#include <msvcrt/stdlib.h>
#include <msvcrt/errno.h>
#include <msvcrt/internal/file.h>

// changed check for writable stream


/*
 * @implemented
 */
int
fclose(FILE *f)
{
  int r = 0;

  if (f == NULL) {
    __set_errno (EINVAL);
    return EOF;
  }



// flush only if stream was opened for writing
  if ( !(f->_flag&_IOSTRG) ) {
  	if ( OPEN4WRITING(f) )
    		r = fflush(f);
  	
  	if (_close(fileno(f)) < 0)
      		r = EOF;
  	if (f->_flag&_IOMYBUF)
      		free(f->_base);
  
// Kernel might do this later
  	if (f->_flag & _IORMONCL && f->_name_to_remove)
  	{
    		remove(f->_name_to_remove);
    		free(f->_name_to_remove);
    		f->_name_to_remove = 0;
  	}
  }
  f->_cnt = 0;
  f->_base = 0;
  f->_ptr = 0;
  f->_bufsiz = 0;
  f->_flag = 0;
  f->_file = -1;
  return r;
}
