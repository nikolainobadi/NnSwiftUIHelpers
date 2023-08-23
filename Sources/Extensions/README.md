# Extensions in NnSwiftUIHelpers

NnSwiftUIHelpers provides a collection of Swift extensions designed to enhance the functionality of standard Swift types and create more readable and maintainable code.

## Table of Contents
1. [Array](#array)
2. [Date](#date)
3. [DispatchQueue](#dispatchqueue)
4. [String](#string)
5. [View](#view)

### Array

Extensions for removing duplicates from an array.

#### Example Usage

```swift
let array = [1, 2, 2, 3, 3, 4]
let uniqueArray = array.removingDuplicates()
// Result: [1, 2, 3, 4]
```

### Date

Extensions for formatting dates, creating specific dates, and retrieving date-related information.

#### Example Usage
```swift
let date = Date()
let formattedDate = date.formatted(using: .shortDate)
// Result: "08/23/2023"
```

### DispatchQueue & Publisher

Custom scheduler to handle immediate execution on the main queue and publish on main queue

#### Example Usage
```swift
publisher.dispatchOnMainQueue()
```

### String

An extension for removing extra whitespace from a string.

#### Example Usage
```swift
let text = "   Hello,   World!  "
let trimmedText = text.removingExtraWhitespace()
// Result: "Hello, World!"

```

### View

Extensions for working with view dimensions and percentages.

#### Example Usage
```swift
VStack {
    // nested views
}
.frame(maxWidth: getWidthPercent(50), maxHeight: getHeightPercent(90))
// Result: 50% of the screen's width and 90% of the screen's height
```
