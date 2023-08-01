#include <stdio.h>

extern int add(int, int);

int main() {
    printf("value: %d\r\n", add(2, 3));
}
