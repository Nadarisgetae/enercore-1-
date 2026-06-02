# Enercore: Premium Solar Intelligence & Grid Dashboard

Welcome to **Enercore** (branded as *Verdant Precision* for custom admin interfaces). Enercore is a state-of-the-art, high-fidelity solar intelligence grid management dashboard, telemetry suite, support ticket center, unified billing portal, and monocrystalline hardware marketplace.

The application has been rebuilt using modern Flutter principles, featuring a pixel-perfect premium Light Theme, dynamic custom micro-animations, and unified branding controls.

---

## 🏗️ Architecture & Navigation

Enercore employs a highly decoupled, responsive feature-based architecture divided into clean domain layers.

### 1. Unified Navigation Framework
To guarantee zero redundant navigation contexts and an extremely intuitive user experience, Enercore utilizes two main navigation anchors:

- **Top Navigation Bar (Header)**:
  - Automatically adapts to context: displays a **Back Button** (`Icons.arrow_back_rounded`) on nested screens and cleanly hides it on the **Home Dashboard** page.
  - Features the official high-resolution **Enercore Logo** and the bold typography header (`Enercore`) aligned to the left.
  - Integrates the circular user profile avatar on the right.
- **Bottom Navigation Bar (Footer)**:
  - Standardized across all 6 main routes: **Home**, **Plants**, **Telemetry**, **Billing**, **Tickets**, and **Profile**.
  - Upgraded with a **Material 3-equivalent dynamic pill active indicator**. The currently active tab transforms into a horizontal light-green rounded pill (`Color(0xFFD1FAE5)`) displaying both the icon and label in a row, while other inactive tabs scale down elegantly.

---

## 🎨 Premium Light Theme & Design System

Enercore's aesthetic system has been meticulously designed to look high-end, responsive, and tactile.

- **Primary Colors**: Green-Teal (`#2A8C6E`) as the brand primary tone, representing renewable energy, paired with Emerald accents (`#10B981`).
- **Surface Palette**: Pure white cards (`#FFFFFF`) sitting on a clean, soft neutral background (`#F4F6F8`), styled with modern thin borders (`#E5E7EB`).
- **Typography & Slate**: Slate Dark (`#1E293B`) for bold visual headers and Slate Light (`#64748B`) for helper texts.
- **Tactile Depth**: Elevates cards using subtle, soft blur drop-shadows rather than generic hard elevations:
  ```dart
  boxShadow: [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.03),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ]
  ```

---

## 🌟 Feature Tour

### 📊 1. Home Dashboard
- Key performance metrics are highlighted using modern high-contrast cards with clean sparkline charts.
- Warm yellow-gold telemetry stat gradients highlight solar generation capacities.

### 🌐 2. Solar Plants Grid
- A highly optimized **16x16 interactive grid** showing status indicators for dozens of connected solar cells/modules.
- Features dual-line custom painters supporting solid/dashed trend lines and expandable history data logs.

### ⚡ 3. Live Telemetry Dashboard
- Displays live sensor readings, inverter load grids, and telemetry logs.
- Interactive status widgets, warn banners, slider adjustments, and real-time incident tables.

### 💳 4. Razorpay Secured Billing Suite
- Interactive billing timelines, billing history list, and multiple invoice cards.
- Integrated payment options with Razorpay secured payment button styling.

### 🎫 5. Support & Ticketing System
- Interactive form to submit service requests with priority selectors (High, Medium, Low).
- Ticket detail pages featuring a responsive live support chat flow with custom chat bubbles.

### 🛒 6. Hardware Marketplace (SolarMarket)
- Comprehensive shop showcasing verified photovoltaic modules, solar cables, and equipment.
- Verified seller badges, stock indicator chips, quantity counters, detailed specs sheets, and customer review sections.

### 👤 7. Profile & Settings (Verdant Precision)
- Built directly according to the mockup:
  - **Tabs**: Quick toggle between Profile, Security, and Billing cards.
  - **Personal Details**: Fields to update name, email, phone, company, address, GST, and postal code.
  - **Security Card**: Toggle switch for 2FA and active session trackers (device models, timestamps, locations, and red "Revoke" links).
  - **Theme Selectors**: Custom mockup-identical boxes to preview Light, Dark, and System modes.

---

## 🛠️ Assets & Branding Configuration

Branding tools have been fully integrated into the Flutter native pipeline:

### 📱 1. Custom App Launcher Icon
Managed via `flutter_launcher_icons.yaml`. Generates fully compliant adaptive and round launch icons for Android & iOS from the high-res logo:
```yaml
flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/images/logo.png"
```

### ❄️ 2. Native Boot Splash Screen
Managed via `flutter_native_splash.yaml`. Prevents default Flutter boot logos and replaces them with a native boot screen showing the official logo on a clean `#FFFFFF` background:
```yaml
flutter_native_splash:
  color: "#FFFFFF"
  image: "assets/images/logo.png"
  android_12:
    image: "assets/images/logo.png"
    color: "#FFFFFF"
```

---

## 🚀 Key Commands

### Update Package Dependencies
```bash
flutter pub get
```

### Build App Icons
```bash
flutter pub run flutter_launcher_icons
```

### Build Native Boot Splash
```bash
flutter pub run flutter_native_splash:create
```

### Build Release APK
```bash
flutter build apk --release
```

### Install APK to Connected Device
```bash
flutter install
```
