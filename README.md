# Movies App

A SwiftUI app that fetches and displays top-rated movies and movies by genre using the TMDB API. The app leverages **Swift Concurrency** (`async/await` and `MainActor`) and follows the **MVVM architecture** for clean code structure.

---

## Features

- **Discover Top-Rated Movies**: View a list of the highest-rated movies from TMDB.
- **Browse by Genre**: Explore movies categorized by genres like Action, Comedy, Drama, and more.
- **Swift Concurrency**: Smooth and efficient data fetching using `async/await`.
- **Responsive UI**: Built with SwiftUI for seamless and adaptive user experience.
- **Modern Architecture**: Implements the MVVM pattern for scalability and maintainability.

---

## Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/6b5d42b2-0dfd-47c2-b428-80db73a8a257" alt="Image 1" style="margin: 10px; width: 280px;">
  <img src="https://github.com/user-attachments/assets/c881f0c9-33b7-48a1-af6a-e10fe646b64d" alt="Image 1" style="margin: 10px; width: 280px;">
</p>

---

## Requirements

- **iOS 16.0+**
- **Xcode 14.0+**
- **TMDB API Key** (Sign up at [TMDB API](https://www.themoviedb.org/documentation/api) to get your API key.)

---

## Installation

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/yourusername/swiftui-movies-app.git
    cd swiftui-movies-app
    ```

2. **Install Dependencies**:
    - Open the project in Xcode, and it will automatically fetch dependencies via Swift Package Manager.

3. **Set up TMDB API Key**:
    - Add your API key to `Constants.swift`:
      ```swift
      struct Constants {
          static let apiKey = "YOUR_API_KEY_HERE"
          static let baseURL = "https://api.themoviedb.org/3"
      }
      ```

4. **Run the App**:
    - Select your target device in Xcode and press `Run` (⌘R).

---

## Architecture Overview

This app follows the **MVVM (Model-View-ViewModel)** architecture:

### **Model**
- Represents movie-related data structures (`Movie`, `Genre`, etc.).
- Handles decoding of JSON responses from the TMDB API.

### **ViewModel**
- Acts as the intermediary between Views and Models.
- Manages state, processes data, and fetches information using `async/await`.

### **View**
- SwiftUI-based components for rendering the UI.
- Reactive UI updates with `@State` and `@Published` properties.

---

## Key Files

- **APIManager.swift**: Handles network requests to the TMDB API using `URLSession` and `async/await`.
- **MovieViewModel.swift**: Business logic and state management for movies.
- **GenreViewModel.swift**: Fetches and filters movies based on genre.
- **Constants.swift**: Holds API keys and base URLs.
- **Movie.swift**: Model for movie data from TMDB.
- **Genre.swift**: Model for genres.

---

## Swift Concurrency

The app utilizes Swift Concurrency for efficient data fetching:

- **`async/await`**:
  - Used in API calls for cleaner, asynchronous code.
  ```swift
  func fetchMovies() async throws -> [Movie] {
      let url = URL(string: "\(Constants.baseURL)/movie/top_rated?api_key=\(Constants.apiKey)")!
      let (data, _) = try await URLSession.shared.data(from: url)
      return try JSONDecoder().decode(MovieResponse.self, from: data).results
  }
