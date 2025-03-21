# 📱 University Mobile Exercise — iOS Accessibility App

This SwiftUI-based iOS application is part of an academic exercise focused on designing and evaluating **accessible mobile interfaces**. It serves as both a tutorial and hands-on lab for implementing accessibility best practices in SwiftUI.

> Created by: ✍️ University Course  
> Maintainer: Azizbek Asadov, 21.03.2025

---

## 🚀 Features

- Accessible `TabView` navigation with custom SF Symbols
- `MealsView`: List of mensa restaurants with accessibility identifiers
- `EnrollmentView`: Interactive form fields (e.g. date picker, custom pickers)
- `NewsView`: Text-heavy view evaluated for color contrast and dynamic text support

---

## 🔧 Setup Instructions

### ✅ Requirements
- macOS system
- Xcode 13.2.1 or later
- iOS Simulator (iOS 15+ recommended)

### 💻 Run the App
1. Download and unzip the project from the provided ZIP file.
2. Open `.xcodeproj` with Xcode.
3. Press `Run ▶️` to launch the app in the simulator.

### 🧪 Enable Accessibility Inspector
- Open `Xcode > Developer Tools > Accessibility Inspector`
- Select the simulator target and inspect individual UI elements
- Use VoiceOver (⌘ + F5) to test screen reader support

---

## 📋 Accessibility Exercises

The project includes structured tasks from the `exercises_accessibility_ios.pdf` document. These include:

| Topic | Description |
|-------|-------------|
| **Labeling** | Improve accessibility labels for key UI elements |
| **Header** | Evaluate header navigation in `TabView` |
| **Reading Order** | Validate VoiceOver reading sequence in `MealsView` |
| **Traits & Contrast** | Ensure semantic traits & contrast in `RestaurantView` |
| **Sliders** | Make rating sliders accessible with value feedback |
| **Date Picker** | Improve picker experience for screen reader users |
| **Text Magnification** | Enable scalable dynamic type support |
| **Custom Picker (Advanced)** | Build a searchable, accessible picker for forms |

---

## 🧪 UI Testing

Unit/UI tests are included to ensure accessibility compliance.

### 💡 Example Tests (located in `MealsViewUITests.swift`)
- ✅ List & cell accessibility
- ✅ Navigation interaction
- ✅ VoiceOver traits
- ✅ Dynamic content loading
- ✅ Label presence & scroll safety

### Run Tests
```bash
⌘ + U in Xcode
