# Todo List Application

This project is a full-stack Todo List application built with the following technologies:

- **Frontend**: Flutter
- **Backend**: Spring Boot
- **Database**: H2 Database (using JPA for ORM)

## Features

- Create, Read, Update, and Delete (CRUD) tasks.
- Cross-platform support with Flutter for the frontend.
- RESTful APIs for backend services.
- H2 in-memory database for development purposes.
  
---

## Backend

### Description

The backend is implemented using Spring Boot and exposes RESTful APIs for managing tasks. It uses JPA for database operations and connects to an H2 in-memory database.
### Technologies Used

- **Spring Boot**: Backend framework.
- **JPA**: Java Persistence API for ORM.
- **H2 Database**: In-memory database for development.
- **Lombok**: To reduce boilerplate code.
- **Maven**: Build and dependency management.

### API Endpoints

| Method | Endpoint         | Description             |
|--------|------------------|-------------------------|
| GET    | `/tasks`         | Get all tasks.          |
| GET    | `/tasks/{id}`    | Get a task by ID.       |
| POST   | `/tasks`         | Create a new task.      |
| PUT    | `/tasks/{id}`    | Update a task by ID.    |
| DELETE | `/tasks/{id}`    | Delete a task by ID.    |

---

## Frontend

### Description

The frontend is built using Flutter, which provides a cross-platform user interface to interact with the backend APIs.

### Technologies Used

- **Flutter**: Frontend framework.
- **Dart**: Programming language for Flutter.
- **http**: For API calls.

### Key Screens

- **Task List Screen**: Displays all tasks.
- **Create/Edit Task Screen**: Allows users to add or update tasks.
