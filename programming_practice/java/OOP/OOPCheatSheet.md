Object-Oriented Programming (OOP) is a programming paradigm centered around objects rather than actions. Java, as an object-oriented programming language, strongly supports OOP concepts. Here’s a detailed overview of OOP in Java, including its principles and features.

## Principles of OOP

There are four main principles of Object-Oriented Programming:

1. **Encapsulation**
2. **Inheritance**
3. **Polymorphism**
4. **Abstraction**


Sure! Here's a detailed differentiation of the four main principles of Object-Oriented Programming (OOP) in a tabular format without code:

### Principles of OOP in Java

| Principle       | Description                                                                                                     | Key Features                                                                                     |
|-----------------|-----------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Encapsulation** | Encapsulation is the bundling of data (variables) and methods that operate on the data into a single unit (class). It restricts direct access to some of the object's components, which is a means of preventing unintended interference and misuse of the methods and data. | - Hides the internal state of the object.<br>- Accessed through public methods.<br>- Protects object integrity.<br>- Improves modularity by providing controlled access. |
| **Inheritance**   | Inheritance is a mechanism wherein a new class inherits the properties and behaviors (fields and methods) of an existing class. It promotes code reusability. | - Base (super/parent) class and derived (sub/child) class.<br>- Allows method overriding.<br>- Supports hierarchical classification.<br>- Reduces redundancy and promotes code reuse. |
| **Polymorphism**  | Polymorphism allows methods to do different things based on the object it is acting upon, even though they share the same name. It means "many forms". | - Method overloading (compile-time polymorphism).<br>- Method overriding (runtime polymorphism).<br>- Promotes flexibility and reusability.<br>- Improves the interface of the code by allowing one interface to be used for a general class of actions. |
| **Abstraction**   | Abstraction is the concept of hiding the complex implementation details and showing only the essential features of the object. It helps in reducing programming complexity and effort. | - Abstract classes and interfaces.<br>- Focus on what an object does instead of how it does it.<br>- Promotes the use of abstract classes and interfaces to define common interfaces for multiple implementations.<br>- Simplifies code by reducing complexity. |



### 1. Encapsulation

Encapsulation is the mechanism of wrapping the data (variables) and the code (methods) together as a single unit. In encapsulation, the variables of a class are hidden from other classes and can be accessed only through the methods of their current class. This is also known as data hiding.

#### Example

```java
public class Person {
    private String name; // private variable

    // public getter method
    public String getName() {
        return name;
    }

    // public setter method
    public void setName(String newName) {
        name = newName;
    }
}

public class Main {
    public static void main(String[] args) {
        Person myPerson = new Person();
        myPerson.setName("John");
        System.out.println(myPerson.getName());
    }
}
```

### 2. Inheritance

Inheritance is a mechanism wherein a new class is derived from an existing class. The new class, called the derived (or child) class, inherits attributes and behaviors (methods) from the base (or parent) class.

#### Example

```java
class Animal {
    void eat() {
        System.out.println("This animal eats food.");
    }
}

class Dog extends Animal {
    void bark() {
        System.out.println("The dog barks.");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog myDog = new Dog();
        myDog.eat(); // inherited method
        myDog.bark(); // own method
    }
}
```

### 3. Polymorphism

Polymorphism means "many forms" and it allows one interface to be used for a general class of actions. The specific action is determined by the exact nature of the situation. There are two types of polymorphism in Java: compile-time polymorphism (method overloading) and runtime polymorphism (method overriding).

#### Method Overloading (Compile-time Polymorphism)

```java
class MathOperations {
    // Method with 2 integer parameters
    int add(int a, int b) {
        return a + b;
    }

    // Method with 3 integer parameters
    int add(int a, int b, int c) {
        return a + b + c;
    }
}

public class Main {
    public static void main(String[] args) {
        MathOperations mo = new MathOperations();
        System.out.println(mo.add(5, 10)); // Calls the first add method
        System.out.println(mo.add(5, 10, 15)); // Calls the second add method
    }
}
```

#### Method Overriding (Runtime Polymorphism)

```java
class Animal {
    void sound() {
        System.out.println("Animal makes a sound");
    }
}

class Dog extends Animal {
    void sound() {
        System.out.println("Dog barks");
    }
}

public class Main {
    public static void main(String[] args) {
        Animal myAnimal = new Dog();
        myAnimal.sound(); // Calls the Dog's sound method
    }
}
```

### 4. Abstraction

Abstraction is the process of hiding the implementation details and showing only the functionality to the user. In Java, abstraction is achieved using abstract classes and interfaces.

#### Abstract Class

```java
abstract class Animal {
    abstract void makeSound(); // abstract method

    void eat() {
        System.out.println("This animal eats food.");
    }
}

class Dog extends Animal {
    void makeSound() {
        System.out.println("Dog barks");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog myDog = new Dog();
        myDog.makeSound();
        myDog.eat();
    }
}
```

#### Interface

```java
interface Animal {
    void makeSound(); // abstract method
}

class Dog implements Animal {
    public void makeSound() {
        System.out.println("Dog barks");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog myDog = new Dog();
        myDog.makeSound();
    }
}
```

## Additional Features of OOP in Java

### Classes and Objects

- **Class**: A blueprint for creating objects. It contains fields (attributes) and methods to define behaviors.
- **Object**: An instance of a class.

#### Example

```java
class Car {
    // Fields
    String color;
    String model;

    // Method
    void drive() {
        System.out.println("The car is driving");
    }
}

public class Main {
    public static void main(String[] args) {
        // Creating an object of the Car class
        Car myCar = new Car();
        myCar.color = "Red";
        myCar.model = "Toyota";
        myCar.drive();
        System.out.println("Car model: " + myCar.model + ", color: " + myCar.color);
    }
}
```

### Constructors

Constructors are special methods that are called when an object is instantiated. They initialize the object's state.

#### Example

```java
class Car {
    String color;
    String model;

    // Constructor
    Car(String color, String model) {
        this.color = color;
        this.model = model;
    }

    void display() {
        System.out.println("Car model: " + model + ", color: " + color);
    }
}

public class Main {
    public static void main(String[] args) {
        Car myCar = new Car("Blue", "Ford");
        myCar.display();
    }
}
```

### Access Modifiers

Java provides four types of access modifiers to set access levels for classes, variables, methods, and constructors.

1. **private**: Accessible only within the declared class.
2. **default**: Accessible only within the same package. (No keyword required)
3. **protected**: Accessible within the same package and subclasses.
4. **public**: Accessible from any other class.

#### Example

```java
class Test {
    private int data = 40;

    private void display() {
        System.out.println("Hello World");
    }
}

public class Main {
    public static void main(String[] args) {
        Test obj = new Test();
        // obj.data = 50; // Compile Time Error
        // obj.display(); // Compile Time Error
    }
}
```

### Conclusion

Object-Oriented Programming in Java is a powerful way to organize and manage complex software systems. By understanding and applying the principles of encapsulation, inheritance, polymorphism, and abstraction, you can write more modular, reusable, and maintainable code. As you become more comfortable with these concepts, you'll be able to leverage the full power of Java's OOP capabilities.
