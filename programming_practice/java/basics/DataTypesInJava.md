### Primitive Data Types

| Data Type | Description                            | Size    | Range                                       | Default Value | Example                       |
| --------- | -------------------------------------- | ------- | ------------------------------------------- | ------------- | ----------------------------- |
| `byte`    | 8-bit signed integer                   | 1 byte  | -128 to 127                                 | 0             | `byte myByte = 100;`          |
| `short`   | 16-bit signed integer                  | 2 bytes | -32,768 to 32,767                           | 0             | `short myShort = 5000;`       |
| `int`     | 32-bit signed integer                  | 4 bytes | -2^31 to 2^31-1                             | 0             | `int myInt = 100000;`         |
| `long`    | 64-bit signed integer                  | 8 bytes | -2^63 to 2^63-1                             | 0L            | `long myLong = 10000000000L;` |
| `float`   | Single-precision 32-bit floating point | 4 bytes | Approximately ±3.4E+38 (6-7 decimal digits) | 0.0f          | `float myFloat = 5.75f;`      |
| `double`  | Double-precision 64-bit floating point | 8 bytes | Approximately ±1.8E+308 (15 decimal digits) | 0.0d          | `double myDouble = 19.99;`    |
| `char`    | Single 16-bit Unicode character        | 2 bytes | '\u0000' to '\uffff'                        | '\u0000'      | `char myChar = 'A';`          |
| `boolean` | Represents one bit of information      | 1 bit   | `true` or `false`                           | `false`       | `boolean myBool = true;`      |

### Non-Primitive Data Types

| Data Type   | Description                                                                                                                                 | Example                                      |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------- |
| `String`    | A sequence of characters                                                                                                                    | `String myString = "Hello, World!";`         |
| `Array`     | A container object that holds a fixed number of values of a single type                                                                     | `int[] myArray = {1, 2, 3, 4, 5};`           |
| `Class`     | A blueprint for creating objects                                                                                                            | `class MyClass { int x; }`                   |
| `Object`    | An instance of a class                                                                                                                      | `MyClass myObj = new MyClass();`             |
| `Interface` | A reference type, similar to a class, that can contain only constants, method signatures, default methods, static methods, and nested types | `interface MyInterface { void myMethod(); }` |

### Example of Non-Primitive Data Types

#### String

```java
String myString = "Hello, World!";
```

#### Array

```java
int[] myArray = {1, 2, 3, 4, 5};
```

#### Class

```java
class MyClass {
    int x;
    MyClass(int val) {
        x = val;
    }     
}
```

#### Object

```java
MyClass myObj = new MyClass(5);
```

#### Interface

```java
interface MyInterface {
    void myMethod();
}

class MyClass implements MyInterface {
    public void myMethod() {
        System.out.println("Hello from MyClass");
    }
}
```
