# class

```javascript
// 定义class，命名为MyClass，且继承自Super
// typeof MyClass === 'function'，class只是ES5中构造函数的语法糖，依然是基于原型的面向对象

// 只有通过this显示声明的才是对象自身的属性和方法，否则为原型的属性和方法

// class表示实例/类的原型对象，class里面的this表示实例自身
// class不同实例的原型为同一个对象的引用

// class没有变量提升（hoist），子类必须在父类之后定义

// 自类实例是对父类实例的再加工；子类是对父类的复写，会覆盖父类定义的方法
class MyClass extends Super {

  // class的构造函数，但为原型的方法，若省略则表示默认为一个空的函数
  // MyClass.prototype.constructor
  // 在通过new关键字实例化时，自动调用
  constructor() {
    // 函数内部具备new对象（包括ES5函数），该对象的target属性
    // 在constructor通过new方式调用时，指向class自身（子类）；作为普通函数调用时，为undefined
    new.target === Super; // true
  
    // 子类的构造函数必须在其调用this关键字之前调用super()，除非子类不复写constructor函数
    // 否则报ReferenceError，因为默认的空的constructor会自动调用super()；只限constructor
    // 子类不具备自己的this属性...why ?
    // 因为子类的实例化机制是：先实例化父类，将父类实例赋值给子类构造函数的this
    // 不调用super()函数就不存在赋值语句，this将会为undefined？
    super();
  
    // 定义对象自身的属性
    this.foo = 1;
    
  } // 不需要,分隔
  
  // 定义public方法，依然为原型的方法
  // 不可枚举：类内部定义的所有方法都不可枚举
  foo() {
    // 子类可通过super对象调用父类的方法
    super.baz();
  }
  
  // 覆盖类的原型的原型的方法，原型的原型继承自 new Object();
  // MyClass.prototype.__proto__.constructor === Object
  toString() {
  }
  
  // 静态方法：只可通过类名调用，不可通过实例调用；但可被子类继承
  // 静态方法之间通过this调用，常规方法中只能通过类名调用：this.constructor.func
  static func(){
  }
  
  // 定义静态属性，ES7支持
  attr = 'color: red';
}

// 实例化类必须使用new关键字，class禁止以普通函数方式（或call）调用，否则报TypeError
// 有参数必须带括号
const instance = new MyClass();

MyClass.name === 'MyClass';
```

## class表达式
```javascript
// Me指向class自身，也是class的原型对象
// Me变量只可在class内部调用，外部调用报未定义、引用错误
// 类名为MyClass，Me不是类名
// Me可省略
const MyClass = class Me {
  baz() {
  }

  constructor() {

    console.log(Me.toString); // function toString() { [native code] }
    
    // 原型方法的定义类似函数表达式，不存在变量提升，因此不可通过Me调用？
    console.log(Me.baz); // undefined
    console.log(Me.bar); // undefined
  }
  
  bar(){
    //
  }
};
```
## 立即执行类表达式
```javascript
const instance = new class {
  construtor() {
   //
  }
}();
```

## class的ES5实现
```javascript
// 构造函数
function MyClass(){
  this.foo = 1;
}

MyClass.prototype = {
  // 定义构造函数[属性]方法，指向构造函数自身
  // JS环境自身实现
  // construcotr: MyClass,
  
  // 复写原型方法
  toString: function(){
    //
  }
}
```

## class与ES5实现的不同
1. class可继承原生“类”，例如：`Array`，ES5不行
2. 一个class只能继承一个类，不能实现多重继承
3. ES5的构造函数具备`hoist`，但class不具备，虽然class也是一个“特殊的函数”
4. class体内部不能定义原型属性，只能通过`prototype`的方式实现
5. ES5的“构造函数”可以覆盖（多次赋值），class的`constructor`只能出现一次，class自身也只能声明一次，否则`SyntaxError`
6. ES5的静态方法只能定义在“外部”，class的静态方法要求定义在class体内部

## 参考链接
1. [Class 的基本语法 - 阮一峰](http://es6.ruanyifeng.com/#docs/class)
2. [类 - MDN](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Classes)