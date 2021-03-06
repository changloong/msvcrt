# $Id: Makefile 12852 2005-01-06 13:58:04Z mf $

PATH_TO_TOP = ../..

TARGET_DEFONLY = yes

TARGET_TYPE = dynlink

TARGET_NAME = msvcrt

TARGET_PCH = precomp.h

TARGET_BASE = $(TARGET_BASE_LIB_MSVCRT)

# don't remove @nn from exported symbols - needed so dlltool doesn't mess up mangled c++ exports
RM_AT_FROM_SYMBOLS = no

TARGET_LFLAGS = -nostartfiles --enable-stdcall-fixup

TARGET_SDKLIBS = wine.a string.a kernel32.a ntdll.a

TARGET_GCCLIBS = gcc

TARGET_CFLAGS = -D__USE_W32API -D_MSVCRT_LIB_ -Wall -Werror

# require os code to explicitly request A/W version of structs/functions
TARGET_CFLAGS += \
	-D_DISABLE_TIDENTS \
	-D__USE_W32API \
	-D__REACTOS__ \
	-D_WIN32_IE=0x600 \
	-D_WIN32_WINNT=0x501 \
	-DUSE_MSVCRT_PREFIX \
	-D_MT

TARGET_OBJECTS = $(TARGET_NAME).o

TARGET_CLEAN = \
	conio/*.o \
	ctype/*.o \
	direct/*.o \
	except/*.o \
	float/*.o \
	io/*.o \
	locale/*.o \
	math/*.o \
	mbstring/*.o \
	misc/*.o \
	process/*.o \
	search/*.o \
	setjmp/*.o \
	setjmp/i386/*.o \
	signal/*.o \
	stdio/*.o \
	stdlib/*.o \
	string/*.o \
	sys_stat/*.o \
	time/*.o \
	wine/*.o \
	wstring/*.o


include $(PATH_TO_TOP)/rules.mak

include $(TOOLS_PATH)/helper.mk


CONIO_OBJECTS = \
	conio/cgets.o \
	conio/cprintf.o \
	conio/cputs.o \
	conio/cscanf.o \
	conio/getch.o \
	conio/getche.o \
	conio/kbhit.o \
	conio/putch.o \
	conio/ungetch.o

CTYPE_OBJECTS = \
	ctype/ctype.o \
	ctype/isalnum.o \
	ctype/isalpha.o \
	ctype/isascii.o \
	ctype/iscntrl.o \
	ctype/isdigit.o \
	ctype/isgraph.o \
	ctype/islower.o \
	ctype/isprint.o \
	ctype/ispunct.o \
	ctype/isspace.o \
	ctype/isupper.o \
	ctype/isxdigit.o \
	ctype/toascii.o \
	ctype/tolower.o \
	ctype/toupper.o \
	ctype/iscsym.o \
	ctype/isctype.o

DIRECT_OBJECTS = \
	direct/chdir.o \
	direct/chdrive.o \
	direct/getcwd.o \
	direct/getdcwd.o \
	direct/getdfree.o \
	direct/getdrive.o \
	direct/mkdir.o \
	direct/rmdir.o \
	direct/wchdir.o \
	direct/wgetcwd.o \
	direct/wgetdcwd.o \
	direct/wmkdir.o \
	direct/wrmdir.o

EXCEPT_OBJECTS = \
	except/seh.o \
	except/abnorter.o \
	except/exhand2.o \
	except/matherr.o \
	except/unwind.o \
	except/xcptfil.o

FLOAT_OBJECTS = \
	float/chgsign.o \
	float/clearfp.o \
	float/cntrlfp.o \
	float/copysign.o \
	float/fpclass.o \
	float/fpecode.o \
	float/fpreset.o \
	float/isnan.o \
	float/logb.o \
	float/nafter.o \
	float/scalb.o \
	float/statfp.o

IO_OBJECTS = \
	io/access.o \
	io/chmod.o \
	io/chsize.o \
	io/close.o \
	io/commit.o \
	io/create.o \
	io/dup.o \
	io/dup2.o \
	io/eof.o \
	io/filelen.o \
	io/fileleni.o \
	io/find.o \
	io/fmode.o \
	io/isatty.o \
	io/locking.o \
	io/lseek.o \
	io/lseeki64.o \
	io/mktemp.o \
	io/open.o \
	io/pipe.o \
	io/read.o \
	io/setmode.o \
	io/sopen.o \
    io/stubs.o \
	io/tell.o \
	io/telli64.o \
	io/umask.o \
	io/unlink.o \
	io/utime.o \
	io/waccess.o \
	io/wchmod.o \
	io/wcreate.o \
	io/wfind.o \
	io/wmktemp.o \
	io/wopen.o \
	io/write.o \
	io/wunlink.o \
	io/wutime.o

LOCALE_OBJECTS = \
	locale/locale.o

MATH_OBJECTS = \
	math/acos.o \
	math/adjust.o \
	math/asin.o \
	math/atan.o \
	math/atan2.o \
	math/cabs.o \
	math/ceil.o \
	math/cos.o \
	math/cosh.o \
	math/exp.o \
	math/fabs.o \
	math/floor.o \
	math/fmod.o \
	math/frexp.o \
	math/huge_val.o \
	math/hypot.o \
	math/j0_y0.o \
	math/j1_y1.o \
	math/jn_yn.o \
	math/ldexp.o \
	math/log.o \
	math/log10.o \
	math/modf.o \
	math/pow.o \
	math/sin.o \
	math/sinh.o \
	math/sqrt.o \
	math/stubs.o \
	math/tan.o \
	math/tanh.o

MBSTRING_OBJECTS = \
	mbstring/hanzen.o \
	mbstring/ischira.o \
	mbstring/iskana.o \
	mbstring/iskpun.o \
	mbstring/islead.o \
	mbstring/islwr.o \
	mbstring/ismbal.o \
	mbstring/ismbaln.o \
	mbstring/ismbc.o \
	mbstring/ismbgra.o \
	mbstring/ismbkaln.o \
	mbstring/ismblead.o \
	mbstring/ismbpri.o \
	mbstring/ismbpun.o \
	mbstring/ismbtrl.o \
	mbstring/isuppr.o \
	mbstring/jistojms.o \
	mbstring/jmstojis.o \
	mbstring/mbbtype.o \
	mbstring/mbccpy.o \
	mbstring/mbclen.o \
	mbstring/mbscat.o \
	mbstring/mbschr.o \
	mbstring/mbscmp.o \
	mbstring/mbscoll.o \
	mbstring/mbscpy.o \
	mbstring/mbscspn.o \
	mbstring/mbsdec.o \
	mbstring/mbsdup.o \
	mbstring/mbsicmp.o \
	mbstring/mbsicoll.o \
	mbstring/mbsinc.o \
	mbstring/mbslen.o \
	mbstring/mbslwr.o \
	mbstring/mbsncat.o \
	mbstring/mbsnccnt.o \
	mbstring/mbsncmp.o \
	mbstring/mbsncoll.o \
	mbstring/mbsncpy.o \
	mbstring/mbsnextc.o \
	mbstring/mbsnicmp.o \
	mbstring/mbsnicoll.o \
	mbstring/mbsninc.o \
	mbstring/mbsnset.o \
	mbstring/mbspbrk.o \
	mbstring/mbsrchr.o \
	mbstring/mbsrev.o \
	mbstring/mbsset.o \
	mbstring/mbsspn.o \
	mbstring/mbsspnp.o \
	mbstring/mbsstr.o \
	mbstring/mbstok.o \
	mbstring/mbstrlen.o \
	mbstring/mbsupr.o

MISC_OBJECTS = \
	misc/amsg.o \
	misc/assert.o \
	misc/crtmain.o \
	misc/dllmain.o \
	misc/environ.o \
	misc/getargs.o \
	misc/initterm.o \
	misc/lock.o \
	misc/purecall.o \
	misc/stubs.o \
	misc/tls.o

PROCESS_OBJECTS = \
	process/_cwait.o \
	process/_system.o \
	process/dll.o \
	process/process.o \
	process/procid.o \
	process/thread.o \
	process/threadid.o \
	process/threadx.o

SEARCH_OBJECTS = \
	search/lfind.o \
	search/lsearch.o

SETJMP_OBJECTS = \
	setjmp/i386/setjmp.o
	
SIGNAL_OBJECTS = \
	signal/signal.o

STDIO_OBJECTS = \
	stdio/allocfil.o \
	stdio/clearerr.o \
	stdio/fclose.o \
	stdio/fdopen.o \
	stdio/feof.o \
	stdio/ferror.o \
	stdio/fflush.o \
	stdio/fgetc.o \
	stdio/fgetchar.o \
	stdio/fgetpos.o \
	stdio/fgets.o \
	stdio/fgetws.o \
	stdio/filbuf.o \
	stdio/fileno.o \
	stdio/flsbuf.o \
	stdio/fopen.o \
	stdio/fprintf.o \
	stdio/fputc.o \
	stdio/fputchar.o \
	stdio/fputs.o \
	stdio/fread.o \
	stdio/freopen.o \
	stdio/fscanf.o \
	stdio/fseek.o \
	stdio/fsetpos.o \
	stdio/fsopen.o \
	stdio/ftell.o \
	stdio/fwalk.o \
	stdio/fwrite.o \
	stdio/getc.o \
	stdio/getchar.o \
	stdio/gets.o \
	stdio/getw.o \
	stdio/perror.o \
	stdio/popen.o \
	stdio/printf.o \
	stdio/putc.o \
	stdio/putchar.o \
	stdio/puts.o \
	stdio/putw.o \
	stdio/remove.o \
	stdio/rename.o \
	stdio/rewind.o \
	stdio/rmtmp.o \
	stdio/scanf.o \
	stdio/setbuf.o \
	stdio/setvbuf.o \
	stdio/sprintf.o \
	stdio/sscanf.o \
	stdio/stdhnd.o \
	stdio/tempnam.o \
	stdio/tmpfile.o \
	stdio/tmpnam.o \
	stdio/ungetc.o \
	stdio/vfprintf.o \
	stdio/vfscanf.o \
	stdio/vfwprint.o \
	stdio/vprintf.o \
	stdio/vscanf.o \
	stdio/vsprintf.o \
	stdio/vsscanf.o \
	stdio/wfdopen.o \
	stdio/wrename.o \
	stdio/wtempnam.o \
	stdio/wtmpnam.o

STDLIB_OBJECTS = \
	stdlib/_exit.o \
	stdlib/abort.o \
	stdlib/abs.o \
	stdlib/atexit.o \
	stdlib/atof.o \
	stdlib/atoi.o \
	stdlib/atoi64.o \
	stdlib/atol.o \
	stdlib/bsearch.o \
	stdlib/div.o \
	stdlib/ecvt.o \
	stdlib/ecvtbuf.o \
	stdlib/errno.o \
	stdlib/fcvt.o \
	stdlib/fcvtbuf.o \
	stdlib/fullpath.o \
	stdlib/gcvt.o \
	stdlib/getenv.o \
	stdlib/itoa.o \
	stdlib/itow.o \
	stdlib/labs.o \
	stdlib/ldiv.o \
	stdlib/makepath.o \
	stdlib/malloc.o \
	stdlib/mbstowcs.o \
	stdlib/mbtowc.o \
	stdlib/obsol.o \
	stdlib/putenv.o \
	stdlib/qsort.o \
	stdlib/rand.o \
	stdlib/rot.o \
	stdlib/senv.o \
	stdlib/splitp.o \
	stdlib/strtod.o \
	stdlib/strtol.o \
	stdlib/strtoul.o \
	stdlib/swab.o \
	stdlib/wcstod.o \
	stdlib/wcstol.o \
	stdlib/wcstombs.o \
	stdlib/wcstoul.o \
	stdlib/wctomb.o \
	stdlib/wfulpath.o \
	stdlib/witoa.o \
	stdlib/witow.o \
	stdlib/wputenv.o \
	stdlib/wsenv.o \
	stdlib/wsplitp.o \
	stdlib/wmakpath.o \
	stdlib/wtoi.o \
	stdlib/wtoi64.o

STRING_OBJECTS = \
	string/lasttok.o \
	string/memicmp.o \
	string/strcoll.o \
	string/strdup.o \
	string/strerror.o \
	string/stricmp.o \
	string/strlwr.o \
	string/strncoll.o \
	string/strnicmp.o \
	string/strpbrk.o \
	string/strrev.o\
	string/strset.o \
	string/strstr.o \
	string/strtok.o \
	string/strupr.o \
	string/strxfrm.o 

SYS_STAT_OBJECTS = \
	sys_stat/fstat.o \
	sys_stat/fstati64.o \
	sys_stat/futime.o \
	sys_stat/stat.o \
	sys_stat/wstat.o

TIME_OBJECTS = \
	time/clock.o \
	time/ctime.o \
	time/difftime.o \
	time/ftime.o \
	time/strdate.o \
	time/strftime.o \
	time/strtime.o \
	time/time.o \
	time/tz_vars.o \
	time/wctime.o \
	time/wstrdate.o \
	time/wstrtime.o

WINE_OBJECTS = \
	wine/cpp.o \
	wine/cppexcept.o \
	wine/heap.o \
	wine/thread.o

WSTRING_OBJECTS = \
	wstring/wcscoll.o \
	wstring/wcscspn.o \
	wstring/wcsdup.o \
	wstring/wcsicmp.o \
	wstring/wcslwr.o \
	wstring/wcsnicmp.o \
	wstring/wcspbrk.o \
	wstring/wcsrev.o \
	wstring/wcsset.o \
	wstring/wcsspn.o \
	wstring/wcsstr.o \
	wstring/wcstok.o \
	wstring/wcsupr.o \
	wstring/wcsxfrm.o \
	wstring/wlasttok.o

OBJECTS = \
	$(CONIO_OBJECTS) \
	$(CTYPE_OBJECTS) \
	$(DIRECT_OBJECTS) \
	$(EXCEPT_OBJECTS) \
	$(FLOAT_OBJECTS) \
	$(IO_OBJECTS) \
	$(LOCALE_OBJECTS) \
	$(MATH_OBJECTS) \
	$(MBSTRING_OBJECTS) \
	$(MISC_OBJECTS) \
	$(PROCESS_OBJECTS) \
	$(SEARCH_OBJECTS) \
	$(SETJMP_OBJECTS) \
	$(SIGNAL_OBJECTS) \
	$(STDIO_OBJECTS) \
	$(STDLIB_OBJECTS) \
	$(STRING_OBJECTS) \
	$(SYS_STAT_OBJECTS) \
	$(TIME_OBJECTS) \
	$(WINE_OBJECTS) \
	$(WSTRING_OBJECTS)

$(TARGET_NAME).o: $(OBJECTS)
	$(LD) -r $(OBJECTS) -o $(TARGET_NAME).o


# EOF
