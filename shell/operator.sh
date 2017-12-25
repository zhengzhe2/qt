#!/bin/bash

#expr 是一款表达式计算工具，使用它能完成表达式的求值操作。

val=`expr 2 + 2`
echo "两数之和为 : $val"

#两点注意：
#表达式和运算符之间要有空格，例如 2+2 是不对的，必须写成 2 + 2，这与我们熟悉的大多数编程语言不一样。
#完整的表达式要被 ` ` 包含，注意这个字符不是常用的单引号，在 Esc 键下边。


#算术运算符

#+	加法	`expr $a + $b` 结果为 30。
#-	减法	`expr $a - $b` 结果为 -10。
#*	乘法	`expr $a \* $b` 结果为  200。
#/	除法	`expr $b / $a` 结果为 2。
#%	取余	`expr $b % $a` 结果为 0。
#=	赋值	a=$b 将把变量 b 的值赋给 a。
#==	相等。用于比较两个数字，相同则返回 true。	[ $a == $b ] 返回 false。
#!=	不相等。用于比较两个数字，不相同则返回 true。	[ $a != $b ] 返回 true。

#注意：条件表达式要放在方括号之间，并且要有空格，例如: [$a==$b] 是错误的，必须写成 [ $a == $b ]。

a=10
b=20

val=`expr $a + $b`
echo "a + b = $val"

val=`expr $a - $b`
echo "a - b = $val"

val=`expr $a \* $b`
echo "a * b = $val"

val=`expr $a / $b`
echo "a / b = $val"

val=`expr $a % $b`
echo "a % b = $val"

if [ $a == $b ]
then
	echo "a == b"
fi

if [ $a != $b ]
then
	echo "a != b"
fi


#注意：
#乘号(*)前边必须加反斜杠(\)才能实现乘法运算；
#if...then...fi 是条件语句，后续将会讲解。
#在 MAC 中 shell 的 expr 语法是：$((表达式))，此处表达式中的 "*" 不需要转义符号 "\" 。


#关系运算符
#关系运算符只支持数字，不支持字符串，除非字符串的值是数字。
#-eq	检测两个数是否相等，相等返回 true。	[ $a -eq $b ] 返回 false。
#-ne	检测两个数是否相等，不相等返回 true。	[ $a -ne $b ] 返回 true。
#-gt	检测左边的数是否大于右边的，如果是，则返回 true。	[ $a -gt $b ] 返回 false。
#-lt	检测左边的数是否小于右边的，如果是，则返回 true。	[ $a -lt $b ] 返回 true。
#-ge	检测左边的数是否大于等于右边的，如果是，则返回 true。	[ $a -ge $b ] 返回 false。
#-le	检测左边的数是否小于等于右边的，如果是，则返回 true。	[ $a -le $b ] 返回 true。

a=10
b=20

if [ $a -eq $b ]
then
	echo "a == b"
else
	echo "a != b"
fi

if [ $a -ne $b ]
then
	echo "a != b"
else
	echo "a == b"
fi

if [ $a -gt $b ]
then
	echo "a > b"
else
	echo "a =< b"
fi

if [ $a -lt $b ]
then
	echo "a < b"
else
	echo "a >= b"
fi

if [ $a -ge $b ]
then
	echo "a >= b"
else
	echo "a < b"
fi

if [ $a -le $b ]
then
	echo "a <= b"
else
	echo "a > b"
fi


