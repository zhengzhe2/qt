#!/bin/bash
# Shell 传递参数
#在执行 Shell 脚本时，向脚本传递参数，脚本内获取参数的格式为：$n。n 代表一个数字，1 为执行脚本的第一个参数，2 为执行脚本的第二个参数，以此类推……


# 1.向脚本传递三个参数，并分别输出，其中 $0 为执行的文件名：

echo "Shell 传递参数实例！"
echo "执行的文件名：$0";
echo "第一个参数为：$1";
echo "第二个参数为：$2";
echo "第三个参数为：$3";
echo "参数个数为：$#"     #传递到脚本的参数个数
echo "传递的参数作为一个字符串显示：$*";    #以一个单字符串显示所有向脚本传递的参数。如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。
echo "传递的参数作为一个字符串显示：$@";   #与$*相同，但是使用时加引号，并在引号中返回每个参数。 如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。
echo "脚本运行的当前进程ID号: $$";	            #脚本运行的当前进程ID号		
echo "后台运行的最后一个进程的ID号: $!";        #后台运行的最后一个进程的ID号
echo "显示Shell使用的当前选项:$-";	#显示Shell使用的当前选项，与set命令功能相同。
echo "显示最后命令的退出状态: $?";   #显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。



# ./parameters1.sh 1 2 3




echo "-- \$* 演示 ---"
for i in "$*"; do
	echo $i
done

echo "-- \$@ 演示 ---"
for j in "$@"; do
	echo $j
done