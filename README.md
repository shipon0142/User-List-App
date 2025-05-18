
## 🛠️ Technologies Used

- **Flutter SDK**: [3.27.3]
- **Dart**: [3.6.1]

## 📂 Project Structure

```
lib/
├── core/                          # Core modules shared across the entire app
│   ├── di/                        # Core-level dependency injection and service locators
│   ├── local_cache/               # Local caching logic (e.g., SharedPreferences, secure storage)
│   ├── network/                   # Network utilities (e.g., connectivity check, interceptors)
│   ├── presentation/              # Global UI configurations (e.g., themes, typography, styles)
│   └── utility/                   # Reusable helper functions and extensions
│
├── features/                      # Feature-based modules (clean architecture)
│   └── feature_name/              # Replace with actual feature name (e.g., users, auth)
│       ├── data/                  # Data sources, models, and repository implementations
│       ├── domain/                # Business logic: entities, use cases, and abstract repositories
│       └── presentation/          # UI layer: pages, widgets, and state management (e.g., BLoC)
│
├── app/                           # Global app-level configuration
│   ├── routes/                    # App navigation and route definitions
│   ├── di/                        # App-level dependency injection setup
│   └── main.dart                  # Main entry point of the application
│
└── assets/                        # Static resources used by the app
    ├── images/                    # Image assets (e.g., PNG, SVG)
    └── fonts/                     # Custom fonts used in the app
                    
```
## Features
- [x] Implement **User List Screen**
- [x] Implement **User Detail Screen**
- [x] Add **Search Functionality**
- [x] Add **Pagination Support**
- [x] Display **Empty State Widget**
- [x] Use **Bloc** for State Management
- [x] Follow **Clean Architecture** Principles
- [x] Integrate Networking with **Dio**
- [x] Set Up **Navigation**
- [x] Handle **Errors Gracefully**
- [x] Design **Clean and Consistent UI/UX**
- [x] Use **SharedPreferences** for Caching
- [x] Enable **Pull to Refresh**
- [x] Configure Dependency Injection with **get_it**

## 🛠️ Prerequisites

1. Flutter SDK
2. IDE: Android Studio or VS Code

## ⚙️ Installation

1. Clone the repository:

   ```
   git clone https://github.com/shipon0142/User-List-App.git
   ```
2. Navigate to the project directory:

   ```
   cd project_name
   ```
3. Get the dependencies:
   ```
   flutter pub get
   ```
4. Build the project:

   ```
   dart run build_runner build --delete-conflicting-outputs
   ```
5. Run the app on a connected device or emulator:

   ```
   flutter run
   
   ```

https://github.com/user-attachments/assets/e4287d61-2b83-4f77-bc9c-a5ba82432f18


