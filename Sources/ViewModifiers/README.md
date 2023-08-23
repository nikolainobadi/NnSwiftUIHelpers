# View Modifiers - Conditionals

This document describes the conditional view modifiers provided in this package. These modifiers allow developers to conditionally apply modifications to SwiftUI views.

## Table of Contents
### Conditionals
- [Conditional Border Overlay](#conditional-border-overlay)
- [Conditional Display](#conditional-display)
- [Conditional Empty List View](#conditional-empty-list-view)
- [Conditional Modal View](#conditional-modal-view)

### NavBar
- [NavBar Button](#navBar-button)
- [Nav Title](#nav-title)
- [Navigation Stack](#navigation-stack) (Available from iOS 16.0)


### Conditional Border Overlay

Adds a border overlay to a view based on a condition. Customize it with specific colors and corner radii.
```swift
struct ContentView: View {
    @State private var text = ""
    @State private var error: Error?
    
    private let cornerRadius: CGFloat = 10
    
    var body: some View {
        VStack {
            TextField("", text: $text)
                .cornerRadius(corderRadius)
                .withBorderOverlay(error != nil, color: .red, corderRadius: corderRadius)
            
            // remaining views
        }
    }
}
```

### Conditional Display

Conditionally displays the content of the view, either showing or hiding it based on the provided condition.
```swift
struct ContentView: View {
    let isPro: Bool
    
    var body: some View {
        VStack {
            ProHeaderView()
                .onlyShow(when: isPro)
                
            // remaining views
        }
    }
}
```

### Conditional Empty List View

Displays a custom empty list view based on a condition, offering customizable titles and messages.
```swift
struct MyListView: View {
    let items: [MyItem]
    
    var body: some View {
        List(items) { item in
            ItemRow(item)
        }
        .withEmptyListView(listEmpty: items.isEmpty, title: "No Items", message: "Please add some items to your list.")
    }
}
```

### Conditional Modal View

Presents a modal view conditionally with customizable dimensions, background color, and corner radius WITHOUT requiring an additional ViewController to be pushed on the navigation stack (unlike .sheet).
```swift
struct MyListView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Vstack {
            // subviews
        }
        .modal(isPresented: $showingAlert, width: 300, height: 400, backgroundColor: .white, cornerRadius: 20) {
            // your modal view (no navigation stack required to show over current view)
        }
    }
}
```

### NavBar Button

Adds a button to the navigation bar. You can place it in various positions and define the button content as either text or an image.
```swift
struct MyNestedView: View {
    var body: some View {
        Vstack {
            // subviews
        }
        .withNavBarButton(placement: .navigationBarLeading, buttonContent: .text("cancel"), action: { /* Your action code here */ })
        .withNavBarButton(placement: .navigationBarTrailing, buttonContent: .image("plus"), action: { /* Your action code here */ })
    }
}
```

### Nav Title

Allows for customization of the navigation title with a custom view. It replaces the standard title with any view you provide.
```swift
struct MyNestedView: View {
    var body: some View {
        Vstack {
            // subviews
        }
        .withNavTitle(YourCustomTitleView())
    }
}
```

Navigation Stack (Available from iOS 16.0)

Allows for navigation stack manipulation. It can be used to create a stack of navigation paths and navigate between them. The title of the navigation bar can be set as a string or a custom header view.
```swift
struct MyView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        Vstack {
            // subviews
        }
        .withNavStack(path: $path, title: .left("Title"))
    }
}
```

