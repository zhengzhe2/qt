#include <QCoreApplication>
#include <stdio.h>
#include <stdarg.h>


//snprintf();
void Test_snprintf()
{
    char buffer[100];
    int cx;

    cx = snprintf(buffer, 100, "The half of %d", 6);
    printf("cx = %d\n", cx);
    if (cx >= 0 && cx < 100) {
        snprintf(buffer + cx, 100 - cx, ", and the half of that is %d.", 60/2/2);
    }

    puts(buffer);
}

//sprintf();
void Test_sprintf()
{
    char buffer[50];
    int n, a = 5, b = 3;
    n = sprintf(buffer, "%d plus %d is %d", a, b, a+b);
    printf("n = %d\n", n);
    printf("[%s] is a string %d chars long\n", buffer, n);
}

//vprintf();
void WriteFormatted(const char* format, ...)
{
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
}


void Test_vprintf()
{
    WriteFormatted("Call with %d variable argument.\n", 1);
    WriteFormatted("Call with %d variable %s.\n", 2, "arguments");
}

//vsprintf();
void PrintFError(const char* format, ...)
{
    char buffer[256];
    va_list args;
    va_start(args, format);
    vsprintf(buffer, format, args);
    perror(buffer);
    va_end(args);
}

void Test_vsprintf()
{
    FILE* pFile;
    char szFileName[] = "myfile.txt";

    pFile = fopen(szFileName, "r");
    if (pFile == NULL) {
        PrintFError("Error opening '%s'", szFileName);
    }
    else {
        fclose(pFile);
    }
}

//va
void simple_va_fun(int i, ...)
{
    va_list arg_ptr;
    char* s = NULL;
    va_start(arg_ptr, i);
    s = va_arg(arg_ptr, char*);
    va_end(arg_ptr);
    printf("%d %d\n", i, s);
}

//vsnprintf();

void PrintFError_1(const char *format, ...)
{
    char buffer[256];
    va_list args;
    va_start(args, format);
    vsnprintf(buffer, 256, format, args);
    perror(buffer);
    va_end(args);
}

void Test_vsnprintf()
{
    FILE* pFile;
    char szFileName[] = "myfile.txt";
    pFile = fopen(szFileName, "r");
    if (pFile == NULL) {
        PrintFError_1("Error opening '%s'", szFileName);
    }
    else {
        fclose(pFile);
    }
}

//vfprintf();
void WriteFormatted_1(FILE* stream, const char *format, ...)
{
    va_list args;
    va_start(args, format);
    vfprintf(stream, format, args);
    va_end(args);
}

void Test_vfprintf()
{
    FILE* pFile;
    pFile = fopen("/home/zhengzhe2/workspace/test/snprintf/myfile.txt", "w");
    WriteFormatted_1(pFile, "Call with %d variable argument.\n", 1);
    WriteFormatted_1(pFile, "Call with %d variable %s.\n", 2, "arguments");
    fclose(pFile);
}

//fprintf();
void Test_fprintf()
{
    FILE* pFile;
    int n;
    char name[100];
    pFile = fopen("/home/zhengzhe2/workspace/test/snprintf/myfile1.txt", "w");
    for (n = 0; n < 3; ++n) {
        puts("please, enter a name:");
        gets(name);
        fprintf(pFile, "Name %d [%-10.10s]\n", n+1, name);
    }
    fclose(pFile);
}

//vsacnf();
void GetMatches(const char* format, ...)
{
    va_list args;
    va_start(args, format);
    int ret = vscanf(format, args);
    printf("ret = %d\n", ret);
    va_end(args);
}

void Test_vscanf()
{
    int val;
    char str[100];
    printf("Please enter a number and a word:");
    fflush(stdout);
    GetMatches("%d %99s", &val, str);
    printf("Number read:%d\nWord read:%s\n", val, str);
}

//fscanf();
void Test_fscanf()
{
    char str[80];
    float f;
    FILE* pFile;
    pFile = fopen("/home/zhengzhe2/workspace/test/snprintf/myfile2.txt", "w+");
    fprintf(pFile, "%f %s", 3.1416, "PI");
    rewind(pFile); //将文件指针重新指向文件开头
    fscanf(pFile, "%f", &f);
    fscanf(pFile, "%s", str);
    fclose(pFile);
    printf("I have read:%f and %s\n", f, str);
}

//vsscanf();
void GetMatches_1(const char* str, const char* format, ...)
{
    va_list args;
    va_start(args, format);
    vsscanf(str, format, args);
    va_end(args);
}

void Test_vsscanf()
{
    int val;
    char buf[100];
    GetMatches_1("99 bottles of beer on the wall", "%d %s", &val, buf);
    printf("Product:%s\nQuantity:%d\n", buf, val);
}

//vfscanf();
void ReadStuff(FILE* stream, const char* format, ...)
{
    va_list args;
    va_start(args, format);
    vfscanf(stream, format, args);
    va_end(args);
}

void Test_vfsacnf()
{
    FILE* pFile;
    int val;
    char str[100];
    pFile = fopen("/home/zhengzhe2/workspace/test/snprintf/myfile.txt", "r");
    if (pFile != NULL) {
        ReadStuff(pFile, "%s %d", str, &val);
        printf("I have read %s and %d\n", str, val);
        fclose(pFile);
    }
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
//    Test_snprintf();
//    Test_sprintf();
//    Test_vprintf();
//    Test_vsprintf();
//    Test_vsnprintf();
//    Test_vfprintf();
//    simple_va_fun(100, 200, 300);
//    Test_fprintf();
//    Test_vscanf();
//    Test_fscanf();
//    Test_vsscanf();
    Test_vfsacnf();
    return a.exec();
}
