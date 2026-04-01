<div align="center">

# 🍎 Fruits App

**A full-featured Flutter e-commerce application for fresh fruits & groceries — featuring product browsing, cart management, multi-step checkout, order tracking, favorites, and dual push notification support.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.10+-0175C2?logo=dart)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-FCM-FFCA28?logo=firebase)](https://firebase.google.com)
[![BLoC](https://img.shields.io/badge/State%20Management-BLoC%20%2F%20Cubit-blueviolet)](https://bloclibrary.dev)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-orange)]()

</div>

---

## 📖 Project Overview

**Fruits App** is a production-ready Flutter e-commerce application built for ordering fresh fruits and groceries. It connects to a live REST API backend and provides a complete end-to-end shopping experience — from browsing vendor products and filtering by categories, to adding items to a local SQLite cart, placing orders with multi-step checkout (delivery address → delivery time → payment), and tracking order status in real time.

The app supports full user authentication (register, login, forgot password, phone verification, profile management), favorites, push notifications via both **Firebase Cloud Messaging (FCM)** and **OneSignal**, secure token storage, and a responsive layout that adapts beautifully to both portrait/landscape and phone/tablet screen sizes.

Built with strict **Clean Architecture** principles across 9 feature modules, all dependency-injected via GetIt.

---

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| **Framework** | Flutter (Dart 3.10+) |
| **State Management** | Flutter BLoC / Cubit |
| **Navigation** | GoRouter |
| **Networking** | Dio + REST API |
| **Local Database** | SQLite via sqflite (Cart persistence) |
| **Secure Storage** | flutter_secure_storage (Auth token) |
| **Local Preferences** | SharedPreferences |
| **Push Notifications** | Firebase Cloud Messaging (FCM) + OneSignal |
| **Local Notifications** | flutter_local_notifications |
| **DI / Service Locator** | get_it |
| **Functional Programming** | dartz (Either, Failures) |
| **Image Handling** | cached_network_image + image_picker |
| **UI Utilities** | flutter_screenutil, flutter_svg, font_awesome_flutter, smooth_page_indicator |
| **Phone Input** | intl_phone_field |
| **OTP Verification** | pin_code_fields |
| **Bottom Navigation** | google_nav_bar |
| **State Equality** | equatable |

---

## 🏗️ Architecture

The project strictly follows **Clean Architecture** with a **feature-first** modular folder structure. Each of the 9 features is fully self-contained across three layers.

```
Feature
├── data/
│   ├── data_sources/     # Remote (Dio/API) & local (SQLite/SharedPrefs) sources
│   ├── models/           # JSON-serializable models (extend domain entities)
│   └── repositories/     # Concrete repository implementations
├── domain/
│   ├── entities/         # Pure Dart business objects
│   ├── repositories/     # Abstract repository interfaces
│   └── usecases/         # Single-responsibility use cases
└── presentation/
    ├── cubit/            # BLoC Cubits + typed states
    ├── views/            # Full screen widgets
    └── widgets/          # Reusable, composable UI components
```

**Key architectural decisions:**

- **`dartz Either<Failure, T>`** is used in all use cases and repositories for type-safe error propagation — no exceptions bubble to the UI.
- **GetIt** (`service_locator.dart`) wires all 16 use cases, 6 repositories, and 8 Cubits at startup with lazy singletons and factory registrations.
- **Dual notification stack** — FCM handles background/killed-state push notifications; OneSignal handles foreground notification display and deep-link handling; `flutter_local_notifications` shows banners when the app is open.
- **`flutter_secure_storage`** stores the auth token securely in the OS keychain/keystore — never in SharedPreferences.
- **SQLite via sqflite** stores the cart locally so items persist across sessions without hitting the server.
- **Responsive UI** — `AppResponsive` utility detects landscape/tablet modes and adapts layout (portrait stack vs. landscape row, grid vs. list) throughout the app.

---

## ✨ Features

### 🔐 Authentication & User Management
- Welcome screen with Login / Sign Up flow
- Phone number input with country code picker (`intl_phone_field`)
- OTP / PIN verification screen (`pin_code_fields`)
- Forgot password with email-based recovery
- Full profile editing with avatar image upload (`image_picker`)
- Auth token stored securely via `flutter_secure_storage`
- Contact Us form with direct API submission

### 🏠 Home Dashboard
- Auto-scrolling banner carousel for promotions
- Category list fetched from API — tap to browse subcategories
- Vendor / Seller listing with delivery info, distance, and category tags
- Search icon and advanced filter dialog in the app bar
- Fully responsive layout for phone, tablet, and landscape orientations

### 🗂️ Categories & Products
- Browse top-level categories → subcategories → products hierarchy
- Product listing with images (cached via `cached_network_image`), prices, and discounts
- Price before/after discount display with visual comparison
- Product detail screen with image banner, full description, unit info, and add-to-cart

### ❤️ Favorites
- Add/remove any product to favorites with a heart icon tap
- Favorites persisted server-side via API
- Dedicated favorites screen showing all saved products
- Visual feedback via SnackBar on add/remove

### 🛒 Shopping Cart (Basket)
- Cart stored locally in **SQLite** — fully offline-capable
- Add, update quantity, and remove items
- Dual layout support: portrait bottom-bar and landscape sidebar
- Dotted divider design between cart items
- Item count badge on the navigation bar icon
- Checkout button navigates to the multi-step checkout flow

### 🏪 Vendors / Sellers
- Browse all active vendors/sellers fetched from API
- Tap a vendor to see their dedicated product listing
- Vendor products managed by a separate `VendorProductsCubit`

### 📦 Multi-Step Checkout
- **Step 1 — Delivery Address**: Add or select a saved delivery address via a dialog
- **Step 2 — Delivery Time**: Pick preferred date and time slot
- **Step 3 — Payment**: Select payment method with order summary (items, totals, fees)
- Step indicator widget showing progress through the flow
- Order success screen on completion

### 📋 Order Tracking
- View all past and active orders
- Order status card with real-time status (Pending, Processing, Delivered, etc.)
- Timeline step widget showing step-by-step delivery progress
- Cancel order dialog with confirmation prompt

### ⚙️ Settings
- About Us page fetched from API
- Terms & Conditions page fetched from API
- Support / Contact screen
- Logout with full session clearing (token + cache)

### 🔔 Push Notifications
- **Firebase Cloud Messaging (FCM)** — handles background and terminated-state delivery
- **OneSignal** — handles foreground notification display and click event deep-linking
- **Local Notifications** — shows system banners when app is in foreground

### 📱 Responsive & Adaptive UI
- Portrait and landscape layouts for Basket, Splash, and product screens
- Tablet-aware breakpoints via `AppResponsive`
- `flutter_screenutil` for pixel-perfect scaling across all screen sizes

---

## 🧪 Testing

The project uses Flutter's built-in testing framework with linting via `flutter_lints`.

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
```

Run all tests:

```bash
flutter test
```

The Clean Architecture structure makes every layer independently testable:

- **Use cases** — unit-testable by mocking the repository interface (no network or UI needed)
- **Repositories** — testable by mocking data sources
- **Cubits** — fully testable with `bloc_test` by injecting mocked use cases

> Recommended additions: `bloc_test` and `mocktail` as dev dependencies for full Cubit coverage, especially for `UserCubit`, `CartCubit`, and `GetFavoritesCubit`.

---

## 📁 Folder Structure

```
fruits_app/
├── lib/
│   ├── core/
│   │   ├── api/                        # ApiConsumer, DioConsumer, interceptors, endpoints
│   │   ├── cache/                      # CacheHelper (SharedPreferences wrapper)
│   │   ├── di/                         # service_locator.dart (GetIt DI wiring)
│   │   ├── error/                      # ErrorModel, Failures, Exception handlers
│   │   ├── helper/                     # SqliteService (database_helper.dart)
│   │   ├── routing/                    # app_route.dart (GoRouter config)
│   │   ├── services/
│   │   │   ├── local_notifications_service.dart   # flutter_local_notifications
│   │   │   ├── notification_services.dart         # FCM foreground handler
│   │   │   ├── one_signal_service.dart            # OneSignal init & listeners
│   │   │   ├── push_notifications_service.dart    # FCM background handler
│   │   │   └── secure_storage_service.dart        # flutter_secure_storage wrapper
│   │   ├── theme/                      # AppColors, AppStyles, AppImages
│   │   ├── utils/                      # AppResponsive (tablet/landscape detection)
│   │   └── widgets/                    # Shared reusable widgets
│   │
│   ├── features/
│   │   ├── basket/                     # Cart: SQLite local storage, CRUD operations
│   │   ├── categories/                 # Categories → Subcategories → Products (API)
│   │   ├── checkout/                   # Multi-step: Address → Time → Payment
│   │   ├── favorite/                   # Add/remove/get favorites (API)
│   │   ├── home/                       # Dashboard, Product Details, Seller Details
│   │   ├── onboarding/                 # Onboarding carousel with page indicator
│   │   ├── order/                      # Order list, Order tracking, Cancel dialog
│   │   ├── settings/                   # About Us, Terms, Support (API)
│   │   ├── splash/                     # Animated splash (portrait + landscape)
│   │   ├── user/                       # Auth: Login, Register, OTP, Profile, Contact
│   │   └── vendors/                    # Vendor list + vendor product listing
│   │
│   ├── firebase_options.dart           # Firebase platform configuration
│   └── main.dart                       # Entry point (Firebase, FCM, OneSignal, DI)
│
├── assets/                             # Images, icons, SVGs
├── android/                            # Android native project
├── ios/                                # iOS native project
├── pubspec.yaml                        # Dependencies & assets manifest
└── README.md
```

---

## 🚀 How to Run the Project

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=3.10.0`
- Dart `>=3.10.0`
- Android Studio / VS Code with Flutter & Dart extensions
- A physical device or emulator
- Firebase project with FCM enabled (for push notifications)

### Steps

**1. Clone the repository**

```bash
git clone https://github.com/your-username/fruits_app.git
cd fruits_app
```

**2. Install dependencies**

```bash
flutter pub get
```

**3. Configure Firebase**

- Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
- Download `google-services.json` → place in `android/app/`
- Download `GoogleService-Info.plist` → place in `ios/Runner/`
- The `firebase_options.dart` file is already generated

**4. Configure OneSignal**

- Create an app at [onesignal.com](https://onesignal.com)
- Replace the App ID in `lib/core/services/one_signal_service.dart`

**5. Run the app**

```bash
flutter run
```

**6. Build release APK**

```bash
flutter build apk --release
```

> **API Base URL** is set to `https://fruits.sys-web.net/api/` in `lib/core/api/end_ponits.dart`. No additional API key is required.

---

## 🌐 API Endpoints

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `login` | POST | User login |
| `register` | POST | New user registration |
| `forget_pass_user` | POST | Password reset |
| `update_profile` | POST | Update user profile |
| `contact_us` | POST | Contact form submission |
| `about-us` | GET | About Us content |
| `conditions` | GET | Terms & Conditions |
| `categories/get_with_sub` | GET | Categories with subcategories |
| `user_favorite` | GET/POST | Get or toggle favorites |
| `getvendors` | GET | List all vendors/sellers |
| `get_vendor_products` | GET | Products by vendor |

---

## 🔮 Future Improvements

- [ ] **Product Search** — Full-text search across all products with debounced input
- [ ] **Live Order Tracking Map** — Real-time delivery driver location on a map
- [ ] **Dark Mode** — Full dark theme with a theme switcher in Settings
- [ ] **Multi-Language (i18n)** — Arabic/English localization support
- [ ] **Discount Coupons** — Apply promo codes at checkout
- [ ] **Product Reviews & Ratings** — User-generated reviews per product
- [ ] **Wishlist Sharing** — Share favorite lists via deep links
- [ ] **Payment Gateway** — Integrate a real payment provider (Stripe, PayTabs, etc.)
- [ ] **Unit & Widget Tests** — Full BLoC test coverage with `bloc_test` and `mocktail`
- [ ] **CI/CD Pipeline** — Automated testing and APK builds via GitHub Actions

---

## 📸 Screenshots

> Add your screenshots here to showcase the app's UI.

| Splash | Onboarding | Login |
|:------:|:----------:|:-----:|
| <img width="430" height="932" alt="splash" src="https://github.com/user-attachments/assets/befc3022-51f0-46e4-bbec-abd29bbef108" /> | ![onboarding](https://github.com/user-attachments/assets/7f9b388d-4be5-40f6-a9f7-65f76d753d8f) | ![login](https://github.com/user-attachments/assets/aeb83cc8-2e51-40cf-9224-54601023cc5c) |

| Home | Product Details | Basket |
|:----:|:---------------:|:------:|
| ![home](https://github.com/user-attachments/assets/c8719e50-5a77-4a1b-af6f-338884e7e740) | ![product details](https://github.com/user-attachments/assets/1e33bfe2-34c3-4f55-938f-fc15799a260a) | ![basket](https://github.com/user-attachments/assets/00b62f73-257a-435d-bbb6-9ef5571f20c8) |

| Checkout | Order Tracking | Favorites |
|:--------:|:--------------:|:---------:|
| ![checkout](https://github.com/user-attachments/assets/7a7a381f-9e3e-40f9-a2c8-15fddc459617) | <img width="430" height="932" alt="orders" src="https://github.com/user-attachments/assets/ec31b59e-4425-4182-b64d-15e08ff43dc1" /> <img width="430" height="932" alt="order tracking" src="https://github.com/user-attachments/assets/ec61f86e-e4c9-412a-be6e-5c7558aebb6b" /> | ![favorite](https://github.com/user-attachments/assets/1d3c138e-943c-41ce-b901-8b33e3149aed) |

---

## 🤝 Contributing

Contributions are very welcome! Here's how to get started:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m 'feat: add your feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a Pull Request

Please follow the existing Clean Architecture patterns, keep use cases single-responsibility, and make sure `flutter analyze` passes with no warnings before submitting.

---

## 📬 Social Links

<div align="center">

[![GitHub](https://img.shields.io/badge/GitHub-@manarghareeb-181717?logo=github)](https://github.com/manarghareeb)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?logo=linkedin)](https://linkedin.com/in/manar-ghareeb)
[![Email](https://img.shields.io/badge/Email-Contact%20Me-D14836?logo=gmail)](mailto:manarghareeb1973@email.com)

</div>

---

<div align="center">

Made with ❤️ and Flutter · Fresh produce, clean code 🍊🍇🍓

</div>
