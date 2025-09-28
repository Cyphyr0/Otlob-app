# Otlob App Blueprint

## Overview

Otlob is a modern, all-in-one delivery and service application designed for speed and convenience. It will feature a clean, intuitive user interface, a robust set of features, and a seamless user experience from onboarding to order fulfillment.

## Design & Style

*   **Theme:** A modern, visually appealing theme with a deep purple primary color and a clean, spacious layout. It will support both light and dark modes.
*   **Typography:** Custom fonts will be used for branding, with clean and readable fonts for body text. `Oswald` for display and `Roboto` for body text are currently implemented as placeholders. `Tutano` is the intended display font.
*   **Iconography:** Modern, interactive icons will be used to enhance usability.

## Features

### Current Features

*   **Onboarding:** A multi-page onboarding flow to introduce users to the app's key features.
*   **Authentication:** A combined login and sign-up screen with basic email/password validation.
*   **Navigation:** A `go_router`-based navigation system with routes for onboarding, authentication, and the home screen.
*   **Themeing:** A centralized theme system with support for light and dark modes, managed by a `ThemeProvider`.

### Planned Features

*   **Home Screen:** A dynamic home screen with a search bar, featured items, and category browsing.
*   **Product Details:** A detailed view for each product or service.
*   **Shopping Cart:** A fully functional shopping cart with the ability to add, remove, and update items.
*   **Checkout:** A secure and streamlined checkout process.
*   **User Profile:** A user profile screen with order history and account settings.
*   **Firebase Integration:** Firebase will be integrated for authentication, database, and storage.

## Project Structure

*   `lib/main.dart`: The main application entry point.
*   `lib/theme.dart`: Defines the application's theme and color scheme.
*   `lib/router.dart`: Defines the application's routes using `go_router`.
*   `lib/onboarding_screen.dart`: The onboarding screen UI.
*   `lib/auth_screen.dart`: The authentication screen UI.
*   `lib/home_screen.dart`: The home screen UI (placeholder).
*   `assets/`: Contains the application's assets, such as images and fonts.

