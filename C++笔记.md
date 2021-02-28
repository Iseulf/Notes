<!--
 * @Descripttion : 
 * @Author       : Seulf
 * @Date         : 2021-02-28 19:30:24
 * @LastEditors  : Seulf
 * @LastEditTime : 2021-02-28 19:39:55
-->

# C++笔记

## 一、函数

### 1、引用

``` cpp
int a=10;
int &b=a;
```

如上就定义了一个引用变量b, 它相当于a的别名. 换句话说, a与b同地址, 改变b也将改变a.

通过引用变量, 函数参数将使用原始数据而不是拷贝量. 一般的函数参数都是传递实参的拷贝, 因而无法改变原始数据. `引用变量必须在声明时将其初始化`

``` cpp
#include<iostream>
void change(int &x,int y){
    x=x+1;
    y=y+1;
}
int main(){
    using namespace std;
    int x=1,y=2;
    change(x,y);
    cout<<x<<endl<<y<<endl;
    return 0;
}
```

> 2
>
> 2

返回值也可声明为引用类型, 这样就是将返回值本身给复制过去.(C++的返回值机制是拷贝返回值的值再将这个拷贝值赋值过去.)

``` cpp
#include<iostream>
int &AddOme(int &x){
    x=x+1;
    return x;
}
int main(){
    using namespace std;
    int x=1;
    int &y=AddOne(x);
    y++;
    cout<<x<<endl<<y<<endl;
    return 0;
}
```

> 3
>
> 3

若不想传递时在子函数中改变变量的值, 可以使用 `const` 关键字.

``` cpp
#include<stdio.h>
int change(const int &x){
    x=x+1;
    return 0;
}
int main(){
    int x=2;
    change(x);
    printf("%d",x);
    return 0;
}
```

> <font color="red">error</font>: assignment of read-only reference 'x'

引用一般用于传递结构体变量, 这样可以节省空间, 若是不加引用, 则传递的是拷贝的临时变量会占用内存.

### 2、函数重载

`函数特征标` : 函数参数的类型、数目及顺序. 相同函数名但函数特征标不同的就叫函数的重载.

编译器会自动根据参数判断该执行哪一个具体函数.

``` cpp
#include<iostream>
void print(const char *str){
    using namesapce std;
    cout<<str<<endl;
}
void print(const char *str,int n){
    using namespace std;
    for(int i=0;i<n;i++)
        cout<<str<<endl;
}
int main(){
    print("I love");
    print("you",3);
    return 0;
}
```

> I love
>
> you
>
> you
>
> you

`默认参数` : 可以设置参数的默认值, 在未指定该参数时可以使用默认参数值.

### 3、
