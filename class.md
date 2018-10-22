# Java Class

## 变量
没有声明符，变量具有限定符

### 限定符
`final`：限定变量“不可变”  
`static`  

### 访问修饰符
`public`：所有类可见  
`protected`:   
`default`： 默认，同一包内可见  
`private`, ``  

## 类/对象
```java
/**
 * file: Example.java
 */
public class Example {
  // 类变量 / 静态变量；必须为static；具有默认值
  // 通常与final配合，用于声明常量
  static String versioin = "v.3.0.1";
  
  // 成员变量 / 实例变量；具有默认值
  String name;
  int age; // 默认值 0
  
  // 构造方法、与类同名、可省略、可有多个
  public Example (String arg) {
    // 局部变量；必须先声明、再初始化（无默认值），才能使用
    int loop; // 声明
    loop = 32; // 初始化 / 赋值
    
    // 非静态方法中，可以不用this或super
    this.name = arg;
    System.out.println(age); // output: 0
  }
}
```

## package 包
```java
import 
```