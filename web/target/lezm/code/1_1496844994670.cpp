#include <stdio.h>

int main(){
    int a, b;
    while(~scanf("%d%d", &a, &b))
        printf("%x\n", a+b);
    return 0;
}