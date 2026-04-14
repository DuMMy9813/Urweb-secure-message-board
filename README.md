# Secure Student Message Board in Ur/Web

## 1. Project Overview

This project is a secure web application developed using Ur/Web, demonstrating the principles of security-by-design in web application development. The system implements a simple student message board where authenticated users can log in and post messages, which are then displayed to all users.

The primary objective of this project is not to build a complex application, but to critically analyse how Ur/Web enforces security at the language level, preventing common web vulnerabilities such as SQL injection and Cross-Site Scripting (XSS).

---

## 2. Features

- User authentication (login system)
- Message posting functionality
- Message display for authenticated users
- Structured relational database design

---

## 3. Functional Description

The system operates as follows:

1. A user logs in using a username and password.
2. Upon successful authentication, the user can submit a message.
3. Messages are stored in a backend database.
4. All stored messages are displayed to authenticated users.

### Inputs:
- Username (text)
- Password (text)
- Message content (text)

### Outputs:
- Login success or failure
- List of posted messages

---

## 4. Security Considerations

This system is designed to demonstrate how Ur/Web eliminates common web vulnerabilities by construction:

### 4.1 SQL Injection Prevention
Unlike traditional frameworks, Ur/Web uses a strongly typed SQL system, preventing unsafe query construction and eliminating SQL injection risks.

### 4.2 Cross-Site Scripting (XSS) Prevention
User inputs are automatically escaped when rendered in HTML, preventing execution of malicious scripts.

### 4.3 Safe Separation of Concerns
Ur/Web enforces strict separation between client and server code, reducing the risk of unsafe data handling.

---

## 5. Database Design

The system uses two relational tables:

- **users**
  - id (primary key)
  - username
  - password

- **messages**
  - id (primary key)
  - user_id (foreign key)
  - content

---

## 6. Security Test Cases

The following inputs were considered during testing:

### SQL Injection Attempt:
' OR '1'='1

### Cross-Site Scripting Attempt:
<script>alert('XSS')</script>


In both cases, Ur/Web safely handles the input without executing malicious behaviour.

---

## 7. How to Run the Project

1. Install Ur/Web from: http://www.impredicative.com/ur/
2. Compile the project using:
urweb main
4. Run the generated executable:
./main.exe

---

## 8. Project Structure

- main.ur → Application logic
- main.urs → Type definitions
- db.sql → Database schema
- README.md → Project documentation

---

## 9. Conclusion

This project demonstrates that secure web applications can be built using language-level guarantees rather than relying solely on developer discipline. Ur/Web provides strong static typing and built-in security mechanisms that eliminate entire classes of vulnerabilities, making it a powerful framework for secure web development.

---

## 10. Repository

GitHub Link: https://github.com/your-username/urweb-secure-message-board
