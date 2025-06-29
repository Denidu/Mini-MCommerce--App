# MiniMCommerce – iOS App

A simple e-commerce demo app built with **SwiftUI**, **MVVM**, and **Alamofire**. This app displays a list of products, allows users to view product details, add items to a cart, and manage cart items.

---

## Features

- Product list screen with images, names, and prices
- Detailed product view with description, rating, and “Add to Cart” functionality
- Cart screen with quantity updates, item removal, and total calculation
- Clean and modular architecture using **MVVM**
- Networking using **Alamofire**
- Native iOS design and smooth user experience

---

## Tech Stack

- `Swift`
- `SwiftUI`
- `Alamofire` (via Swift Package Manager)
- `MVVM Architecture`
- `AsyncImage`, `NavigationView`, `Stepper`, etc.

---

## Architecture Overview

- The app uses the MVVM (Model-View-ViewModel) architecture:

- Models represent product and cart item structures conforming to Codable and Identifiable.

- ViewModels handle data fetching (e.g., from API) and business logic (e.g., updating cart, calculating totals).

- Views use @StateObject and @EnvironmentObject to observe changes and render UI reactively.

- This pattern ensures clear separation of concerns, scalability, and ease of testing.

  ---

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/MiniMCommerce.git
   
2. Open the project in Xcode

3. Build & Run

4. Ensure Alamofire is added via:
   File > Add Packages > https://github.com/Alamofire/Alamofire.git

---

## Project Structure

MiniMCommerce/
├── Models/
├── ViewModels/
├── Views/
├── MiniMCommerceApp.swift

---

## Optional Features

These features were optionally added to improve the app:

- Stepper UI for quantity control in the cart

- Cart total calculation updates in real-time

- User feedback alert when adding an item to the cart

- Toolbar buttons and clean native navigation experience

## Unit Testing
This project includes unit tests for critical logic in the CartViewModel, ensuring reliable behavior for:

- Adding items to the cart
- Increasing quantities of existing items
- Removing items
- Updating item quantities
- Calculating total price
- Clearing the cart

---

## Known Issues

- Cart data is not persisted between app launches (no CoreData/UserDefaults yet)
- No animations or transitions on add/remove


