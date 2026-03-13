#include <string.h>

#define STDOUT 1

int sys_write(int fd, void *buffer, int size);

int puts(const char* str) {
    int len = strlen(str);
    return sys_write(STDOUT, (void *)str, len);
}

int main() {
    puts("hola manola \n");
}