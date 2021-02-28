<!--
 * @Descripttion : 
 * @Author       : Seulf
 * @Date         : 2021-02-22 19:15:15
 * @LastEditors  : Seulf
 * @LastEditTime : 2021-02-28 19:39:45
-->

# JS笔记

<span style="font-size:12px">本笔记使用vscode的Markdown Preview Enhanced插件, 代码均可在安装了插件和环境的vscode中执行.</span>

## 一、js代码所写的位置

1. `script`标签中. 和css代码一样, js也可以写在body前的script标签中, 如:

   

``` html
   <script type="text/javascript">
       alert("Hello");
   </script>
```

2. 和css一样, js也可以写在标签属性里面.css用的是`style`属性, 而js用的则是`onclick`属性, 如:

   

``` html
   <button onclick="alert('Hello');"></button>
```

3. 而如果是a标签则可以写在`href`标签中, 如:

   

``` html
   <a href="javascript:alert('Hello');"></a>
```

4. <span style="color:red">推荐使用</span>: 写在外部文件中, 利用script标签的`src`属性来链接, 如:

   

``` javascript
   alert('Hello')
```

   

``` html
   <script type="text/javascript" src="js/script.js">
   </script>
```

   这时候如果在script标签里再添加代码, 这部分代码会被浏览器忽略, 也即只有 `js\script.js` 代码会被执行.

## 二、js的基本概念

### 1、注释

``` javascript
/*
多行注释
*/
//单行注释
```

### 2、小知识点

1. js严格区分大小写
2. 以分号表示一行代码的结束,不写的话浏览器会自动帮你加上,但有时候浏览器会加错分号的位置
3. js中会忽略多个空格和换行
4. js属于解释型语言,浏览器根据代码一行一行解释执行

### 3、字面量和变量

#### a、字面量

指那些不可改变的值, 如:1, 2, 3..., 字面量都是可以直接使用的, 如:

``` javascript
alert(123);
```

#### b、变量

用于保存字面量的值, 值可以任意改变, 如:

``` javascript
var x = 123;
x = 456;
```

js采用 `var` 关键字来声明变量, 所有变量的初始值为 `undefined` .

### 4、标识符

标识符是指变量名, 函数名, 文件名等等的名称. 其必须满足以下几点要求:

1. 由字母,数字,下划线,$组成
2. 不能以数字开头
3. 不能是ES(ES是JavaScript的标准,日常中这两个意思一样)中的保留字或关键字
4. 一般采用驼峰命名法(首字母小写,每个单词开头大写)
5. js底层采用的是utf-8编码保存变量,所以支持中文标识符

## 三、变量

js中的变量有六种类型:

1. String
2. Number
3. Boolean
4. Null
5. Undefined
6. Object

前五种属于基本数据类型, 而Object属于引用数据类型.==这六个类型应该都是类==

### 1、String类型

用引号括起来的值就是一个字符串, 如:

``` javascript
var str = "Hello"
console.log(str)
```

### 2、Number类型

js中所有的数值类型都是Number类型, 包括整数和小数. 如:

``` javascript
var x = 1.2
x = 22
```

> typeof: 运算符用于检查变量类型, 用法: typeof str

特殊的数字字面量:

1. `Infinity`:js中的最大值表示为`Number.MAX_VALUE`, 大概为$1.7\times10^{38}$, 如果会有超过这个数的则表示为`Infinity`. 还有一个`Number.MIN_VALUE`, 大概为$5\times10^{-324}$
2. `NaN`: 是一个特殊的数字, 表示not a number

如果使用js进行小数运算, 可能会得到一个不精确的结果.

### 3、Boolean类型

布尔值, 只有true和false两个值, 如:

``` javascript
var bool = true;
```

<span style="color:red; font-weight:bold; ">注意</span>:true和false都是字面值

### 4、Null类型

只有一个null值, 专门用于表示对象为空, 如:

``` javascript
var x = null;
```

### 5、undefined类型

只有一个undefined值, 用于表示未定义, 如:

``` javascript
var x = undefined;
```

### 6、类型转换

#### a、调用toString方法

和Java一样几乎每个类都会实现toString方法. 如:

``` javascript
var a = 123;
a = a.toString();
```

<span style="color:red; font-weight:bold; ">注意</span>: Null和undefined没有toString方法

#### b、调用String函数

js实现了一个String函数, 如:

``` javascript
var a = 123;
a = String(a);
```

这种方法适用于Null和undefined类型.

#### c、调用Number函数

js实现了一个Number函数, 如:

``` javascript
var a = "123";
a = Number(a);
```

#### d、parseFloat/parseInt函数

返回口头直到遇到不是数字的部分, 将其转换为Number型, 如:

``` javascript
var x = "123.1px";
x = parseFloat(x);
```

如果传入的是实现了toString或者valueOf的非字符串对象, 则返回值是先调用方法转为字符串, 再对该字符串进行转换.

还可以指定要转换的数字进制, 如:

``` javascript
var x = "070";
x = parseInt(x, 8);
```

#### e、Boolean函数

除了0, NaN, null, "", undefined其它的字面值都被转换为true.

## 四、运算符

### 1、算数运算符

和C语言一样存在+, -, *, /, %. 对非Number类型的值使用这些运算符时, 会先将其转换为Number类型, 再进行运算.

> 但字符串进行了运算符重载, 所以字符串加法是拼接. 且任何类型和字符串做加法都会转换为字符串拼接. 其他运算符还是先转换为Number型再运算

<span style="color:red; font-weight:bold">注意</span>: JS的除法是完整的除法, 和C语言不一样.

### 2、一元运算符

#### a、+, -

+, -做一元运算符时, 遇到非Number类型时, 会先将其转换为Number类型, 再转换, 如:

``` javascript
var x = "123";
x = -x;
console.log(typeof x, x)
```

输出为 `number -123` .

#### b、自增和自减运算符

++和--, 和C语言一样也有前后之分, 它们的区别也和C语言的一样, 如:

``` javascript
var x = 1234;
x++;
++x;
```

### c、typeof运算符

求变量类型, 如:

``` javascript
var x = 12;
console.log(typeof x);
```

### 3、逻辑运算符

!, &&, ||和C语言里的含义一样. 但对于&&和||运算符, 如果是非布尔值类型, 其返回值不是Boolean类型, 而是先转换为Boolean, 对于&&运算有:

1. 如果第一个为true,则返回第二个值(不是转换后的Boolean类型的值,而是本身的值)
2. 如果第一个为false,则返回第一个值

对于||运算则有:

1. 如果第一个为true,则返回第一个值
2. 如果第一个为false,则返回第二个值

### 4、赋值运算符

=, +=, -=, *=, /=, %=和C语言含义一样.

### 5、关系运算符

\==, >, <, \>=, \<=, \!=. 对于非Number类型和Number类型比较, 则会将其转换为Number类型, 再比较. 如:

``` javascript
console.log("1" == 1);
console.log(true == "1");
console.log(undefined == null);
console.log(null == 0); //false
```

除标注了的外输出都为true.

> isNaN函数: 检查一个值是否为NaN

<span style="color:red; font-weight:bold; ">注意</span>: 比较数中有NaN, 则不管做何种比较(包括和自己比较)其结果都是false. 而比较两个字符串时, 所比较的字符串每个字母的ASSCI码.

还有\=\==和\!\==, 这两个不会做自动类型转换, 类型不同则直接返回false.

### 6、条件运算符

?: 和C语言一样的含义, 如:

``` javascript
var x = 123;
x == 123 ? console.log("1") : console.log("2");
```

## 五、流程控制

### 1、JS代码块

和C语言一样JS的代码块也是采用{}表示, 但和C语言不一样JS代码块中的内容对外可见, 如:

``` javascript
{
    var x = 12;
}
console.log(x)
```

### 2、if语句

和C语言的用法差不多, 如:

``` javascript
var a = 10;
if (a > 9) {
    console.log("Hello");
} else if (a > 10) {
    console.log("2");
} else {
    console.log("3");
}
```

### 3、switch语句

和C语言用法相似, 如:

``` javascript
var x = 1;
switch (x) {
    case 1:
        console.log("1");
        break;
    case 2:
        console.log("2");
        break;
    default:
        console.log("333");
        break;
}
```

### 4、while语句

和C语言用法相似, 如:

``` javascript
var x = 12;
while (x > 20) {
    alert(x++);
}
```

### 5、for循环

和C语言用法相似, 如:

``` javascript
for (var x = 10; x > 3; x++) {
    alert(x);
}
```

### 6、break和continue

可以用于退出switch, for和while语句. 区别和C语言一样.

## 六、对象

### 1、内建对象

Math, Number, Boolean, Function, Object等在ES中规定的对象

### 2、宿主对象

由JS的运行环境提供的对象, 目前来讲主要是指浏览器提供的对象, 比如BOM, DOM．

### 3、自定义对象

JavaScript的自定义对象是通过函数实现的, 这种用于创建对象的函数称为构造函数, 和普通函数的区别在于构造函数通过new来调用, 且构造时就直接运行, 如:

``` javascript
function Person(name, age) {
    this.age = age;
    this.name = name;
}
var per = new Person('Jack', 12);
```

Person被new调用时, this指的是创建的对象, 这里是per. 且per的typeof per结果就为Person了.

也可以在构造函数中创建方法, 如:

``` javascript
function Person() {
    this.name = 'Jack';
    this.getName = function() {
        return this.name;
    }
}
```

但这样的话, 每创建一个实例就会创建一个方法, 耗费内存.

#### a、原型对象

JavaScript的每一个函数, 解析器都会向其中添加一个属性<span id="prototype">prototype</span>, 该属性是一个对象. 对于普通函数而言, 该对象作用不大; 而对于构造函数而言, 该对象相对于Java类的父类, 该对象的属性和方法所有通过该构造方法创建的实例都会拥有, 相对于一个公共区域. 如:

``` javascript
function Person(name, age) {
    this.name = name;
    this.age = age;
}
Person.prototype.getName = function() {
    return this.name;
}
var person = new Person('Jack', 12);
console.log(person.getName());
```

如果在对象自身Person里存在和Person.prototype里一样名称的属性, 则以Person的覆盖调Person.prototype的.

> 小知识点: 原型对象还有其原型对象, 直到Object对象的原型, Object的原型没有原型.

### 4、创建对象及使用

和Java差不多, 使用new关键字来创建一个对象, 如:

``` javascript
var obj = new Object();
```

也可以使用对象字面量, 如下方式创建对象:

``` javascript
var obj = {
    name: "Jack",
    "age": 12
};
```

而向对象添加属性则有点像python, 直接赋值即可, 如:

``` javascript
obj.name = "Jack";
obj.gender = "man";
obj["age"] = 13;
```

和python一样, 删除对象属性则是使用delete关键字, 如:

``` javascript
delete obj.name
```

> in运算符: 检查对象中是否含有指定的属性, 如:
>
>  

``` javascript
> "age" in obj; >
```

### 5、引用类型

对象属于引用数据类型, 和c++的引用类型一样, 如:

``` javascript
var x = new Object();
var y = x;
x.name = "Jack";
console.log(y.name)
```

会输出 `Jack` .

### 6、对象的比较

1. 对对象使用\==符号,所比较的是对象指向的堆内存地址

### 7、方法的创建

JS的函数可以和属性值一样直接赋给类的属性, 如:

``` javascript
var obj = new Object();
obj.name = '';
obj.setName = function(name) {
    if ('name' in obj) {
        obj.name = name;
        return true;
    }
    return false;
}
```

和Java一样, JavaScript调用函数方法得先new一个对象, 然后调用, 如:

``` javascript
obj.setName('Jack');
```

### 8、遍历对象的属性

利用for...in循环来遍历对象的属性, 如:

``` javascript
var obj = {
    name: 'Jack',
    age: 12
};
for (var i in obj)
    console.log(obj[i]);
```

结果是 `Jack 12` .==这里不能采用obj.i这种形式.==

### 9、垃圾回收

JavaScript有自动回收设置, 你想要让系统回收一个对象, 只需将该对象指向null即可, 如:

``` javascript
var x = new Object();
x = null;
```

### 10、Date对象

Date是一个日期对象, 创建方式为:

``` javascript
var d = new Date();
```

若不指定, 则初始值为执行该代码时的时间, 也可以选择指定时间, 如:

``` javascript
var d = new Data("12/3/2016 11:30");
```

#### a、getDate()/getDay()/getMonth()/getFullYear()方法

getDate()方法获取对象的日期, 如10月20日则返回20

``` javascript
var d = new Date("12/03/2016 11:10:30");
var Data = d.getDate();
console.log(Data);
```

getDay()获取对象是周几, 如今天是周五, 则返回5(周日用0表示), 如:

``` javaScript
var d = new Date("12/03/2016 11:10:30");
var Data = d.getDay();
console.log(Data);
```

getMonth()获取对象的月份, 会返回0-11的值, 0表示一月, 以此类推, 如:

``` javascript
var d = new Date("12/03/2016 11:10:30");
var Data = d.getMonth();
console.log(Data);
```

还有获取小时/分钟/秒/毫秒等方法, 都是一样的用法.

## 七、函数

函数也是个对象, 在JS中除了基本数据类型外全都是对象.

### 1、创建函数

函数对象可以由Function类创建, 如:

``` javascript
var fun = new Function("console.log('Hello'); ");
```

但一般使用第二种也即和python语言类似的方式, 如:

``` javascript
function fun(a, b) {
    console.log(a, b);
    return a + b;
}
```

还可以创建一个匿名函数, 如:

``` javascript
function(a, b) {
    return a + b;
}
```

### 2、调用函数

和C语言一样, 函数的调用如:

``` javascript
var c = fun(12, 34);
```

<span style="color:red; font-weight:bold">注意</span>: 函数的参数和返回值可以是任意值.

> 在调用函数时, 实参的个数和形参可以不匹配. 如果实参少了, 则剩下的形参就是undefined; 如果实参多了, 多余的实参被舍弃.

还有一种特殊的函数调用形式: 立即执行函数, 如:

``` javascript
(function(a, b) {
    console.log(a, b);
})(12, 34);
```

### 3、this

解析器在调用函数时都会传递一个隐含参数this. 和c++一样this是调用函数的上级对象. 如:

``` javascript
function fun() {
    if ('name' in this)
        console.log(this.name);
}
var obj = {
    name: 'Jack',
    getName: fun
};
obj.getName();
```

### 4、函数的方法

#### a、call/apply

**`call()`** 方法使用一个指定的 `this` 值和单独给出的一个或多个参数来调用一个函数.

> **注意:**call()方法的语法和作用与 [ `apply()` ](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/apply) 方法类似, 只有一个区别, 就是 `call()` 方法接受的是**一个参数列表**, 而 `apply()` 方法接受的是**一个包含多个参数的数组**.

``` javascript
function.call([thisArg], arg1, arg2, ...)
```

thisArg: 指定的this值, 可选, 默认是函数本身的this.

这两个方法一般用于调用父构造函数, 如:

``` javascript
function Product(name, price) {
    this.name = name;
    this.price = price;
}

function Food(name, price) {
    Product.call(this, name, price);
    this.category = 'food';
}

function Toy(name, price) {
    Product.call(this, name, price);
    this.category = 'toy';
}

var cheese = new Food('feta', 5);
var fun = new Toy('robot', 40);
```

#### b、arguments

arguments是一个传递给函数的参数的类对象数组, 如:

``` javascript
function func1(a, b, c) {
    console.log(arguments[0]);
    // expected output: 1

    console.log(arguments[1]);
    // expected output: 2

    console.log(arguments[2]);
    // expected output: 3
}
func1(1, 2, 3);
```

arguments对象是所有(非箭头)函数中都可用的**局部变量**. 你可以使用`
arguments `对象在函数中引用函数的参数. 此对象包含传递给函数的每个参数, 第一个参数在索引0处. 例如, 如果一个函数传递了三个参数, 你可以以如下方式引用他们:

`
``
javascript
arguments[0]
arguments[1]
arguments[2]

``` 

参数也可以进行设置:

``` javascript
arguments[1] = 'new value';
```

arguments是一个类数组元素, 数组有的属性它基本都有, 如:length等.arguments接收的是实参, 即使你不定义形参, 也可以通过arguments
来引用实参, 如:

``` javascript
function fun() {

    console.log(arguments[0]);

}
fun("Hello", 12);
```

会输出 `Hello ` .
<span style="color:red">注意</span>:arguments只与实参有关.

## 八、作用域

### 1、全局作用域

直接写在函数外部的变量默认存储在全局作用域中, 在全局作用域中存在一个全局对象window, 所有的全局变量都会作为window的属性保存, 而创建的函数则会做为window的方法保存.

函数可以访问全局变量.

### 2、局部作用域

在函数中定义的变量就属于局部作用域, 从外部不能访问. 但要注意如果在函数中没有使用var关键字声明变量则该变量会被当初全局变量, 如:

``` javascript
function fun() {
    d = 10;
}
console.log(d);
```

这个访问依然是就近原则.

## 九、数组

### 1、创建数组

数组在JavaScript中也是一个对象, 也是通过new来创建, 如:

``` javascript
var arr = new Array(1, 2, 3); //创建数组元素为1, 2, 3的数组
var arr2 = new Array(10); //创建一个长度为10的数组
arr[0] = 10;
```

如果读取还没有定义的下标, 并不会报错, 而是返回undefined.

还可以使用[]方式创建数组, 如:

``` javascript
var arr = [1, 2, 3];
```

和python的列表一样, JavaScript的数组也可以放任意类型的数组, 如:

``` javascript
var obj = new Object();
var arr = [obj, "123", 1, {
        name: "Jack",
        age: 12
    }, function() {
        console.log("Hello")
    },
    [1, 2, 3]
];
```

### 2、属性

#### a、length

获取数组长度, 也即元素个数. 但其原理是返回最大索引. 这和JavaScript的创建方式有关, 如果索引过大, 则解析器会为其预留空间. 且其值可以设置, 如果设置小, 则会舍弃一些原本的值; 设置大了, 则会预留空间.

这个属性可以用于给数组添加最后一个元素, 如:

``` javascript
var arr = new Array();
arr[0] = 10;
arr[arr.length] = 1;
```

### 3、方法

#### a、push

向数组末尾添加一个或多个元素, 并返回数组的新长度. 如:

``` javascript
var arr = [1, 2, 3];
arr.push("Jack", "Hello");
```

#### b、pop

删除数组的最后一个元素, 并返回这个元素. 如:

``` javascript
var arr = [1, 2, 3];
var x = arr.pop();
```

#### c、shift/unshift

在数组开头删除/添加一个元素/一个或多个元素, 返回被删的元素或新长度. 如:

``` javascript
var arr = [1, 2, 3];
arr.shift();
arr.unshift("Jack", 12);
```

#### d、slice

``` javascript
arr.slice([begin[, end]])
```

slice方法返回一个新的数组对象, 这一对象是一个由 `begin` 和 `end` 决定的原数组的**浅拷贝**(包括 `begin` , 不包括 `end` ). 原始数组不会被改变.

和python一样可以为负数, 负数表示倒数第几个.

#### e、splice

``` javascript
array.splice(start[, deleteCount[, item1[, item2[, ...]]]])
```

**`splice()`** 方法通过删除或替换现有元素或者原地添加新的元素来修改数组, 并以数组形式返回被修改的内容. 此方法会改变原数组. 返回被删除的元素组成的数组.

start: 必选. 表示开始操作的位置

deleteCount: 可选. 表示要删除的元素个数

item...: 可选. 表示要添加的元素, 从start开始添加

#### f、concat

``` javascript
var new_array = old_array.concat(value1[, value2[, ...[, valueN]]])
```

`concat()` 方法用于合并两个或多个数组. 此方法不会更改现有数组, 而是返回一个新数组. 这里是将所有数组的浅拷贝组合成为一个新的数组.

#### g、join

``` javascript
arr.join([separator])
```

`join()` 方法将一个数组(或一个[类数组对象](https://developer.mozilla.org/zh-CN//docs/Web/JavaScript/Guide/Indexed_collections#Working_with_array-like_objects))的所有元素连接成一个字符串并返回这个字符串. 如果数组只有一个项目, 那么将返回该项目而不使用分隔符. 如:

``` javascript
var arr = [1, 2, 3];
var str = arr.join("H");
```

这将输出 `1H2H3H` .

separator:**指定一个字符串来分隔数组的每个元素. 如果需要, 将分隔符转换为字符串. 如果缺省该值, 数组元素用逗号( `,` )分隔. 如果 `separator` 是空字符串( `""` ), 则所有元素之间都没有任何字符.**

#### h、find/findIndex

``` javascript
arr.find(callback[, thisArg])
```

`find()` 方法返回数组中满足提供的测试函数的<span style="color:red">第一个</span>元素的值. 否则返回 [ `undefined` ](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/undefined).

callback: 回调函数, 传入的三个参数和forEach一样.

``` javascript
arr.findIndex(callback[, thisArg])
```

`findIndex` 方法返回数组中满足提供的测试函数的第一个元素的**索引**. 若没有找到对应元素则返回-1.

#### j、sort

``` javascript
arr.sort([compareFunction])
```

compareFunction: 用于指定比较依据的函数, 有两个参数:

* firstE1: 第一个用于比较的元素
* firstE2: 第二个用于比较的元素
* 返回值: 如果大于0则交换位置E2会排在E1之前, 小于0则E1排在E2之前.
* 默认值是将元素转换为字符串, 按Unicode顺序进行排序
* 且会改变数组的顺序, 原地排序

比如想要对数字排序, 如:

``` javascript
var arr = [1, 3, 1, 34];
arr.sort(function(a, b) {
    return a - b;
})
```

### 4、遍历数组

#### a、for循环

和C语言一样利用for/while循环来遍历数组

#### b、forEach()方法

数组对象的原型对象有一个默认方法forEach, 让所有的元素遍历一遍所提供的函数, 如:

``` javascript
var arr = [1, 2, 3];
arr.forEach(
    function(value, index, obj) {
        console.log(value);
    }
)
```

结果为 `1 2 3` .

函数参数可以接收三个参数1, 2, 3:

1. 第一个参数表示,数组所有元素的值
2. 第二个参数是数组元素的索引,0,1,2...等等
3. 第三个是正在遍历的数组对象

## 附录知识点

### 1、输出Unicode符号

使用\\u来输出, 如:

``` javascript
console.log("\u2620");
```

输出为:&#9760; . 在html中可以使用&\#; 加十进制编码, js中是十六进制, 如:&\#9760; (&#9760; ).

### 2、var声明变量的特点

采用var声明的变量, 不管其在哪里声明的, 都会预先声明, 如:

``` javascript
console.log(x);
var x = 2;
```

会输出 `undefined` 而不是报错. 这就相当于:

``` javascript
var x;
console.log(x);
x = 2;
```

函数声明也是一样, 如

``` javascript
fun();

function fun() {
    alert("Hello");
}
```

### 3、instanceof运算符

判断一个对象是否是一个类的实例, 如:

``` javascript
function Person(name, age) {
    this.age = age;
    this.name = name;
}
var per = new Person('Jack', 12);
console.log(per instanceof Person);
```

这个运算符如果是判断祖先类, 也会返回true.

### 4、in/hasOwnProperty

in是检查对象自身或其[原型对象](#prototype)中是否存在某属性.

而hasOwnProperty函数则是检查对象自身是否存在某属性, 如:

``` javascript
obj.hasOwnProperty('name');
```
