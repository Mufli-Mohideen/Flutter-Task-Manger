<h1 align="center">Flutter Task Manager</h1>

<p align="center">
  <img src="https://drive.google.com/uc?export=view&id=1TH8OyWb-EO2uYEAlghS8IRI-HaJgsXbs" alt="Flutter Task Manager">
</p>

<p align="justify">
  This is a Flutter-based Task Manager application that helps users efficiently manage tasks with a simple and user-friendly interface. The app supports user authentication, task creation, updating, and deletion. It aims to enhance productivity through easy-to-use task management features.
</p>


## Technologies Used

- **Flutter**: For building the cross-platform mobile app.
- **Dart**: Programming language used within Flutter.
- **Provider**: State management for managing user authentication and app state.
- **SQLite** (optional): For local task storage (if you integrate local databases).

## Features

- **User Authentication**: Secure login functionality using username and password.
- **Task Management**: Create, edit, and delete tasks with ease.
- **Responsive UI**: Adaptive layout designed to work across different screen sizes.
- **Real-time Feedback**: Receive real-time validation messages for user interactions.

## Installation Guide

### Prerequisites

Ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (latest version)
- [Dart SDK](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/) (for iOS) for running emulators and building the app.
- **Flutter Plugin**: Make sure you have the Flutter plugin installed in your IDE (VS Code or Android Studio).

### Steps

1. Clone the repository:

    ```bash
    git clone https://github.com/Mufli-Mohideen/Flutter-Task-Manger.git
    ```

2. Navigate to the project directory:

    ```bash
    cd flutter-task-manager
    ```

3. Install the required dependencies:

    ```bash
    flutter pub get
    ```

4. Connect a device or start an emulator (Android or iOS).

5. Run the app:

    ```bash
    flutter run
    ```

## Folder Structure

- **/lib**: Contains all the Dart source code including views, models, and controllers.
  - **/models**: Data models.
  - **/viewmodels**: Logic for managing data and user authentication.
  - **/views**: UI components such as login page, task list page, etc.

## Contribution

1. Fork the repository.
2. Create a new feature branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m "Description of the feature"`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a Pull Request.
