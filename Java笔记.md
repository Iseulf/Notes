<!--
 * @Descripttion : 
 * @Author       : Seulf
 * @Date         : 2021-02-28 19:38:47
 * @LastEditors  : Seulf
 * @LastEditTime : 2021-03-02 11:18:32
-->

# Java笔记

## 一、Java的运行环境

Java是著名的跨平台程序语言, 其跨平台的特性主要是通过在系统之上外加一层虚拟机所实现的, 其主要术
语名有:
| 术语名 | 缩写 |解释 |
| ---   | --- | --- |
| Java Development Kit | JDK | 编写Java的程序员使用的软件 |
| Java Runtime Environment | JRE | 运行Java程序时需要的环境, 也即虚拟机 |
| javac | Java的一个编译器 |

### 运行Java程序流程

``` bash
javac ClassName.java
java ClassName
```

<span style="color:red">注意</span>:java指令不能加文件名后缀.class.

在Java11之后对单个文件可以直接执行:

``` bash
java ClassName
```

## 二、Java的基本概念

### 1、Java程序基本结构

``` java
public class FirstSample {
    public static void main(String[] args) {
        System.out.println("We will not use 'Hello World'");
    }
}
```

Java中所有的程序都要封装在一个类中, Java中所有的函数都要通过类来使用.

### 2、Java的基本数据类型

Java中存在八种基本数据类型:

1. long：8bytes
2. int：4bytes
3. short：2bytes
4. byte：1byte
5. float：4bytes
6. double：8bytes
7. char：2bytes
8. boolean：1byte

整数型默认时int, 浮点数默认是double. 想表达其他类型加后缀L/D即可.

Java的其它类型并不会和C语言中的一样可以用来判断if语句等, 且其也不能自动类型转换为Boolean
类型, 也即如下语句会报错:

``` java
if(1){
    System.out.println("Hello");
}
```
