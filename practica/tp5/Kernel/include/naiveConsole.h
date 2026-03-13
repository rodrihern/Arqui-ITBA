#ifndef NAIVE_CONSOLE_H
#define NAIVE_CONSOLE_H

#include <stdint.h>

void ncPrint(const char * string);
void ncPrintStyle(const char * buf, uint8_t style);
void ncPrintStyleCount(const char * buf, uint8_t style, uint64_t count);
void ncPrintInPosition(uint8_t i, uint8_t j, char * string, const uint8_t style);
void ncPrintInPositionNumber(uint8_t i, uint8_t j, uint64_t number);
void ncPrintChar(char character);
void ncNewline();
void ncSetCursor(uint8_t i, uint8_t j);
void ncPrintDec(uint64_t value);
void ncPrintHex(uint64_t value);
void ncPrintBin(uint64_t value);
void ncPrintBase(uint64_t value, uint32_t base);
void ncClear();

#endif