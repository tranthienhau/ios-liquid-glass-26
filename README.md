# ios-liquid-glass-26

Native iOS 26 Liquid Glass / material-style UI POC. Demonstrates the new
`.glassEffect()` API, glass material backgrounds, fluid animated transitions,
matchedGeometry hero transitions, depth/shadow stacking, and a learning-app
home screen built around glass cards.

## Stack

- Swift 6 / Swift Concurrency
- SwiftUI (iOS 26+)
- iOS 26 Liquid Glass APIs: `.glassEffect()`, `glassBackgroundEffect`, capsule glass
- matchedGeometryEffect for hero transitions
- Spring animations, scrollTransition, visualEffect
- Swift Package Manager (modular project)

## Screens

- **Home** - glass nav bar, hero featured-course glass card, glass category capsules
- **Course detail** - matchedGeometry hero, content card with glass material
- **Player** - floating glass controls, blurred glass background
- **Settings** - glass list rows, animated glass tab bar

## Architecture

- `Sources/LiquidGlassApp/App.swift` - app entry
- `Sources/LiquidGlassApp/Views/` - SwiftUI screens
- `Sources/LiquidGlassApp/Modifiers/` - reusable glass view modifiers
- `Sources/LiquidGlassApp/Models/` - sample data models

## Build

Open `Package.swift` in Xcode 26+ and run the SwiftUI preview, or wrap into a
host iOS app target. Requires iOS 26 SDK / Xcode 26.

```bash
swift build
```

## Notes

- Liquid Glass adoption follows the iOS 26 Human Interface Guidelines on materials.
- All glass effects degrade gracefully on iOS 25 via `if #available(iOS 26, *)`.
