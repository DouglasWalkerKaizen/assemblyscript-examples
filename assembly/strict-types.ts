// There is no any or undefined:

// 😢
function foo(a?) {
  var b = a + 1;
  return b;
}

// 😊
function foo(a: i32 = 0): i32 {
  var b = a + 1;
  return b;
}

// There are no union types yet, but a similar effect can be achieved with generics:

// 😢
function foo(a: i32 | string): void {}

// 😊
function foo<T>(a: T): void {}

// Objects must be typed, say using a Map or class:

// 😢
var a = {};
a.prop = "hello world";

// 😊
var a = new Map<string, string>();
a.set("prop", "hello world");

// 😊
class A {
  constructor(public prop: string) {}
}
var a = new A("hello world");

// And nullability checks are limited to locals to guarantee soundness where TypeScript would not diagnose a problem:

function doSomething(foo: Foo): void {
  // 😢
  if (foo.something) {
    foo.something.length; // fails
  }
}

function doSomething(foo: Foo): void {
  // 😊
  var something = foo.something;
  if (something) {
    something.length; // works
  }
}
