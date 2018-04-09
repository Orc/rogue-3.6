CFLAGS=-Wno-everything
OBJS= \
armor.o chase.o command.o daemon.o daemons.o fight.o init.o \
io.o list.o main.o misc.o monsters.o move.o new_level.o \
options.o pack.o passages.o potions.o rings.o rip.o rooms.o save.o \
scrolls.o sticks.o things.o vers.o weapons.o wizard.o tty.o

rogue: $(OBJS)
	cc $(CFLAGS) -o rogue $(OBJS) -lcurses -ltermcap

armor.o: armor.c mach_dep.h rogue.h
chase.o: chase.c mach_dep.h rogue.h
command.o: command.c mach_dep.h rogue.h
daemon.o: daemon.c mach_dep.h rogue.h
daemons.o: daemons.c mach_dep.h rogue.h
fight.o: fight.c mach_dep.h rogue.h
findpw.o: findpw.c mach_dep.h rogue.h
init.o: init.c mach_dep.h rogue.h
io.o: io.c mach_dep.h rogue.h
list.o: list.c mach_dep.h rogue.h
main.o: main.c mach_dep.h rogue.h
misc.o: misc.c mach_dep.h rogue.h
monsters.o: monsters.c mach_dep.h rogue.h
move.o: move.c mach_dep.h rogue.h
new_level.o: new_level.c mach_dep.h rogue.h
options.o: options.c mach_dep.h rogue.h
pack.o: pack.c mach_dep.h rogue.h
passages.o: passages.c mach_dep.h rogue.h
potions.o: potions.c mach_dep.h rogue.h
rings.o: rings.c mach_dep.h rogue.h
rip.o: rip.c mach_dep.h rogue.h
rooms.o: rooms.c mach_dep.h rogue.h
save.o: save.c mach_dep.h rogue.h
scrolls.o: scrolls.c mach_dep.h rogue.h
sticks.o: sticks.c mach_dep.h rogue.h
things.o: things.c mach_dep.h rogue.h
vers.o: vers.c mach_dep.h rogue.h
weapons.o: weapons.c mach_dep.h rogue.h
wizard.o: wizard.c mach_dep.h rogue.h
tty.o: tty.c mach_dep.h rogue.h
