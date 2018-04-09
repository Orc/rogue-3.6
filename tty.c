#include <curses.h>
#include <ctype.h>
#include "rogue.h"

#include <sys/termios.h>

#if 0
#include "config.h"

#if !HAVE_TCGETATTR
#define tcgetattr(fd,t)	ioctl(fd, TCGETS, t)
#endif
#endif


void
init_tty()
{
    struct termios keyboard;
    
    tcgetattr(0, &keyboard);

    tty_erase = keyboard.c_cc[VERASE];
    tty_intr  = keyboard.c_cc[VINTR];
    tty_speed = keyboard.c_ospeed;
}
