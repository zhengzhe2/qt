#!/bin/bash

my_array=(A B "C" D);

array_name[0]=value0
array_name[1]=value1
array_name[2]=value2

#读取数组
#${array_name[index]}

echo "第一个元素为: ${my_array[0]}"
echo "第二个元素为: ${my_array[1]}"
echo "第三个元素为: ${my_array[2]}"
echo "第四个元素为: ${my_array[3]}"

#获取数组中的所有元素
#使用@ 或 * 可以获取数组中的所有元素
echo "数组的元素为: ${my_array[*]}"
echo "数组的元素为: ${my_array[@]}"

for i in ${my_array[*]}; do
	echo $i
done

for i in ${my_array[@]}; do
	echo $i
done



#获取数组的长度
#获取数组长度的方法与获取字符串长度的方法相同
echo "数组元素个数为: ${#my_array[*]}"
echo "数组元素个数为: ${#my_array[@]}"

echo "my_array[0]: ${#my_array[0]}"
echo "array_name[1]: ${#array_name[1]}"


#数组的值也可以写入变量。
A=1
my_array=($A B C D)
echo "第一个元素为: ${my_array[0]}"
echo "第二个元素为: ${my_array[1]}"
echo "第三个元素为: ${my_array[2]}"
echo "第四个元素为: ${my_array[3]}"

#根据数组元素索引获取该数组元素值时，数组下标可为变量。
arr=(a b c d)
i=2
echo ${arr[$i]}


my_array=(a b "c","d" abc)
echo "-------FOR循环遍历输出数组--------"
for i in ${my_array[@]};
do
	echo $i
done



# -eq           //等于
#-ne           //不等于
#-gt            //大于
#-lt            //小于
#ge            //大于等于
#le            //小于等于
echo "-------::::WHILE循环输出 使用 let i++ 自增:::::---------"
j=0
while [ $j -lt ${#my_array[@]} ];
do
	echo ${my_array[$j]}
	let j++
done

echo "--------:::WHILE循环输出 使用 let  "n++ "自增: 多了双引号，其实不用也可以:::---------"
n=0
while [ $n -lt ${#my_array[@]} ]
do
	echo ${my_array[$n]}
	let "n++"
done

echo "---------::::WHILE循环输出 使用 let m+=1 自增,这种写法其他编程中也常用::::----------"
m=0
while [ $m -lt ${#my_array[@]} ]
do
	echo ${my_array[$m]}
	let m+=1
done


echo "-------::WHILE循环输出 使用 a=$[$a+1] 自增,个人觉得这种写法比较麻烦::::----------"
a=0
while [ $a -lt ${#my_array[@]} ]
do
	echo ${my_array[$a]}
	a=$[$a+1]
done
