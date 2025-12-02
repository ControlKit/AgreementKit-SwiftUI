# AgreementKit SwiftUI <img src='https://github.com/maziar/ReadmeFiles/blob/main/AgreementKit.svg' width='30'/>

A powerful and customizable iOS SDK for displaying Terms of Service and Privacy Policy agreements with **SwiftUI** support. Built with modern SwiftUI architecture, this SDK provides a complete, production-ready solution that handles agreement screens with minimal code integration.

> **📱 Looking for UIKit version?** Check out the [UIKit version](https://github.com/ControlKit/AgreementKit) of AgreementKit.

## 🚀 Why AgreementKit SwiftUI?

**Save Time & Focus on Your Core Features**

Instead of spending hours building custom agreement screens, AgreementKit SwiftUI provides a complete, production-ready solution that handles:

- ✅ **SwiftUI Native** - Built entirely with SwiftUI for modern iOS apps
- ✅ **Multi-language support** - Automatically adapts to user's language preferences
- ✅ **Customizable UI** - Dark and light mode themes with full customization options
- ✅ **Server-side content management** - Update terms without app store releases
- ✅ **Compliance ready** - Built-in accept/decline functionality
- ✅ **Easy integration** - Get started with just a few lines of code
- ✅ **Professional appearance** - Polished UI that matches modern app standards
- ✅ **Declarative API** - Clean SwiftUI view modifiers and async/await support

## 📱 What is AgreementKit SwiftUI?

AgreementKit SwiftUI is the SwiftUI-native version of AgreementKit, designed specifically for modern iOS applications built with SwiftUI. It provides a complete solution for displaying legal agreements to users, collecting their consent, and managing the user experience around compliance requirements.

### Key Benefits:

- **Time Saving**: Eliminate weeks of development time for agreement screens
- **Compliance**: Ensure your app meets legal requirements for user consent
- **Consistency**: Maintain consistent agreement UI across all your apps
- **Flexibility**: Customize appearance and behavior to match your brand
- **Maintenance**: Update agreement content server-side without app updates
- **Modern Architecture**: Built with SwiftUI, async/await, and modern Swift patterns

## 🛠 Installation

### Swift Package Manager

Add AgreementKit SwiftUI to your project using Swift Package Manager:

1. In Xcode, go to **File → Add Package Dependencies**
2. Enter the repository URL: `https://github.com/ControlKit/AgreementKit-SwiftUI.git`
3. Select the version and add to your target

### CocoaPods

Add this line to your `Podfile`:

```ruby
pod 'AgreementKit-SwiftUI'
```

Then run:

```bash
pod install
```

## 📖 Quick Start

### SwiftUI Usage (Recommended)

The simplest way to integrate AgreementKit in your SwiftUI app:

```swift
import SwiftUI
import AgreementKit-SwiftUI

struct ContentView: View {
    @State private var showAgreement = false
    private let agreementKit = AgreementKit()
    
    var body: some View {
        VStack {
            Button("Show Agreement") {
                showAgreement = true
            }
        }
        .sheet(isPresented: $showAgreement) {
            if let agreementView = await agreementKit.configure(config: config) {
                agreementView
            }
        }
    }
    
    private var config: AgreementServiceConfig {
        AgreementServiceConfig(
            style: .darkMode,
            name: "MyApp",
            appId: "your-app-id",
            language: .english
        )
    }
}
```

### Using View Modifier (Even Simpler)

For an even cleaner approach, use the built-in view modifier:

```swift
import SwiftUI
import AgreementKit-SwiftUI

struct ContentView: View {
    @State private var showAgreement = false
    private let agreementKit = AgreementKit()
    
    var body: some View {
        VStack {
            Button("Show Agreement") {
                showAgreement = true
            }
        }
        .agreementSheet(
            isPresented: $showAgreement,
            agreementKit: agreementKit,
            config: AgreementServiceConfig(
                style: .darkMode,
                name: "MyApp",
                appId: "your-app-id",
                language: .english
            )
        )
    }
}
```

### Programmatic Presentation

You can also present the agreement view programmatically:

```swift
import SwiftUI
import AgreementKit-SwiftUI

struct ContentView: View {
    @State private var agreementView: AgreementViewWrapper?
    
    var body: some View {
        VStack {
            Button("Show Agreement") {
                Task {
                    let config = AgreementServiceConfig(
                        style: .darkMode,
                        name: "MyApp",
                        appId: "your-app-id",
                        language: .english
                    )
                    agreementView = await agreementKit.configure(config: config)
                }
            }
        }
        .sheet(item: $agreementView) { view in
            view
        }
    }
}
```

## 🎨 Customization Options

### View Styles

AgreementKit SwiftUI supports two built-in themes:

```swift
// Dark Mode (Default)
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .english
)

// Light Mode
let config = AgreementServiceConfig(
    style: .lightMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .english
)
```

### Custom Styling

Full control over appearance using SwiftUI types:

```swift
let viewConfig = AgreementViewConfig(lang: .english)

// Colors (SwiftUI Color)
viewConfig.contentViewBackColor = Color(.systemBackground)
viewConfig.agreementColor = Color(.label)
viewConfig.termsColor = Color.blue
viewConfig.acceptButtonBackColor = Color.green
viewConfig.declineButtonBackColor = Color.clear

// Fonts (SwiftUI Font)
viewConfig.agreementFont = Font.system(size: 18, weight: .medium)
viewConfig.termsFont = Font.system(size: 24, weight: .bold)
viewConfig.acceptButtonFont = Font.system(size: 16, weight: .semibold)

// Button Styling
viewConfig.acceptButtonRadius = 12.0
viewConfig.acceptButtonBorderWidth = 2.0
viewConfig.declineButtonRadius = 12.0

// Apply custom config
let serviceConfig = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .english
)
serviceConfig.viewConfig = viewConfig
```

### Advanced Customization Example

```swift
import SwiftUI
import AgreementKit-SwiftUI

struct CustomAgreementView: View {
    @State private var showAgreement = false
    private let agreementKit = AgreementKit()
    
    var body: some View {
        Button("Show Custom Agreement") {
            showAgreement = true
        }
        .sheet(isPresented: $showAgreement) {
            if let agreementView = await agreementKit.configure(config: customConfig) {
                agreementView
            }
        }
    }
    
    private var customConfig: AgreementServiceConfig {
        let viewConfig = AgreementViewConfig(lang: .english)
        
        // Customize appearance
        viewConfig.style = .lightMode
        viewConfig.contentViewBackColor = Color(.systemBackground)
        viewConfig.agreementFont = Font.system(size: 20, weight: .bold)
        viewConfig.termsFont = Font.system(size: 28, weight: .heavy)
        viewConfig.acceptButtonBackColor = Color.blue
        viewConfig.acceptButtonTitleColor = .white
        viewConfig.declineButtonBorderColor = Color.red
        viewConfig.declineButtonTitleColor = Color.red
        
        // Customize content
        viewConfig.agreement = "User Agreement"
        viewConfig.terms = "Terms & Conditions"
        viewConfig.acceptButtonTitle = "I Agree"
        viewConfig.declineButtonTitle = "Cancel"
        
        // Custom terms description (supports HTML)
        viewConfig.termsDescription = """
        Welcome to MyApp! By using this application, you agree to the following terms:
        
        1. **Data Usage**: We collect minimal data to improve your experience
        2. **Privacy**: Your information is protected according to our privacy policy
        3. **Updates**: We may update these terms and will notify you of changes
        4. **Support**: Contact us at support@myapp.com for any questions
        
        Thank you for choosing MyApp!
        """
        
        let serviceConfig = AgreementServiceConfig(
            style: .lightMode,
            name: "MyApp",
            appId: "com.mycompany.myapp",
            language: .english
        )
        serviceConfig.viewConfig = viewConfig
        
        return serviceConfig
    }
}
```

### Multi-Language Support

AgreementKit SwiftUI automatically handles multiple languages with comprehensive localization:

```swift
// English
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .english
)

// Spanish
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .spanish
)

// French
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .french
)

// German
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .german
)

// Chinese
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .chinese
)

// Japanese
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .japanese
)
```

**Supported Languages**: English, Spanish, French, German, Italian, Portuguese, Dutch, Russian, Chinese, Japanese, Korean, Arabic

## 🔧 Configuration Reference

### AgreementServiceConfig

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `style` | `AgreementViewStyle` | UI theme (dark/light mode) | `.darkMode` |
| `name` | `String` | Your app name | Required |
| `appId` | `String` | Your app identifier | Required |
| `language` | `CKLanguage` | Display language | Required |
| `sdkVersion` | `String` | SDK version | Auto-detected |
| `viewConfig` | `AgreementViewConfig` | Custom view configuration | Auto-generated |

### AgreementViewConfig

| Property | Type | Description |
|----------|------|-------------|
| `contentViewBackColor` | `Color` | Background color |
| `agreementFont` | `Font` | Agreement title font |
| `termsFont` | `Font` | Terms title font |
| `acceptButtonBackColor` | `Color` | Accept button background |
| `declineButtonBackColor` | `Color` | Decline button background |
| `acceptButtonRadius` | `CGFloat` | Accept button corner radius |
| `declineButtonRadius` | `CGFloat` | Decline button corner radius |
| `acceptButtonBorderWidth` | `CGFloat` | Accept button border width |
| `declineButtonBorderWidth` | `CGFloat` | Decline button border width |

## 🌐 Server Integration

AgreementKit SwiftUI integrates with your backend to fetch agreement content:

### API Endpoints

The SDK automatically calls your agreement endpoint with:

```http
GET /agreement
Headers:
  x-app-id: your-app-id
  x-sdk-version: 1.0.0
  x-version: 1.0.0
  x-device-uuid: device-uuid

Body:
{
  "name": "MyApp"
}
```

### Response Format

Your server should return:

```json
{
  "data": {
    "id": "agreement-id",
    "agreement_title": [
      {
        "language": "en",
        "content": "User Agreement"
      }
    ],
    "title": [
      {
        "language": "en", 
        "content": "Terms of Service"
      }
    ],
    "description": [
      {
        "language": "en",
        "content": "Your terms content here... (HTML supported)"
      }
    ],
    "accept_button_title": [
      {
        "language": "en",
        "content": "Accept"
      }
    ],
    "decline_button_title": [
      {
        "language": "en",
        "content": "Decline"
      }
    ],
    "version": 1,
    "created_at": "2024-01-01T00:00:00.000000Z"
  }
}
```

## 📱 Requirements

### iOS Version
- **Minimum iOS**: 13.0+
- **Recommended iOS**: 15.0+ (for full SwiftUI features)
- **Xcode**: 12.0+
- **Swift**: 5.3+

### Supported Languages
AgreementKit SwiftUI supports multiple languages out of the box:

- 🇺🇸 **English** (`.english`)
- 🇪🇸 **Spanish** (`.spanish`) 
- 🇫🇷 **French** (`.french`)
- 🇩🇪 **German** (`.german`)
- 🇮🇹 **Italian** (`.italian`)
- 🇵🇹 **Portuguese** (`.portuguese`)
- 🇳🇱 **Dutch** (`.dutch`)
- 🇷🇺 **Russian** (`.russian`)
- 🇨🇳 **Chinese** (`.chinese`)
- 🇯🇵 **Japanese** (`.japanese`)
- 🇰🇷 **Korean** (`.korean`)
- 🇦🇷 **Arabic** (`.arabic`)

### Device Support
- **iPhone**: All models running iOS 13.0+
- **iPad**: All models running iPadOS 13.0+
- **iPod Touch**: 7th generation and later

## 🔗 Dependencies

- **ControlKitBase**: Core networking and base functionality
- **SwiftUI**: iOS user interface framework
- **Foundation**: Core Swift framework
- **Combine**: Reactive programming framework (iOS 13+)

## 🔄 Platform Versions

AgreementKit is available for multiple platforms and frameworks:

### iOS Platforms

- **SwiftUI Version** (This Repository): Built with SwiftUI for modern iOS apps
  - Repository: [AgreementKit-SwiftUI](https://github.com/ControlKit/AgreementKit-SwiftUI)
  - Framework: SwiftUI
  - Best for: New projects, SwiftUI apps, iOS 13+

- **UIKit Version**: Built with UIKit for traditional iOS apps
  - Repository: [AgreementKit](https://github.com/ControlKit/AgreementKit)
  - Framework: UIKit
  - Best for: Legacy projects, UIKit apps, iOS 13+

### Android Platform

- **Android Version**: Built with Kotlin and Jetpack Compose
  - Repository: [AgreementKit-android](https://github.com/ControlKit/AgreementKit-android)
  - Framework: Jetpack Compose / View System
  - Best for: Android apps, Kotlin projects

All versions provide the same functionality and API design, ensuring consistent user experience across platforms.

## 🆚 SwiftUI vs UIKit

### When to Use SwiftUI Version (This Repository)

- ✅ Building new iOS apps with SwiftUI
- ✅ Modernizing existing apps to SwiftUI
- ✅ Prefer declarative UI patterns
- ✅ Want async/await support
- ✅ Need SwiftUI-specific features

### When to Use UIKit Version

- ✅ Maintaining legacy UIKit apps
- ✅ Need UIKit-specific customization
- ✅ Working with existing UIKit codebase
- ✅ Require UIKit view controller lifecycle

Both versions are actively maintained and provide the same core functionality.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request to our [GitHub repository](https://github.com/ControlKit/AgreementKit-SwiftUI).

## 📞 Support

For support, email support@agreementkit.com or create an issue on [GitHub](https://github.com/ControlKit/AgreementKit-SwiftUI).

## 🎯 Roadmap

- [x] SwiftUI support ✅
- [ ] Additional themes
- [ ] Analytics integration
- [ ] Custom animations
- [ ] Accessibility improvements
- [ ] macOS support
- [ ] watchOS support

## 🔗 Related Repositories

- **UIKit Version**: [https://github.com/ControlKit/AgreementKit](https://github.com/ControlKit/AgreementKit)
- **Android Version**: [https://github.com/ControlKit/AgreementKit-android](https://github.com/ControlKit/AgreementKit-android)

---

**Made with ❤️ for iOS developers who value their time**
