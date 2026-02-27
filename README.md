# assigment

A new Flutter project.

## Getting Started
Project Structure -
lib/
│
├── core/
│   ├── constants/          # API & app constants
│   ├── network/            # Dio client configuration
│   └── errors/             # Error handling utilities
│
├── features/
│   ├── auth/
│   │   └── presentation/
│   │       ├── auth_provider.dart
│   │       ├── login_page.dart
│   │       └── auth_wrapper.dart
│
│   ├── news/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   └── repositories/
│   │   └── presentation/
│   │       ├── pages/
│   │       ├── providers/
│   │       └── widgets/
│
│   └── favorites/
│       └── favorite_provider.dart
│
└── main.dart

State Management Riverpod -
  Riverpod is used for:
    News fetching & pagination
    Category selection
    Search state
    Authentication state
    UI reactivity
