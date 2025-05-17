#include <time.h>
#include "naiveConsole.h"

static unsigned long ticks = 0;

void timer_handler() {
	int elapsed = seconds_elapsed();
	if (elapsed % 5 == 0) {
		ncPrintInPosition(0, 0, "Seconds:", 0x50);
		ncPrintInPositionNumber(0, 9, elapsed);
	}
	ticks++;
}

int ticks_elapsed() {
	return ticks;
}

int seconds_elapsed() {
	return ticks / 18;
}

void sleep(int seconds) {
	int initial_seconds = seconds_elapsed();
	while (seconds_elapsed() - initial_seconds < seconds);
}
