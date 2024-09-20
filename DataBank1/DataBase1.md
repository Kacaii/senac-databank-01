# Learn SQL

- [Teacher's Github](https://github.com/RonierisonMaciel) 

> [!NOTE]
> A Basic SQL Commands list is [available](./termos.md) in your repository.
> More information will be added after every class.

## Basic SQl Concepts

**1. Database**

A **database** is a collection of tables.

```sql
CREATE DATABASE my_database;
```

**2. Table**

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

**3. Column**

A **column** defines what kind of data is stored.

```sql
  ALTER TABLE users ADD COLUMN birth_date DATE;
```

| id  | name | email | birth_date |
| --- | ---- | ----- | ---------- |

**4. Rows**

Rows store actual data.

```sql
  INSERT INTO users (id, name, email) VALUES (1, 'John', 'john@example.com');
```

| id  | name | email              | birth_date |
| --- | ---- | ------------------ | ---------- |
| 1   | John | <john@example.com> | 2000-01-01 |

## Basic Commands

**1. INSERT**

Adds new data to a table.

```sql
  INSERT INTO products (name, price) VALUES ('Pen', 1.50);
```

**2. SELECT**

Retrieves data from a table.

```sql
  SELECT name, email FROM users;
```

**3. UPDATE**

Modifies existing data.

```sql
  UPDATE users SET email = 'new_email@example.com' WHERE id = 1;
```

**4. DELETE**

Removes data from a table.

```sql
  DELETE FROM users WHERE id = 1;
```

## Querying Data

**1. WHERE**

Filters results based on a condition.

```sql
  SELECT * FROM usuarios WHERE nome = 'Joao';
```

**2. ORDER BY**

Order results by a column.

```sql
  SELECT * FROM usuarios ORDER BY nome ASC;
```

```sql
  SELECT * FROM usuarios ORDER BY nome DESC;
```

## Transactions

A transaction ensures that multiple operations are completed together or nothing at all.

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

1. **Atomicity**: The transaction is an all-or-nothing operation. If any part of the transaction fails, the entire transaction fails and is rolled back to its original state.

2. **Consistency**: Transactions must bring the database from one valid state to another, maintaining the integrity of the data.

3. **Isolation**: Transactions are isolated from each other. Changes made by one transaction are not visible to others until the transaction is completed.

4. **Durability**: Once a transaction is committed, the changes are permanent, even if there is a system failure afterward.
