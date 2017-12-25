#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//memset();
void Test_memset()
{
#if 0
    int i = 0;
    char buf[10];
    memset(buf, '\0', sizeof(char)*10);
    for (i = 0; i < 10; ++i) {
        printf("%c", buf[i]);
    }
    printf("\n");

    char* pBuf = (char*)malloc(sizeof(char)*10);
    if (pBuf == NULL) {
        perror("Memory error:");
    }
    else {
        memset(pBuf, 0, sizeof(char)*10);
        for (i = 0; i < 10; ++i) {
            printf("%c", pBuf[i]);
        }
        printf("\n");
    }
    free(pBuf);
    pBuf = NULL;

    int iBuf[10];
    memset(iBuf, 0, sizeof(int)*10);
    for (i = 0; i < 10; ++i) {
        printf("%d", iBuf[i]);
    }
    printf("\n");
#endif

#if 1
    int i = 0;
    char cBuf[10];
    char cBuf1[10];

    memcpy(cBuf1, memset(cBuf, 'a', sizeof(char)*10), sizeof(char)*10);
    for (i = 0; i < 10; ++i) {
        printf("%c", cBuf[i]);
    }
    printf("\n");

    for (i = 0; i < 10; ++i) {
        printf("%c", cBuf1[i]);
    }
    printf("\n");

#endif
}

//memcpy();
void* memcpy1(void* desc, const void* src, size_t size)
{
    if ((desc == NULL) || (src == NULL)) {
        return NULL;
    }

    unsigned char* desc1 = (unsigned char*)desc;
    unsigned char* src1 = (unsigned char*)src;

    while (size-- > 0) {
        *desc1 = *src1;
        desc1++;
        src1++;
    }

    return desc;
}

void Test_memcpy()
{
    int dest[2] = {0};
    const char src[5] = "1234";
    memcpy1(dest, src, sizeof(src));

    printf("dest sizeof %d\n", (int)sizeof(dest));    //8
    printf("dest[0] sizeof %d\n", (int)sizeof(dest[0]));  //4
    printf("src sizeof %d\n", (int)sizeof(src));  //5
    printf("src[0] sizeof %d\n", (int)sizeof(src[0]));  //1

    printf("dest = %s\n", (char*)dest);

}



int main()
{
//    Test_memset();
    Test_memcpy();
    return 0;
}
