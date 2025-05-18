#include <stdint.h>
#include "naiveConsole.h"
#define STDOUT 1
#define STDERR 2


uint64_t sys_write(uint32_t fd, const char * buf, uint64_t count);

void sysCallDispatcher(uint64_t id, uint64_t rbx, uint64_t rcx, uint64_t rdx) {
    switch (id) {
        case 4:
            sys_write(rbx, (char *)rcx, rdx);
            break;
    
        default:
            break;
    }
}

uint64_t sys_write(uint32_t fd, const char * buf, uint64_t count) {
    switch (fd) {
    case STDOUT:
        ncPrintStyleCount(buf, 0x0F, count);
        break;
    case STDERR:
        ncPrintStyleCount(buf, 0x04, count);
        break;
    
    default:
        break;
    }

    return 0;
}
