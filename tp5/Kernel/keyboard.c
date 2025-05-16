#include "keyboard.h"
#include "lib.h"
#include "naiveConsole.h"

char scancode_to_ascii[128] = {
    0,  27, '1','2','3','4','5','6','7','8','9','0','-','=', '\b', // backspace
    '\t','q','w','e','r','t','y','u','i','o','p','[',']','\n',     // enter
    0,'a','s','d','f','g','h','j','k','l',';','\'','`',
    0,'\\','z','x','c','v','b','n','m',',','.','/', 0, '*',
    0,' ', // space bar
    // ... (resto omitido)
};

void printPressedKey() {
    while (1) {
        uint8_t scancode = getPressedKey();
        if (scancode < 128) {
            ncPrintChar(scancode_to_ascii[scancode]);
        }   
    }
}