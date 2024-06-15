### 1. Setting Up Your Environment

Before you start coding, you need to set up your development environment.

#### Step 1: Install Java Development Kit (JDK)

Download the latest JDK from the [Oracle website](https://www.oracle.com/java/technologies/javase-downloads.html) or use OpenJDK from [AdoptOpenJDK](https://adoptopenjdk.net/). Follow the installation instructions specific to your operating system.

#### Step 2: Install an Integrated Development Environment (IDE)

Popular IDEs for Java include IntelliJ IDEA, Eclipse, and NetBeans. You can also use a simple text editor like VS Code or Sublime Text.

### 2. Writing Your First Java Program

Let's write a simple "Hello, World!" program.

#### Step 1: Create a New Java File

1. Open your IDE or text editor.
2. Create a new file named `HelloWorld.java`.

#### Step 2: Write the Code

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

#### Step 3: Compile and Run the Program

1. Open your terminal or command prompt.
2. Navigate to the directory where your `HelloWorld.java` file is located.
3. Compile the program using the following command:

    ```sh
    javac HelloWorld.java
    ```

4. Run the compiled program using the following command:

    ```sh
    java HelloWorld
    ```

You should see the output:

```plaintext
Hello, World!
```

### 3. Basic Concepts

#### Variables and Data Types

In Java, you need to declare a variable with a specific data type.

```java
public class VariablesExample {
    public static void main(String[] args) {
        // Primitive data types
        int myNum = 5;              // Integer
        double myDouble = 5.99;     // Floating point number
        char myChar = 'D';          // Character
        boolean myBool = true;      // Boolean

        // Non-primitive data types
        String myString = "Hello";  // String

        System.out.println(myNum);
        System.out.println(myDouble);
        System.out.println(myChar);
        System.out.println(myBool);
        System.out.println(myString);
    }
}
```

#### Control Structures

Control structures include if-else statements, loops, and switch statements.

**If-Else Statement**

```java
public class IfElseExample {
    public static void main(String[] args) {
        int x = 20;

        if (x > 10) {
            System.out.println("x is greater than 10");
        } else {
            System.out.println("x is less than or equal to 10");
        }
    }
}
```

**For Loop**

```java
public class ForLoopExample {
    public static void main(String[] args) {
        for (int i = 0; i < 5; i++) {
            System.out.println("i is: " + i);
        }
    }
}
```

**While Loop**

```java
public class WhileLoopExample {
    public static void main(String[] args) {
        int i = 0;
        while (i < 5) {
            System.out.println("i is: " + i);
            i++;
        }
    }
}
```

**Switch Statement**

```java
public class SwitchExample {
    public static void main(String[] args) {
        int day = 3;
        switch (day) {
            case 1:
                System.out.println("Monday");
                break;
            case 2:
                System.out.println("Tuesday");
                break;
            case 3:
                System.out.println("Wednesday");
                break;
            default:
                System.out.println("Other day");
                break;
        }
    }
}
```

### 4. Object-Oriented Programming

Java is an object-oriented programming language, which means it uses classes and objects.

**Class and Object**

```java
class Dog {
    String name;
    int age;

    // Constructor
    public Dog(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // Method
    public void bark() {
        System.out.println(name + " is barking");
    }
}

public class Main {
    public static void main(String[] args) {
        // Create an object of the Dog class
        Dog myDog = new Dog("Buddy", 3);

        // Access object properties
        System.out.println(myDog.name);
        System.out.println(myDog.age);

        // Call object method
        myDog.bark();
    }
}
```

### 5. Conclusion

This guide covers the very basics of Java, including setting up your environment, writing a simple program, and understanding basic concepts such as variables, control structures, and object-oriented programming. As you progress, you can dive deeper into more advanced topics like exception handling, collections, streams, and concurrency.

Keep practicing by writing more code and exploring Java's rich set of libraries and frameworks. Happy coding!