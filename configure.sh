#! /bin/sh

# local options:  ac_help is the help message that describes them
# and LOCAL_AC_OPTIONS is the script that interprets them.  LOCAL_AC_OPTIONS
# is a script that's processed with eval, so you need to be very careful to
# make certain that what you quote is what you want to quote.

ac_help=""

LOCAL_AC_OPTIONS=''

# load in the configuration file
#
TARGET=rogue
. ./configure.inc
AC_INIT $TARGET
AC_PROG_CC

if [ "$IS_GCC" -o "$IS_CLANG" ]; then
    # rogue is old.  REALLY old.  And it wants to write strings.
    # if we're building with clang or gcc, we know how to force
    # this

    case "$AC_CFLAGS" in
    *-fwritable-strings) ;;
    *) AC_CFLAGS="$AC_CFLAGS -fwritable-strings" ;;
    esac
fi

if [ "$IS_CLANG" ]; then
    # if we're making with clang, we need to turn as many warnings
    # off as possible because otherwise it will treat them as errors
    # and not build

    case "$AC_CFLAGS" in
    *-Wno-everything) ;;
    *) AC_CFLAGS="$AC_CFLAGS -Wno-everything" ;;
    esac
fi

unset _MK_LIBRARIAN

AC_CHECK_HEADERS curses.h || AC_FAIL "$TARGET needs <curses.h>"
AC_CHECK_HEADERS string.h

AC_LIBRARY initscr -lcurses "-lcurses -ltermcap"
AC_LIBRARY crypt -lcrypt

AC_CHECK_FUNCS wgetch
AC_CHECK_FUNCS unctrl
AC_CHECK_FUNCS flushinp

AC_CHECK_FUNCS tcgetattr

AC_OUTPUT Makefile
