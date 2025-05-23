#include <naiveConsole.h>

static uint32_t uintToBase(uint64_t value, char * buffer, uint32_t base);

static char buffer[64] = { '0' };
static uint8_t * const video = (uint8_t*)0xB8000;
static uint8_t * currentVideo = (uint8_t*)0xB8000;
static const uint32_t width = 80;
static const uint32_t height = 25 ;
static uint8_t * limit = (uint8_t*)0xB8FA0; // video + width * height * 2 - 1


static void checkCurrentVideo() {
	if (currentVideo >= limit || currentVideo < video) {
		currentVideo = video;
	}
}

void ncPrint(const char * string)
{
	int i;

	for (i = 0; string[i] != 0; i++)
		ncPrintChar(string[i]);
}

void ncPrintStyle(const char * msg, uint8_t style) {
	for (int i = 0; msg[i] != 0 && currentVideo < limit; i++) {
		currentVideo[0] = msg[i];
		currentVideo[1] = style;
		currentVideo += 2;
	}

	checkCurrentVideo();
}

void ncPrintStyleCount(const char * buf, uint8_t style, uint64_t count) {
	for (int i = 0; i < count && currentVideo < limit; i++) {
		currentVideo[0] = buf[i];
		currentVideo[1] = style;
		currentVideo += 2;
	}

	checkCurrentVideo();
}

void ncPrintInPosition(uint8_t i, uint8_t j, char * string, const uint8_t style) {
	if (i < 0 || i >= height || j < 0 || j >= width) {
		return;
	}
	uint8_t * backup = currentVideo;
	currentVideo = video + (i * width + j) * 2;
	ncPrintStyle(string, style);
	currentVideo = backup;
}

void ncPrintInPositionNumber(uint8_t i, uint8_t j, uint64_t number) {
	if (i >= height || j >= width) {
		return;
	}
	uint8_t * backup = currentVideo;
	currentVideo = video + (i * width + j) * 2;
	ncPrintDec(number);
	currentVideo = backup;
}

void ncPrintChar(char character)
{
	switch (character)
	{
	case '\b':
		currentVideo -= 2;
		*currentVideo = 0;
		break;
	case '\n':
		ncNewline();
		break;
	default:
		*currentVideo = character;
		currentVideo += 2;
		break;
	}

	checkCurrentVideo();

}

void ncNewline()
{
	do
	{
		ncPrintChar(' ');
	}
	while((uint64_t)(currentVideo - video) % (width * 2) != 0);
	checkCurrentVideo();
}

void ncSetCursor(uint8_t i, uint8_t j) {
	if (i >= height || j >= width) {
		return;
	}
	currentVideo = video + (i * width + j) * 2;
}


void ncPrintDec(uint64_t value)
{
	ncPrintBase(value, 10);
}

void ncPrintHex(uint64_t value)
{
	ncPrintBase(value, 16);
}

void ncPrintBin(uint64_t value)
{
	ncPrintBase(value, 2);
}

void ncPrintBase(uint64_t value, uint32_t base)
{
    uintToBase(value, buffer, base);
    ncPrint(buffer);
}

void ncClear()
{
	int i;

	for (i = 0; i < height * width; i++)
		video[i * 2] = ' ';
	currentVideo = video;
}

static uint32_t uintToBase(uint64_t value, char * buffer, uint32_t base)
{
	char *p = buffer;
	char *p1, *p2;
	uint32_t digits = 0;

	//Calculate characters for each digit
	do
	{
		uint32_t remainder = value % base;
		*p++ = (remainder < 10) ? remainder + '0' : remainder + 'A' - 10;
		digits++;
	}
	while (value /= base);

	// Terminate string in buffer.
	*p = 0;

	//Reverse string in buffer.
	p1 = buffer;
	p2 = p - 1;
	while (p1 < p2)
	{
		char tmp = *p1;
		*p1 = *p2;
		*p2 = tmp;
		p1++;
		p2--;
	}



	return digits;
}

