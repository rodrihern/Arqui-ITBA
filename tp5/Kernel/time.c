#include <time.h>
#include "naiveConsole.h"

static unsigned long ticks = 0;

void timer_handler() {
	ncPrintInPosition(0, 0, "Ticks:", 0x50);
	ncPrintInPositionNumber(0, 7, ticks);
	ticks++;
}

int ticks_elapsed() {
	return ticks;
}

int seconds_elapsed() {
	return ticks / 18;
}
