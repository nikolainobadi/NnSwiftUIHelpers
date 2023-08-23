# NnSwiftUIHelpers

NnSwiftUIHelpers is a collection of Swift extensions, view modifiers, and utilities designed to streamline development and create more readable code.

## Table of Contents
1. [Installation](#installation)
2. [Usage](#usage)
   1. [Extensions](./Sources/Extensions/README.md)
   2. [View Modifiers](./Sources/ViewModifiers/README.md)
3. [License](#license)

## Installation
To add the `NnSwiftUIHelpers` package to your Swift project, follow these steps:

1. **Open Your Project in Xcode**: Launch your project in Xcode.
2. **Navigate to the Project Settings**: Select your project in the Project Navigator, then click on your target and navigate to the "Swift Packages" tab.
3. **Add a New Swift Package**: Click the "+" button to add a new Swift Package.
4. **Enter the Package Repository URL**: Paste the following URL into the repository URL text field:
```
https://github.com/nikolainobadi/NnSwiftUIHelpers
```

5. **Choose Package Options**: Select the version rules you'd like to adhere to. If you want to use version 1.0.0 or above, you can set the version requirements accordingly.
6. **Add the Package**: Click "Next" and "Finish" to complete the addition of the package to your project.

Alternatively, if you're managing your project with a `Package.swift` file, you can manually add the dependency by including the following line in the `dependencies` array:
```swift
dependencies: [
    .package(url: "https://github.com/nikolainobadi/NnSwiftUIHelpers", from: "1.0.0")
]
```

## Usage

- **[Extensions](./Sources/Extensions/README.md)**: Extending functionalities such as Array, Date, DispatchQueue, Publisher, String, View.
- **[View Modifiers](./Sources/ViewModifiers/README.md)**: A collection of view modifiers for SwiftUI development.

## License

NnSwiftUIHelpers is available under the MIT license. See the LICENSE file for more details.
