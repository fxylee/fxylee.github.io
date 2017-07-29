# Simple Assignment (=) 简单赋值运算符
[ECMA规范解释](http://www.ecma-international.org/ecma-262/5.1/#sec-11.13.1)
> The production AssignmentExpression : LeftHandSideExpression = AssignmentExpression is evaluated as follows: 
>  
> 1.	Let lref be the result of evaluating LeftHandSideExpression.  
> 2.	Let rref be the result of evaluating AssignmentExpression.
> 3.	Let rval be GetValue(rref).  
> 4.	Throw a SyntaxError exception if the following conditions are all true:
	- Type(lref) is Reference is true
	- IsStrictReference(lref) is true
	- Type(GetBase(lref)) is Environment Record
	- GetReferencedName(lref) is either "eval" or "arguments"
> 5. Call PutValue(lref, rval).
> 6. Return rval.

## 大概意思...
`LeftHandSideExpression`：左手边表达式；

`AssignmentExpression`：赋值表达式；

1. 使左侧引用（`lref`）指向左手边表达式的计算结果（大概是字面量结果）
2. 使右侧引用（`rref`）指向赋值表达式的计算结果
3. 求`rref`的值，并分配给返回变量`rval`？
4. 以下情况抛出语法错误`SyntaxError`
	- ...
5. 使左侧引用`lref`指向右侧引用`rref`
6. 返回返回变量`rval`

## 那么...result
赋值语句是先计算`=`左边，再计算`=`右边，最后返回**返回引用`rval`**。

```javascript
a = 3; // 赋值语句
// 变量表达式 = 常量表达式
// step1: lref === 变量a值的引用
// step2: rref === 常量3的引用
// step3: rval === 3；（getValue对原始值直接返回，引用值为其地址？）
// step6: return rval

// 第二步之后，= 两侧都不再是原始“表达式”，而是其计算结果的内存引用，所以...

let foo = {x: 3};
let bar = foo;
foo.x = foo = 10;
// 所以bar依然是原对象，且bar.x = 10，而foo = 10
// 因为第一个=在第二步之后不再是foo.x这个变量的指引，而是其值的的内存区块的引用

// 计算步骤是：{}表示该侧已计算出表达式计算结果
// step1: {foo.x} = (foo = 10)
// step2.1: {foo.x} = ({foo} = 10)
// step2.2: {foo.x} = ({foo} = {10})
// step2.6: {foo.x} = ({10}) ...后，第一个=右侧赋值语句已返回，但rref依然为()表达式，值未出
// step2: {foo.x} = {10} 已计算出第一个=右边的引用rref
// step6: ...后，返回第一个赋值语句的返回变量rval {10}
```
