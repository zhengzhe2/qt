#!/bin/bash

#Shell 变量

echo "Hello World !"
your_name="zhengzhe"
echo $your_name
echo ${your_name}
for skill in Ada Coffe Action Java; do
	echo "I am good at ${skill}Script"
done
your_name="tom"
echo $your_name
your_name="alibaba"
echo $your_name

myUrl="http://www.w3cschool.cc"
echo $myUrl
readonly myUrl
#myUrl="http://www.runoob.com"
echo $myUrl

echo $your_name $myUrl

echo $your_name
unset your_name
echo $your_name

echo $myUrl
#unset myUrl
#echo %myUrl

str='this is a string'
echo $str
your_name1="liuhuan"
str1="Hello, I know your are \"${your_name1}\"! \n"
echo $str1

greeting="hello, "$your_name1" !"
greeting_1="hello, ${your_name1} !"
echo $greeting $greeting_1     #拼接字符串

string="abcd"
echo ${#string}    #获取字符串长度

string1="runoob is a great site"
echo ${string1:1}  #提取子字符串

string="runoob is a great company"
echo `expr index "$string" o`      #查找子字符串

#Shell 数组
array_name=(value0 value1 value2 value3)
echo ${array_name[3]}

array_name[0]=value4
array_name[1]=value5 
echo ${array_name[0]}

array_name[n]=valuen1111
echo ${array_name[n]}

value6=${array_name[1]}
echo $value6

echo ${array_name[@]}

for a in ${array_name[@]}; do
	echo $a
done 

length=${#array_name[@]}     #取得数组元素的个数
echo $length

length=${#array_name[*]}
echo $length

lengthn=${#array_name[n]}    #取得数组单个元素的长度
echo $lengthn

var="http://www.aaa.com/123/456.htm"
echo ${var#*//}       #    # 号截取，删除左边字符，保留右边字符; 其中 var 是变量名，# 号是运算符，*// 表示从左边开始删除第一个 // 号及左边的所有字符 ,即删除 http://

echo ${var##*/}     #    ## 号截取，删除左边字符，保留右边字符。##*/ 表示从左边开始删除最后（最右边）一个 / 号及左边的所有字符 ;即删除 http://www.aaa.com/

echo ${var%/*}       #     %号截取，删除右边字符，保留左边字符,%/* 表示从右边开始，删除第一个 / 号及右边的字符

echo ${var%%/*}    #     %% 号截取，删除右边字符，保留左边字符, %%/* 表示从右边开始，删除最后（最左边）一个 / 号及右边的字符

echo ${var:0:5}        #     从左边第几个字符开始，及字符的个数, 其中的 0 表示左边第一个字符开始，5 表示字符的总个数。

echo ${var:7}	       #	  从左边第几个字符开始，一直到结束。其中的 7 表示左边第8个字符开始，一直到结束。

echo ${var:0-7:3}     #      从右边第几个字符开始，及字符的个数, 其中的 0-7 表示右边算起第七个字符开始，3 表示字符的个数。

echo ${var:0-7}	      #       从右边第几个字符开始，一直到结束。表示从右边第七个字符开始，一直到结束。

# 注：（左边的第一个字符是用 0 表示，右边的第一个字符用 0-1 表示）

