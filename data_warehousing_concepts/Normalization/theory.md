# Introduction

- Normalization is the process of organizing the data in the database.
- Normalization is used to minimize the redundancy from a relation or set of relations. It is also used to eliminate undesirable characteristics like Insertion, Update, and Deletion Anomalies.
- Normalization divides the larger table into smaller and links them using relationships.
- The normal form is used to reduce redundancy from the database table.

# Normal Forms

1. First Normal Form (1NF): **Atomicity**
2. Second Normal Form (2NF): **Partial Dependency**
3. Third Normal Form (3NF): **Transitive Dependency**
4. Boyce-Codd Normal Form (BCNF): **Transitive Dependency w super key**
5. Fourth Normal Form (4NF): **Independence**
6. Fifth Normal Form (5NF): **Decomposition**

# Why do we need Normalization?

The main reason for normalizing the relations is removing these anomalies. Failure to eliminate anomalies leads to data redundancy and can cause data integrity and other problems as the database grows. Normalization consists of a series of guidelines that helps to guide you in creating a good database structure.

Data modification anomalies can be categorized into three types:

- Insertion Anomaly: Insertion Anomaly refers to when one cannot insert a new tuple into a relationship due to lack of data.
- Deletion Anomaly: The delete anomaly refers to the situation where the deletion of data results in the unintended loss of some other important data.
- Updatation Anomaly: The update anomaly is when an update of a single data value requires multiple rows of data to be updated.


# First Normal Form (1NF)

**Definition**: A table is in 1NF if:

- All entries in a column are of the same data type.
- Each column contains atomic values (indivisible).
- Each row is unique, often ensured with a primary key. (debatable)

- A relation will be 1NF if it contains an atomic value.
- It states that an attribute of a table cannot hold multiple values. It must hold only single-valued attribute.
- First normal form disallows the multi-valued attribute, composite attribute, and their combinations.

**Example**:

**Unnormalized Table**:
| StudentID | Name | Courses |
|-----------|------------|------------------|
| 1 | Alice | Math, Science |
| 2 | Bob | History |
| 3 | Charlie | Math, History |

**Issues**: The `Courses` column contains multiple values (not atomic).

**1NF Table**:
| StudentID | Name | Course |
|-----------|--------|----------|
| 1 | Alice | Math |
| 1 | Alice | Science |
| 2 | Bob | History |
| 3 | Charlie| Math |
| 3 | Charlie| History |

# Second Normal Form (2NF)

**Definition**: A table is in 2NF if:

- It is in 1NF.
- All non-key attributes are fully functionally dependent on the primary key (no partial dependencies).

**Example**:

**1NF Table** (from the previous example):
| StudentID | Course | Instructor |
|-----------|----------|------------|
| 1 | Math | Prof. A |
| 1 | Science | Prof. B |
| 2 | History | Prof. C |
| 3 | Math | Prof. A |
| 3 | History | Prof. C |

**Issues**: `Instructor` depends only on `Course`, not on the entire composite key (`StudentID`, `Course`).

**2NF Tables**:

**Table 1: StudentCourses**
| StudentID | Course |
|-----------|----------|
| 1 | Math |
| 1 | Science |
| 2 | History |
| 3 | Math |
| 3 | History |

**Table 2: CourseInstructors**
| Course | Instructor |
|----------|------------|
| Math | Prof. A |
| Science | Prof. B |
| History | Prof. C |

# Third Normal Form (3NF)

**Definition**: A table is in 3NF if:

- It is in 2NF.
- There are no transitive dependencies (non-key attributes do not depend on other non-key attributes).

**Example**:

**2NF Table**:
| StudentID | Course | Instructor | Department |
|-----------|----------|------------|------------|
| 1 | Math | Prof. A | Math Dept |
| 1 | Science | Prof. B | Science Dept|
| 2 | History | Prof. C | History Dept|
| 3 | Math | Prof. A | Math Dept |
| 3 | History | Prof. C | History Dept|

**Issues**: `Department` depends on `Instructor`, creating a transitive dependency.

**3NF Tables**:

**Table 1: StudentCourses**
| StudentID | Course |
|-----------|----------|
| 1 | Math |
| 1 | Science |
| 2 | History |
| 3 | Math |
| 3 | History |

**Table 2: CourseInstructors**
| Course | Instructor | Department |
|----------|------------|---------------|
| Math | Prof. A | Math Dept |
| Science | Prof. B | Science Dept |
| History | Prof. C | History Dept |

# Boyce-Codd Normal Form (BCNF)

**Definition**: A table is in BCNF if:

- It is in 3NF.
- For every functional dependency \( A \rightarrow B \), \( A \) is a superkey.

**Example**:

**3NF Table**:
| StudentID | Course | Instructor | Department |
|-----------|----------|------------|---------------|
| 1 | Math | Prof. A | Math Dept |
| 2 | History | Prof. C | History Dept |
| 3 | Math | Prof. A | Math Dept |

**Issues**: Here, `Instructor` can determine `Department`, but `Instructor` is not a superkey.

**BCNF Tables**:

**Table 1: StudentCourses**
| StudentID | Course |
|-----------|----------|
| 1 | Math |
| 2 | History |
| 3 | Math |

**Table 2: CourseInstructors**
| Course | Instructor |
|----------|------------|
| Math | Prof. A |
| History | Prof. C |

**Table 3: InstructorDepartments**
| Instructor | Department |
|------------|---------------|
| Prof. A | Math Dept |
| Prof. C | History Dept |

# Fourth Normal Form (4NF)

**Definition**: A table is in 4NF if:

- It is in BCNF.
- It has no multi-valued dependencies (one attribute set should not determine another set of attributes).

**Example**:

**BCNF Table**:
| StudentID | Course | Hobby |
|-----------|----------|------------|
| 1 | Math | Reading |
| 1 | Math | Swimming |
| 2 | History | Painting |
| 3 | Math | Reading |

**Issues**: `Hobby` is dependent on `StudentID`, creating a multi-valued dependency.

**4NF Tables**:

**Table 1: StudentCourses**
| StudentID | Course |
|-----------|----------|
| 1 | Math |
| 1 | Math |
| 2 | History |
| 3 | Math |

**Table 2: StudentHobbies**
| StudentID | Hobby |
|-----------|------------|
| 1 | Reading |
| 1 | Swimming |
| 2 | Painting |
| 3 | Reading |



**Fifth Normal Form (5NF)**, also known as **Project-Join Normal Form (PJNF)**, focuses on eliminating redundancy in relational databases caused by multi-valued dependencies. A table is in 5NF if it is in 4NF and every join dependency is a consequence of its candidate keys.

### Key Points:

1. **Multi-Valued Dependencies**: 5NF addresses scenarios where a relation contains multiple sets of independent data that can lead to redundancy when joined.

2. **Decomposition**: To achieve 5NF, you decompose the table into smaller tables that can be joined together without losing information or introducing redundancy.

3. **Join Dependency**: A relation is in 5NF if every join dependency in the relation is implied by the candidate keys. This means that if you can reconstruct the original table from its decomposed tables using natural joins, you have satisfied the condition for 5NF.

### Example:

Consider a table that stores information about students, courses, and instructors:

| StudentID | CourseID | InstructorID |
|-----------|----------|---------------|
| 1         | A        | 101           |
| 1         | A        | 102           |
| 1         | B        | 101           |
| 2         | A        | 101           |
| 2         | B        | 102           |

In this case, we have multiple instructors for the same course and student. To convert this to 5NF, we can decompose it into:

1. **Student-Course Relation**:
   | StudentID | CourseID |
   |-----------|----------|
   | 1         | A        |
   | 1         | B        |
   | 2         | A        |
   | 2         | B        |

2. **Course-Instructor Relation**:
   | CourseID | InstructorID |
   |----------|---------------|
   | A        | 101           |
   | A        | 102           |
   | B        | 101           |
   | B        | 102           |

By decomposing into these relations, we can represent the original data without redundancy, ensuring that each table is in 5NF.

### Summary:

5NF helps in structuring databases to avoid redundancy and maintain data integrity by ensuring that the relations are constructed based on the dependency of the data involved, allowing for a clean and efficient design.


### Summary

Each normalization step helps to eliminate redundancy and improve data integrity. However, practical applications often require a balance between normalization and performance, leading some databases to intentionally denormalize certain tables to optimize read operations.
