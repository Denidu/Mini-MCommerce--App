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

## Unit Testing
This project includes unit tests for critical logic in the CartViewModel, ensuring reliable behavior for:

Adding items to the cart

Increasing quantities of existing items

Removing items

Updating item quantities

Calculating total price

Clearing the cart

---

## Known Issues

Cart data is not persisted between app launches (no CoreData/UserDefaults yet)
No animations or transitions on add/remove


