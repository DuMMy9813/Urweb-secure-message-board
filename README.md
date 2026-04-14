# Secure Message Board in Ur/Web

## 1. Project Overview

This project is a secure web application developed using **Ur/Web**, demonstrating the principles of *security-by-design* in web application development. The system implements a simple message board where users can enter a username and post messages, which are then displayed to all users.

The primary objective of this project is not to build a complex application, but to critically analyse how Ur/Web enforces security at the language level, preventing common web vulnerabilities such as SQL injection and Cross-Site Scripting (XSS).

---

## 2. Features

* Username-based message posting
* Message submission via web interface
* Display of all posted messages
* Structured relational database design

---

## 3. Functional Description

The system operates as follows:

1. A user enters a username and a message.
2. The message is submitted through the web interface.
3. Messages are stored in a backend database.
4. All stored messages are displayed to users.

### Inputs:

* Username (text)
* Message content (text)

### Outputs:

* Confirmation of message submission
* List of posted messages

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

The system uses a single relational table:

* **messages**

  * Id (primary key)
  * Username
  * Content

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
3. Run the generated executable:
   ./main.exe
4. Open a browser and go to:
   http://localhost:8080

---

## 8. Project Structure

* main.ur → Application logic
* main.urs → Type definitions
* db.sql → Database schema
* README.md → Project documentation
* .gitignore → Ignored files configuration

---

## 9. Conclusion

This project demonstrates that secure web applications can be built using language-level guarantees rather than relying solely on developer discipline. Ur/Web provides strong static typing and built-in security mechanisms that eliminate entire classes of vulnerabilities, making it a powerful framework for secure web development.

---

## 10. Repository

GitHub Link:
https://github.com/DuMMy9813/Urweb-secure-message-board
