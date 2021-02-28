<!--
 * @Descripttion : 
 * @Author       : Seulf
 * @Date         : 2021-02-28 19:29:44
 * @LastEditors  : Seulf
 * @LastEditTime : 2021-02-28 19:40:11
-->

# Python笔记——从入门到编程

<font color=Bule>*笔记中的代码后的斜体字为输出, 但由于格式显现问题并不保证格式一定对, 但内容是对的; 红体为用户输入.*</font>

## 一、变量及简单数据类型

### 1、字符串

#### 1. 定义

字符串采用单引号或双引号定义. 不同引号间可以嵌套, 但相同的不能.

eg

``` python
'Tom say "You are beautiful"'----allowed
"Tom say 'You are beautiful'"----allowed
"Tom say "Youare beautiful""----not allowed
```

#### 2、修改大小写及拼接字符串

* ***string.lower()***: 将字符串string的字母全部转换为小写形成一个新字符串, 并返回新的字符串

  

``` python
  string='LOVE'
  print(string.lower())
  ```

  > *love*

* ***string.upper()***: 用法与lower()一样只是改成了大写

  

``` python
  string='love'
  print(string.upper())
  ```

  > *LOVE*

* ***string.title()***: 将字符串string中的每个单词的开头字母大写(空格隔开的视作一个单词)

  

``` python
  string='I love you'
  print(string.title())
  ```

  > *I Love You*

* 字符串的拼接可以采用加号'+'

  

``` python
  string1='I'
  string2='love'
  string3='you'
  print(string1+' '+string2+' '+string3)
  ```

  > *I love you*

#### 3、空白的删除

* ***string.rstrip()***: 删除字符串末尾的空白, 形成一个新的字符串并返回这个新字符串

  

``` python
  string='python '
  print(string.rstrip())
  ```

  > *python*

* ***string.lstrip()***: 用法与rstrip()一样, 只是删除开头的空白

  

``` python
  string=' python'
  print(string.lstrip())
  ```

  > *python*

* ***string.strip()***: 既删除开头的空白又删除结尾的空白, ==以上三个函数都不改变string的值, 除非你把得到的新字符串赋给了string, 且他们还可以删除换行符'\n'==

  

``` python
  string=' python '
  print(string.strip())
  ```

  > *python*

### 2、数字及各种进制的转化

#### 1、整型

***str(data)***: 将整型数据data转化为字符串型数据, 并返回该字符串, ==可以转换任意进制但会自动转换为十进制==

``` python
data=0b1100
print(str(data))
```

> *12*

#### 2、浮点型

*str(data)*: 将浮点型数据data转化为字符串型, 并返回该字符串

#### 3、各种进制之间的转换

* ***bin(data)***: 任意进制数据data转换为二进制, 并返回转换后的进制数

  

``` python
  data=123
  print(bin(data))
  ```

  > *0b1111011*

* ***oct(data)***: 转八进制的

  

``` python
  data=123
  print(oct(data))
  ```

  > *0o173*

* ***int(data)***: 转十进制的, 且可以把字符串表示的十进制数字也转化为十进制整型数字.==别的进制转换函数不能转换字符串==

  

``` python
  str='12'
  print(int(str),type(int(str))
  ```

  > *12 <class 'int'>*

* *hex(data)*: 转十六进制的

## 二、列表简介

### 1、定义

列表由一系列按特定顺序排列的元素组成, 元素可以是数字、字母、字符串等各种东西, 甚至可以是列表.

### 2、创建与访问

Python中列表由中括号[]创建, 用逗号分隔不同的元素. 访问方式与c语言类似, 采用中括号[]访问, 且下标也是从0开始.==但python还有置最后一个元素位置为-1, 然后依次向前递减的计数法.==

数字列表还有一种特别的方法, 叫列表解析.

***new_list=[f(x) for x in list]***:new_list里的元素依次等于把list里的元素依次赋予x, 再带入f(x)所得结果.

``` python
list=[value**2 for value in range(1,11,1)]  #**表示二次方
print(list)
```

> *[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]*

### 3、添加元素

#### 1、末尾添加

***list.append(object)***: 将元素object添加到列表list的末尾, 且没有返回值

``` python
list=['math','Chinese']
print(list,list.append('English'))
#python解释器的执行好像是先把print里面的语句执行完得到一个确定的值再执行print语句，就比如这里
```

> *['math', 'Chinese', 'English'] None*

#### 2、特定位置插入

**list.insert(n, object)***: 在list的第n个元素处插入object, 后面的元素顺延, 且没有返回值

``` python
list=['math','Chinese']
print(list,list.insert(0,'English'))
```

> *['English', 'math', 'Chinese'] None*

### 4、删除元素

#### 1、删除列表中特定位置的元素

***del object1, oject2, ...***: 删除object1, object2, ..., 且这里的object可以是任意变量, 不局限于列表元素.

```python 
list=['math', 'Chinese']
del list[0]
print(list)

``` 

> *['Chinese']*

#### 2、要返回所删除元素的值的删除方式

***list.pop(n=-1)***：取出列表list的第n个元素，将其删除，并返回该元素的值。n=-1表示列表的最后一个元素，而n=-1也代表n的缺省值是-1，就是说如果你没有输入n的值，解释器会把n当成-1。

```python
list=[1,2,3]
print(list,list.pop(),list.pop(0)) #分别取出list的最后一个元素和第一个元素
```

> *[2] 1 3*

#### 3、删除特定值的元素

***list.remove(val)***: 从list里删除值为val的元素, 无返回值, 若list里不存在val则会报错.

``` python
list=[1,2,3,4]
print(list,list.remove(1))
```

> *[2, 3, 4] None*

### 5、组织列表

#### 1、列表排序

* ***list.sort(reverse=False)***: 对list进行排序, reverse表示是否降序排列, 默认值是升序, 要想降序, 需要置reverse=Ture, 无返回值.

* ***sorted(list, reverse=False)***: 取出list元素进行排序, 并返回这个排好序的新的列表.

``` python
list=['a','bc','e','d']
print(sorted(list,reverse=Ture),list)
print(list.sort(list),list)
```

> *['e', 'd', 'bc', 'a'] ['a', 'bc', 'e', 'd']
> None ['a', 'bc', 'd', 'e']*

#### 2、逆置列表

***list.reverse()***: 将列表list逆置, 无返回值.

``` python
list=[1,2,3,4]
print(list,list.reverse())
```

> *[4, 3, 2, 1] None*

## 三、操作列表

### 1、遍历列表

* ***for语句***
* ***range(min, max, step=1)***: 产生min, min+step, ..., 一直到max(但不包含max)等一系列数字
* ***list(range(min, max, step))***: 产生由range函数产生的一系列数字所形成的列表

``` python
for i in list: #for语句格式,list是列表或别的什么，变量i依次取list里的元素，直到取完。
    statement1
    statement2
    ...
```

``` python
list=['China','England','Japan',1,2,3]
for i in list:
    print(i,end=' ')#end=' ',表示把print的结束符变成了空格
```

> *China England Japan 1 2 3*

### 2、对数字列表的统计计算

* ***sum(list)***: 返回数字列表list里所有元素之和

* ***max(list)***: 返回list里的最大值

* ***min(list)***: 返回list里的最小值

  

``` python
  list=[1,3,4,1]
  print(sum(list),max(list),min(list))
  ```

  > *9 4 1*

### 3、列表的切片

* 列表的切片是指取出列表的一部分.

* ***list[min=0 or -len(list):max=len(list)-1 or -1:step=1]***: 依次取出list[min], list[min+step], ..., 一直到list[max]但不包含list[max].==只要两种顺序满足一种即可, 但不能两种顺序混用==

  几种特殊形式:***list[:max]***: 从开头到max(不取max)

  ​                         ***list[min:]***: 从min到末尾(不取末尾)

  ​                         ***list[:]***: 全取

  ​                         ***list[::-1]***: 取列表list的逆置

``` python
list=[value for value in range(1,11,1)]
print('原始值为：{}'.format(list))
print(list[1:10:2])
print(list[:-1:])
print(list[::-1])
```

> *原始值为:[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
> [2, 4, 6, 8, 10]
> [1, 2, 3, 4, 5, 6, 7, 8, 9]
> [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]*

### 4、列表的复制

* ==列表的复制不能直接采用等号'='==, 因为这会导致两个变量的地址也一样了. 就是说一个变量的值改变, 另一个变量也会随之改变.

* 可用***list[::]***

  

``` python
  list=[1,2,3,4]
  new_list1=list
  new_list2=list[:]
  new_list1.append(5)
  new_list2.append(6)
  print(str(list)+'\n'+str(new_list1)+'\n'+str(new_list2))
  ```

  > *[1, 2, 3, 4, 5]
  > [1, 2, 3, 4, 5]
  > [1, 2, 3, 4, 6]*

## 四、元组

### 1、定义

与列表一样, ==但值不可改变==, 但可重定义整个元组

### 2、创建

与列表一样, 但方括号换成圆括号

``` python
tuple=(2,3)
print(tuple)
tuple=(4,5)
print(tuple)
```

> *(2, 3)
> (4, 5)*

## 五、字典

### 1、定义

对应于C语言的结构体, 定义方式是采用大括号.

``` python
alien={'name':'green','point':5}
```

==冒号前面是键名后面是键值, 键名好像必须加引号, 引用的时候好像也要加引号==

### 2、引用

``` python
print(alinen['name'])
print(alien['point'])
```

> *green*
>
> *5*

### 3、添加键值对

***alien['name']=value***:alien是你已定义过的字典, 而name是你要添加的键值对的键名, value则是你要赋予它的值.

``` python
alien['age']=15
print(a)
```

> *{'number': 12, 'age': 15, 'color': 'yellow'}*

### 4、空字典

有时候字典的值需要在程序执行过程中才能确定, 这时可以先创建一个空字典.

``` python
example={}
for i in range(10):
    name=input()
    example[name]=name
print(example)
```

### 5、修改键值

如我所料, 键值的修改的形式如同添加新的键值对.

``` python
print(example)
example['age']=16
printf(example)
```

> *{'name': 'green', 'point': 5, 'age': 15}
> {'name': 'green', 'point': 5, 'age': 16}*

### 6、删除键值对

***del name1['name2']***: 删除字典name1中键名为name2的键值对

``` python
printf(example)
del example['age']
print(example)
```

> *{'name': 'green', 'point': 5, 'age': 15}
> {'name': 'green', 'point': 5}*

### 7、长字典的定义方法

``` python
example2={
    'name1':12,
    'name2':10,
}
print(example2)
```

> *{'name1': 12, 'name2': 13}*

### 8、遍历字典

#### 1、遍历键值对

**.items()**

``` python
for key,value in example2.items():
    print('\nKey:'+str(key))
    print('Value:'+str(value))
```

> *Key:name1*
> *Value:12*
>
> *Key:name2*
> *Value:13*

#### 2、只遍历键

**.keys()**

``` python
for name in example2.keys():
    print(name.title())
```

> *Name1
> Name2*

#### 3、只遍历值

**.value()**

``` python
for value in example2.values():
    print('%d'%value)
```

> *12*
>
> *13*

**set()**: 选出一个列表里所有不重复的值

``` python
example2={
    'key1':'C',
    'key2':'C',
    'key3':'python',
    'key4':'java',
}
for value in set(example2.values()):
    print('{}'.format(value))
```

> *java*
>
> *C*
>
> *python*

### 9、字典与列表的嵌套

字典和列表可以互为对方的元素.

#### 1、字典列表

元素是字典的列表, 相对于C语言里的结构体数组.

``` python
alien_0={'name':'Jack','age':1}
alien_1={'name':'Rose','age':2}
alien_2={'name':'Kitty','age':3}
alien=[alien_0,alien_1,alien_2]
print(alien)
```

> *[{'name': 'Jack', 'age': 1}, {'name': 'Rose', 'age': 2}, {'name': 'Kitty', 'age': 3}]*

#### 2、字典里存储列表

值元素是列表的字典.

``` python
pizza={
    'crust':'thick',
    'toppings':['moshrooms','extra cheese'],
}
print("You ordered a"+pizza['crust']+'-crust pizza'+'with the following toppings:')
for topping in pizza['toppings']:
    print('\t'+topping)
```

> *You ordered athick-crust pizzawith the following toppings:
> 	        moshrooms
> 	        extra cheese*

#### 3、字典中存储字典

``` python
users={
    'jack':{
        'age':12,
        'color':'yellow',
    },
    'rose':{
        'age':12,
        'color':'black',
    },
}
for key,value in users.items():
    print('\nUsename:'+key)
    print('\tage:'+str(value['age']))
    print('\tcolor:'+value['color'])
```

> *Usename:jack
> 	     age:12
> 	     color:yellow*
>
> *Usename:rose
> 	     age:12
> 	     color:black*

## 六、用户输入和while循环

### 1、input函数

参数是输出在标准输出上的语句, 返回用户输入的值.

``` python
message=input('please input your name:')
print(message)
```

> *please input your name:<font color=red>Jack</font>*
> *Jack*

同时input的输出参数语句可以用变量代替, 这可以让程序更加清晰.

``` python
prompt='Can you tell me your name?'+'\nYes or No:'
key=input(prompt)
if key=='No':
    print('That's terrible!')
else:
    print('Thank you!')
```

> *Can you tell me your name?
> Yes or No:<font color=red>No</font>
> That's terrible!*

***注意: 输入的值都是字符串变量***

### 2、while循环

与C语言的差不多, 只是形式有所不同.

``` python
prompt='please input a number,quit represent finish:'
message=input(prompt)
while message!='quit':
    print('%d'%int(message))
    message=input(prompt)
```

> *please input a number, quit represent finish:<font color=red>12</font>
> 12
> please input a number, quit represent finish:<font color=red>11</font>
> 11
> please input a number, quit represent finish:<font color=red>quit</font>*

### 3、break语句和continue语句

和C语言一样, break语句是跳出整个循环, continue是跳出本次循环.

## 七、函数

### 1、定义函数

使用def来申明函数.

``` python
def greet(username):
    print('Hello '+username.title()+'!')
username=input('please input your name:')
greet(username)
```

> *please input your name:<font color=red>Jack</font>
> Hello Jack!*

### 2、传递参数的两种方式

#### a、按顺序传递

与C语言传递参数方式一样, 实参与形参按序对应.

#### b、显性申明

``` python
def describe_pet(animal_type,pet_name):
    print('I have a '+animal_type+'.His name is '+pet_name)
describe_pet(pet_name='Jack',animal_type='cat')
```

> *I have a cat. His name is Jack*

#### c、参数的改变

python的参数分为可变与不可变. 如果是不可变的参数则函数里的变化不能传递到主函数里; 而可变的则可传递.

``` python
def numberChange(a):
	a=10
def listChange(list1,list2,list3):
	list1.append('o')
	list2=[1,2,3]
    list3[0]=10
a='hell'
numberChange(a)
print(a)
list1=[1,2,3]
list2=[1]
list3=[1]
listChange(list1,list2,list3)
print(list1,list2,list3)
```

> *hell*
>
> *[1, 2, 3, 'a'] [1] [10]*

可以看出整型、字符串等都无法改变; 而列表可以改变但不是所有方法都可以改变, 直接赋值就不可以改变.

### 3、函数的返回值

与C语言不同的是, python可以直接返回函数的返回值, 而且不用申明函数返回值的类型.

``` python
def get_person_info():
    info={}
    info['name']=input('please input name:')
    info['age']=input('please input age:')
    info['color']=input('please input color:')
    return info
info=get_person_info()
print('Name:'+info['name'])
print('Age:'+info['age'])
print('Color:'+info['color'])
```

> *please input name:<font color=red>Jack</font>
> please input age:<font color=red>12</font>
> 	please input color:<font color=red>black</font>
> 	Name: Jack
> 	Age:12
> 	Color:black*

### 4、python传递的参数

python传递的列表参数在函数中改变是永久的, 相当于C++里的&传递; 但其它参数不是. 列表传递相当于C语言里的数组, 而其它变量则不行.

若是不想这样传递列表可以用传递副本的方式.

且python函数里的变量只在函数内部起作用, 函数执行完就会被删除.

``` python
def example(change):
    change+=1
chang=2
example(chang)
print(str(chang))
```

> *2*

``` python
def example(change):
    k=0
    while k<len(change):
        change[k]+=1
        k+=1
chang=[1,2,3]
example(chang)
print(chang)
```

> *[2, 3, 4]*

***副本传递的方式不改变主函数里的值, 将传递的列表变量改为list_name[:]***

``` python
def example(change):
    k=0
    while k<len(change):
        change[k]+=1
        k+=1
chang=[1,2,3]
example(chang[:])
print(chang)
```

> *[1, 2, 3]*

### 5、设置传递参数的默认值

和C++一样, Python传递的参数也可以设置默认值, 意思是如果在调用函数时不指定该参数, 该参数的值就用默认值带入.

``` python
def describe_pet(pet_name,animal_type='cat'):
    print('Name:'+pet_name+'\nType:'+animal_type)
describe_pet('Kreey')
print('\n')
describe_pet('Kreey','dog')
```

> *Name: Kreey
> Type:cat*
>
> *Name: Kreey
> Type:dog*

### 6、传递任意数量的实参

形参名前加个星号就表示创建一个空元组, 并将传递过来的所有参数都装进这个元组中.

``` python
def make_pizza(*toppings):
    print(toppings)
make_pizza('mushrooms','green peppers')
```

> *('mushrooms', 'green peppers')*

还可以与单个形参结合传递.

``` python
def make_pizza(size, *toppings):
    print('Size:{}'.format(size))
    print('Makings:{}'.format(toppings))
make_pizza(16,'mushrooms','green peppers')
```

> *Size:16
> Makings:('mushrooms', 'green peppers')*

若是在形参名前加两个星号, 则会创建一个空字典, 并将传递过来的参数装进这个字典中.

``` python
def make_student(name,**stu_info):
    print('Name:'+name)
    for key,value in stu_info.items():
        print('{}:{}'.format(key,value))
make_student('Bill',age=12,color='black')
```

> *Name: Bill
> age:12
> color:black*

### 7、函数和模块的导入

**python语言的精华所在🐕**

#### 1、导入模块

模块是指将代码存储为一个py文件, 然后使用***import module_name***导入py文件里的代码.

导入模块后如果想引用模块中的函数, 调用格式为***module_name.function()***

#### 2、导入文件里的特定函数

***from module_name import function_name***

调用格式为***function_name()***, 无需加模块名

#### 3、取别名

使用as为所导入的模块或函数取别名.

***import module_name as mo***

***from module_name import function_name as fn***

#### 4、导入模块中所有的函数

可以直接导入模块中的所有函数, 相当于对模块中的所有函数都执行2的操作. 这样调用格式与2中相同, 直接使用函数名调用.

***from module_name import* ***

## 八、类

### 1、类的创建

``` python
class Dog():
    #创建一个名为Dog的类
    def __init__(self,name,age):
        self.name=name
        self.age=age
    def sit(self):
        print(self.name.title()+'is now sitting')
    def roll_over(self):
        print(self.name.title()+'rolled over!')
```

上述代码创建了一个名为Dog的类, 而里面的这些函数则称为方法.

**\_\_init()\__**: 这是一个特殊的方法, 当使用类Dog创建一个实例时, 都会执行它, 下划线是为了与python内置函数区分开. 而里面的**self**形参必须位于其它形参前面, 该形参是为了让后面的方法便于调用创建实例时传入其中的信息, 这里就是形参**name、age**, 且在创建实例时不必传递该形参的值. 且该方法会默认返回一个创建好的实例.**且注意这个下划线有两个**.

### 2、创建一个实例

``` python
my_dog=Dog('bill',6)

print('My dog\'s name is '+my_dog.name.title())
my_dog.sit()
```

> *My dog's name is Bill
> Billis now sitting*

### 3、类中的方法还可以有返回值

``` python
class Car:
    #类名一般默认首字母大写
    def __init__(self,model,year):
        self.model=model
        self.year=year
    def get_info(self):
        long_name=self.model+' '+str(self.year)
        return long_name.title()
my_car=Car('a4',2016)
print(my_car.get_info())
```

> *A4 2016*

### 4、给属性设置默认值及修改属性值

#### 1、默认值设置

设置默认值的方式其实和函数设置默认值的方式一样.

``` python
class Car:
    #类名一般默认首字母大写
    def __init__(self,model,year,mileage=0):
        self.model=model
        self.year=year
        self.mileage=mileage  #设置mileage的默认值为0
    def get_info(self):
        long_name=self.model+' '+str(self.year)
        return long_name.title()
my_car=Car('a4',2016)
print(my_car.get_info())
print('Mileage:'+str(my_car.mileage))
```

> *A4 2016
> Mileage:0*

#### 2、修改属性值

##### 1、直接修改

直接通过实例名来修改.

``` python
my_car.mileage=100
print('Mileage:'+str(my_car.mileage))
```

> *A4 2016
> Mileage:0
> Mileage:100*

##### 2、通过设置方法来修改

``` python
class Car:
    #类名一般默认首字母大写
    def __init__(self,model,year,mileage=0):
        self.model=model
        self.year=year
        self.mileage=mileage  #设置mileage的默认值为0
    def get_info(self):
        long_name=self.model+' '+str(self.year)
        return long_name.title()
    def update_mileage(self,mileage):
        self.mileage=mileage
my_car=Car('a4',2016)
my_car.mileage=100
print('Mileage:'+str(my_car.mileage))
my_car.update_mileage(200)
print('Mileage:'+str(my_car.mileage))
```

> *Mileage:100
> Mileage:200*

### 5、继承

#### 1、定义

如果一个类是已有的类的一个特殊版本, 则可以使用继承. 继承可以使新创建的类拥有全部或一部分已有类的属性和方法.

``` python
class Car:
    #类名一般默认首字母大写
    def __init__(self,model,year,mileage=0):
        self.model=model
        self.year=year
        self.mileage=mileage  #设置mileage的默认值为0
    def get_info(self):
        long_name=self.model+' '+str(self.year)
        return long_name.title()
    def update_mileage(self,mileage):
        self.mileage=mileage
class ElectricCar(Car):
    def __init__(self,battery_size,model,year,mileage=0):
        #定义子类的__init__()函数
        super().__init__(model,year,mileage)
        #引用父类的__init__()函数，要加super()
        self.battery_size=battery_size
	def describe_battery(self):
        print('This car has a '+str(self.battery_size)+'-kwh battery')
my_ele_car=ElectricCar(80,'a4',1999,20)
print(my_ele_car.get_info())
my_ele_car.describe_battery()
```

> *A4 1999
> This car has a 80-kwh battery*

#### 2、重写从父类继承来的方法

有时候对于父类继承而来的方法, 子类可能需要改动. 这时可直接在子类中重写一个与父类方法同名的方法.

``` python
class Car:
    #类名一般默认首字母大写
    def __init__(self,model,year,mileage=0):
        self.model=model
        self.year=year
        self.mileage=mileage  #设置mileage的默认值为0
    def get_info(self):
        long_name=self.model+' '+str(self.year)
        return long_name.title()
    def update_mileage(self,mileage):
        self.mileage=mileage
class ElectricCar(Car):
    def __init__(self,battery_size,model,year,mileage=0):
        #定义子类的__init__()函数
        super().__init__(model,year,mileage)
        #引用父类的__init__()函数，要加super()
        self.battery_size=battery_size
	def describe_battery(self):
        print('This car has a '+str(self.battery_size)+'-kwh battery')
    def get_info(self):
        #重新定义了get_info()方法
        long_name=self.model+' '+str(self.year)+' '+str(self.mileage)
        return long_name.title()
my_ele_car=ElectricCar(80,'a4',1999,20)
print(my_ele_car.get_info())
my_ele_car.describe_battery()
```

> *A4 1999 20
> This car has a 80-kwh battery*

#### 3、将类作为属性

准确的说python的类的属性、方法可以用函数、类以及别的方法来定义.

``` python
class Battery:
    def __init__(self,battery=70):
        self.battery=battery
	def describe_size(self):
        print('This car has a battery with '+str(self.battery)+' kwh')
class ElectricCar(Car):
    def __init__(self,battery_size,model,year,mileage=0):
        super().__init__(model,year,mileage)
        self.battery=Battery(battery_size)  #使用Battery类来定义属性
my_ele_car=ElectricCar(80,'a4',1999,20)
print(my_ele_car.get_info())
my_ele_car.battery.describe_size()
```

> *A4 1999
> This car has a battery with 80 kwh*

### 6、类的导入

类和函数一样可以统一存储在一个模块(即py文件)中, 然后通过**import**导入来使用.

*car.py*

``` python
#有关车的类
class Car:
    #类名一般默认首字母大写
    def __init__(self,model,year,mileage=0):
        self.model=model
        self.year=year
        self.mileage=mileage  #设置mileage的默认值为0
    def get_info(self):
        long_name=self.model+' '+str(self.year)
        return long_name.title()
    def update_mileage(self,mileage):
        self.mileage=mileage
class Battery:
    def __init__(self,battery=70):
        self.battery=battery
	def describe_size(self):
        print('This car has a battery with '+str(self.battery)+' kwh')
class ElectricCar(Car):
    def __init__(self,battery_size,model,year,mileage=0):
        super().__init__(model,year,mileage)
        self.battery=Battery(battery_size)  #使用Battery类来定义属性
```

*main.py*

``` python
from car import *
my_ele_car=ElectricCar(80,'a4',1999,20)
print(my_ele_car.get_info())
my_ele_car.battery.describe_size()
```

> *A4 1999
> This car has a battery with 80 kwh*

导入类的方式和导入函数的一样. 还可以在模块中导入另一个模块.

## 九、文件和异常

### 1、文件的读取

#### 1、基本读取

python使用函数**open**打开文件, 再用**read**来读取文件里的数据. 和C语言类似文件必须先打开才能读取.

``` python
with open('pi_digits.txt') as file_object:  #as关键字相当于把open返回的file对象赋予file_object
    contents=file_object.read()
    print(contents.rstrip())
```

> *3.1415926535
> 8979323846*

使用**with**关键字可以让python自动关闭文件, 否则就要手动使用close函数来关闭. 而**read**函数将读取文件里的所有字符并将他们存储在一个字符串内, 然后返回这个字符串.

#### 2、绝对路径读取

上面的读取方法(只使用文件名读取)只适用于与py文件存储于同一个文件夹的文件, 而若是想要读取不同文件夹里的文件, 可以输入文件存储的绝对路径来实现.

``` python
with open('D:/Users/pi_digits.txt') as file_object:
    #这里的绝对路径的写法要注意，不能使用'\'来代替'/'，因为'\'会被当初转移字符
    contents=file_object.read()
    print(contents.rstrip())
```

> *3.1415926535
> 8979323846*

#### 3、逐行读取

``` python
with open('pi_digits.txt') as file_object:
    for line in file_object:
        print(line.rstrip())
```

> *3.1415926535
> 8979323846*

利用**for**循环可以依次读取文件中每一行的数据.

#### 4、创建包含每一行的列表

可以利用**readlines**来创建一个元素为文件中每一行构成的字符串的列表.

**.readlines()**: 返回一个列表, 元素是文件每一行的字符串.

``` python
with open('pi_digits.txt') as file_object:
    lines=file_object.readlines()
for line in lines:
    print(line)
```

> *3.1415926535*
>
> *8979323846*

两行数据间会存在空格, 原因是除最后一行外每一行的最后一个字符是换行符, 再加上**print**函数之间的换行符, 所以出现了这种效果, 如果想消除空行, 可以像前面一样, 使用**.rstrip()**函数.

### 2、文件的写入

#### 1、写入空文件

***open(filename, opentype)***:open函数的参数与fopen的参数差不多, 返回值为一个file对象.opentype取值有:

| a    | 附加模式, 也即打开文件时如果原文件有内容, 并不会清除原有内容; 如果原本文件并不存在, 则会新建一个空文件 |
| ---- | ------------------------------------------------------------ |
| w    | 写模式, 写入模式. 但与附加模式不同的是, 它会清除原本文件里的内容. |
| r+   | 读取和写入的读写模式. 若文件不存在则报错. 且写是进行覆盖写, 就是不会清零, 而是从头写, 边写边覆盖原有内容. |
| r    | 只读模式. 什么都不写的话默认就是只读模式.                   |
| w+   | 可读可写. 若文件不存在, 则新建.                             |

*[详细解析](https://blog.csdn.net/ztf312/article/details/47259805)*

``` python
filename='programming.txt'
with open(filename,'w') as file_object: 
    file_object.write('I love programming!')
with open(filename) as file_object:
    print(file_object.read())
```

> *I Love programming!*

#### 2、附加模式写入

``` python
with open(filename,'a') as file_object:
    file_object.write('\nThis is \'a\'!')
with open(filename) as file_object:
    print(file_object.read())
with open(filename,'w') as file_object:
    file_object.write('This is \'w\'!\n'+'Yes it is!')
with open(filename) as file_object:
    print('\n'+file_object.read())
with open(filename,'r+') as file_object:
    file_object.write('This is \'r+\'')
	file_object.seek(0,0) #让文件指针回到开头
    print(file_object.read())
```

> *I love programming!
> This is 'a'!*
>
> *This is 'w'!
> Yes it is!*
>
> *This is 'r+'
> Yes it is!*

可以看出附加模式不会消除原文件内容, 但写模式则会; 而r+模式则是覆盖写(*'Yes it is'*还在)

### 3、异常

#### 异常处理函数

使用try-except-else代码块来处理异常.

python语言在运行过程中遇到了其无法处理的情况就会返回一个traceback来说明遇到了异常, 但为了对用户的友好性, 常常需要在异常时输出更为友好的语句.

``` python
print(5/0)
```

> *Traceback (most recent call last):
> File "<pyshell#0>", line 1, in <module>
> print(5/0)
> ZeroDivisionError: division by zero*

``` python
try:
    print(5/0)
except ZeroDivisionError:
    print('you can\'t divide by zero')
```

> *you can't divide by zero*

如你所见try-except语句, try语句后的代码里如果出现了异常则会执行except后的代码块; 否则会跳过except模块继续向后执行. 其实这样就可以了, 但我不明白为什么要加个else模块, else模块就是在try代码块没有触发异常时执行.[^1]

#### 文本分析

.split(): 可以将一句话中的每个单词分开, 放进一个列表里, 再返回这个列表.

``` python
contents='Hello world'
words=contents.split()
print('contents have {} words:{} and {}'.format(len(words),words(1),words(2)))
```

> *contents have 2 words: Hello and world*

## 十、附注

### 1、格式化输出

**print('%d'%value)**

与C语言相似.

``` python
print('%s'%'language')
print('I like %s'%'China')
```

> *language*
>
> *I like China*

**print('{}'.format(value))**

``` python
print('{} {}'.format(12,'language'))
```

> *12 language*

这个还可以表序号

``` python
print('{1} {1} {0}'.format(1,'language'))
```

> *language language 1*

控制输出小数的位数

``` python
print('{:3.4f}'.format(2))
```

> *2.0000*

`format` 的格式化输出的控制格式和 `%3.2f` 类似的控制格式差不多, 只是把 `%` 换成了 `:` 且外加了 `{}` .

*详情见[python输出](https://www.cnblogs.com/fat39/p/7159881.html).*

[^1]: 这个问题还没看到解答
