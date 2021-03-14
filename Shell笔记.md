<!--
 * @Descripttion : 
 * @Author       : Seulf
 * @Date         : 2021-03-08 22:27:49
 * @LastEditors  : Seulf
 * @LastEditTime : 2021-03-09 10:16:33
-->

# Shell笔记

## 一、执行及固定格式

shell是一个用于用户操作Linux内核的中间层, 一个基本的shell脚本如下:

``` shell
#!/bin/bash		#必须添加，用于指定解释器运行路径
echo "Hello World"
```

执行的话可以使用两种方式:

``` shell
sh example.sh	#直接命令执行
```

``` shell
chmod 744 example.sh	
./example.sh	#先通过执行脚本权限，再使用相对路径执行
chmod 644 example.sh	#这是撤销权限
```

## 二、变量

### 1、定义变量

和几乎所有的脚本语言一样, 变量直接赋值定义即可, 如:

``` shell
A=100
```

### 2、使用变量

使用变量要用$A这种形式, 如

``` shell
echo "A=$A"
```

### 3、删除变量

使用unset关键字, 如:

``` shell
unset A
```

### 4、声明静态变量

静态变量只能读不能修改且不能unset, 使用readonly指定, 如:

``` shell
readonly A=10
```

### 5、变量名称规则

* 以字母数字下划线组成, 不能以数字开头
* <span style="background-color:yellow; ">等号两侧不能有空格</span>
* 一般大写

### 6、将命令的返回值返回给变量

1. 使用``反引号

``` shell
   RESULT=`ls -l \home`
```

2. 使用$()格式，如：

``` shell
   RESULT=$(date)
```

### 7、设置环境变量

环境变量就是相对于系统变量,可以同时让多个shell脚本使用

1. export 变量名=变量值,如:

   ```shell
   export A=10
   B=100
   export B
   ```

2. 让环境变量生效,刷新/etc/profile文件:

   ```shell
   source /etc/profile
   ```

3. 使用环境变量
   和使用普通变量一样,使用$符号引用

### 8、位置参数变量

和C语言的main函数参数一样,脚本执行可以从命令行传入参数,如:

```shell
./myShell.sh 100 200
```

#### 基本语法

* $n:获取从第0~第9的参数,超过9则要使用大括号括起来如\${10}.\$0也即脚本名称(./myShell.sh)
* $*:获取所有参数,将所有参数看成一个整体
* \$@:获取所有参数,将不同参数区别对待
* $#:获取所有参数的个数,不包括\$0

### 9、预定义变量

1. $$获取当前进程的进程号
2. $!:最后一个进程的进程号
3. $?:上一个进程执行是否成功,成功返回0

以后台方式运行脚本:

```shell
./myShell.sh &
echo "$$"
echo "$!"
echo "$?"
```

## 二、运算符

1. 使用\$((运算式)),$[运算式]
2. `expr m + n`:运算符和参数间要有空格

```shell
a=$((1+2))
b=$[(1+2)*3]
c=`expr 1 % 2`
```

```sh
RESULT=$[$1+$2]
echo "$RESULT"
```

## 三、条件判断

### 1、形式

```sh
if [ contion ]	#注意要有空格
then
	arguments
fi
```

### 2、contion写法

1. =：判断字符串是否相等
2. -gt -ge -lt -le -eq -ne:大于/大于等于/小于/小于等于/等于/不等于
3. -r -w -x：文件是否有读/写/执行的权限
4. -f -e -d：文件存在且是一个常规文件/文件存在/文件存在且是一个目录

```sh
#以下是一些例子
if [ 2 -gt 2 ]
if [-e /root/etc/profile ]
if [ "12" = "123" ]
```

## 四、流程控制

### 1、if

```sh
if [ contion ]
	then
		arguments
	elif [ contion ]
	then
		arguments
	fi
```



### 2、case

