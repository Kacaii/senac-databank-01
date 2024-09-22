# Learn SQL

- [Teacher's Github](https://github.com/RonierisonMaciel) 

> [!NOTE]
> A Basic SQL Commands list is [available](./termos.md) in your repository.
> More information will be added after every class.

## Basic SQl Concepts

### Database

A **database** is a collection of tables.

```sql
CREATE DATABASE my_database;
```

### Table

A **table** stores data in rows and columns.

```sql
  CREATE TABLE users (
      id INT PRIMARY KEY,
      name VARCHAR(100),
      email VARCHAR(100)
  );
```

| id  | nome | email |
| --- | ---- | ----- |

### Column

A **column** defines what kind of data is stored.

```sql
  ALTER TABLE users ADD COLUMN birth_date DATE;
```

| id  | name | email | birth_date |
| --- | ---- | ----- | ---------- |

### Rows

Rows store actual data.

```sql
  INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com');
```

| id  | name | email              | birth_date |
| --- | ---- | ------------------ | ---------- |
| 1   | John | <john@example.com> | 2000-01-01 |

## Basic Commands

### INSERT

Adds new data to a table.

```sql
  INSERT INTO products (name, price) VALUES ('Pen', 1.50);
```

### SELECT

Retrieves data from a table.

```sql
  SELECT name, email FROM users;
```

### UPDATE

Modifies existing data.

```sql
  UPDATE users SET email = 'new_email@example.com' WHERE id = 1;
```

### DELETE

Removes data from a table.

```sql
  DELETE FROM users WHERE id = 1;
```

## Querying Data

### WHERE

Filters results based on a condition.

```sql
  SELECT * FROM usuarios WHERE nome = 'Joao';
```

### ORDER BY

Order results by a column.

```sql
  SELECT * FROM usuarios ORDER BY nome ASC;
```

```sql
  SELECT * FROM usuarios ORDER BY nome DESC;
```

## Primary Keys

### Key points about primary keys

A Primary Key is a field or set of fields in a database table that
uniquely identifies each record. Its main characteristics are:

- **Uniqueness**: Each value in the primary key column is unique.

- **Not null**: The primary key cannot contain null values.

- **Efficiency**: The primary key helps optimize data retrieval,
  as the DBMS automatically creates indexes for it.

### Why use primary keys?

A Primary Key is _essential_ for maintaining data integrity and ensuring
efficient query and update operations. Its importance includes:

- **Unique identification**: It uniquely identifies each record, which is crucial
  in many business scenarios (e.g., a customer ID in a customer database).

- **Referential integrity**: It ensures reliable relationships between tables,
  allowing connected records to maintain referential integrity.

- **Efficiency**: Primary keys are automatically indexed by DBMS,
  making queries faster and more efficient.

## Foreign Keys

### Key points about foreign keys

A Foreign Key is a field in a table that creates a relationship between that table
and another by referencing the Primary Key of the other table.

Key points about Foreign Keys include:

- **Referential integrity**: Ensures that the value in the foreign key matches
  a valid value in the related table's primary key, maintaining data consistency.

- **Relationships**: Defines how tables relate to each other, enabling linked data
  across multiple tables.

- **Cascading actions**: Foreign keys can be set to cascade updates or deletions,
  meaning changes in the related table automatically reflect in the referencing table.

### How to use foreign keys

```sql

FOREIGN KEY (currentTableColumn) REFERENCES otherTable (otherTableColumn)

```

> [!IMPORTANT]
> A `FOREIGN KEY` should always link to a `PRIMARY KEY`.

## Transactions

A transaction ensures that multiple operations
are completed together or nothing at all.

- **BEGIN TRANSACTION**: Start a transaction.

- **COMMIT**: Saves changes

- **ROLLBACK**: Undo changes if something goes wrong.

```SQL

BEGIN TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;

COMMIT;

```

> [!NOTE]
> Its similar to creating a `branch` in Git

### Key concepts in transactions

1. **Atomicity**: The transaction is an all-or-nothing operation.
   If any part of the transaction fails, the entire transaction fails
   and is rolled back to its original state.

2. **Consistency**: Transactions must bring the database from one valid state
   to another, maintaining the integrity of the data.

3. **Isolation**: Transactions are isolated from each other. Changes made by
   one transaction are not visible to others until the transaction is completed.

4. **Durability**: Once a transaction is committed, the changes are permanent,
   even if there is a system failure afterward.
