# $Id: Makefile 12745 2005-01-03 02:37:10Z sedwards $

PATH_TO_TOP = ../../..

TARGET_NORC = yes

TARGET_TYPE = program

TARGET_APPTYPE = console

# require os code to explicitly request A/W version of structs/functions
TARGET_CFLAGS += -D_DISABLE_TIDENTS -D__USE_W32API -D_WIN32_IE=0x0600 \
	-D_WIN32_WINNT=0x0501 -D__REACTOS__

TARGET_NAME = msvcrt_test

TARGET_SDKLIBS = ntdll.a wine.a

TARGET_OBJECTS = \
	testlist.o \
	cpp.o \
	environ.o \
	file.o \
	heap.o \
	printf.o \
	scanf.o \
	string.o \
	time.o

include $(PATH_TO_TOP)/rules.mak

include $(TOOLS_PATH)/helper.mk

# EOF