#  Theme
The `Theme` struct is a pivotal component of SwiftRUI, specifically crafted to provide a unified 
and customizable color scheme for the user interface in SwiftUI applications. By default, Theme 
is implicitly applied to all components within SwiftRUI, ensuring a consistent look and feel 
throughout your app.

## Table of Contents
  - [Default Application](#default-application)
  - [Customization of Theme](#customization-of-theme)
  - [Usage of Theme on your components or app](#usage-of-theme-on-your-components-or-ap)
  - [API References](api-references)
    - [`Theme()`](#theme-1)

## Default Application
- Automatic Integration: `Theme` is automatically used in all SwiftRUI components. If no specific 
colors are stated in your component, the Theme’s default or customized colors will be applied.
- Consistent Aesthetics: This default application helps maintain a cohesive visual experience, 
with consistent color usage across all UI elements.

## Customization of Theme
Modifying the `Theme` allows you to easily change the color scheme of the SwiftUI Components.
If your app also used Theme, it will also affecting all components that use Theme colors.

You can easily apply the your custom theme to your entire application or compomenets. 

1) Declare the custom theme at the top level of your app using `.environment`.
Refer to [Theme API](#Theme) to see the parameter that you can change. 

```
import SwiftRUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.theme, Theme(primaryColor: .orange, secondaryColor: .lightGray, backgroundColor: .white))
        }
    }
}

```

## Usage of Theme on your components or app
Leverage the Theme within individual components or across all your app by accessing the theme properties directly. 
This ensures that your components are always in sync with the overall color scheme of your app.

```
@Environment(\.theme) var theme: Theme

var body: some View {
    Text("SwiftRUI Rocks!")
        .foregroundColor(theme.primaryColor)
}

```


## API References:
### `Theme()`

Initializes a new theme with specified colors.
    - Parameters:
        - accentColor: The color used for accenting or highlighting elements in the UI. Default is blue.
        - primaryColor: The primary color of the UI, used in major elements like headers or primary buttons. Default is black.
        - secondaryColor: The secondary color of the UI, used in elements of lesser importance. Default is white.
        - backgroundColor: The general background color of the UI. Default is white.
        - errorBackgroundColor: The background color used for displaying error states or messages. Default is red.
        - warningBackgroundColor: The background color used for warning states or messages. Default is yellow.
        - successBackgroundColor: The background color used for success states or messages. Default is green.
        - onPrimaryColor: The color used for text or icons on top of primaryColor elements. Default is white.
    
```
    public init(accentColor: Color = .blue,
                primaryColor: Color = .black,
                secondaryColor: Color = .white,
                backgroundColor: Color = .white,
                errorBackgroundColor: Color = .red,
                warningBackgroundColor: Color = .yellow,
                successBackgroundColor: Color = .green,
                onPrimaryColor: Color = .white)
```

## Contributing
We encourage contributions to the Theme struct and SwiftRUI as a whole. Whether it’s suggesting 
enhancements, reporting bugs, or improving documentation, your input is invaluable in refining 
SwiftRUI for the developer community.
