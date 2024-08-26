# q_yaar
Get out and play

## Prerequisites

Before you begin, ensure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) with Flutter and Dart plugins

## Getting Started

1. Clone the repository:
   ```
   git clone https://github.com/paragjnath/q-yaar-app.git
   ```

2. Navigate to the project directory:
   ```
   cd q-yaar-app
   ```

3. Get the dependencies:
   ```
   flutter pub get
   ```
4. Add `.env` file to the project root
   ```
     PROD_Q_YAAR_PLATFORM_BASE_URL=https://q.yaar
     STAGING_Q_YAAR_PLATFORM_BASE_URL=https://staging.q.yaar
   ```

6. Run the app for devlopment:
   ```
   flutter run
   ```

## Project Structure

```
lib/
|- constants/
|- data/
|- models/
|- routes/
|- services/
|- ui/
|- utilities/
|- main.dart
```

- `constants/`: Constants used across the app
- `data/`: Data sources and Application state
- `models/`: Data models used across the app
- `routes/`: Routes for screens
- `services/`: Third party services wrappers
- `ui/`: Contains all ui logic and screens
- `utilities/`: Utility functions
- `main.dart`: The entry point of the application


## Building for Production

To build a release version of your app:

1. For Android:
   ```
    flutter build appbundle --release --dart-define=isProductionEnvironment=true
   ```