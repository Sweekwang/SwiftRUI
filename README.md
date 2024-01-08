<h1 align="center">
  SwiftRUI
</h1>

<br>

<p align="center">SwiftRUI is an innovative library of SwiftUI components designed to accelerate 
the development of new applications.
</p>

<p align="center">
    <a href=""><b>Website (Coming)</b></a> •
    <a href="https://axios-http.com/docs/intro"><b>Documentation (Coming)</b></a>
</p>

<br>

## Table of Contents
  - [Introduction](#introduction)
  - [Key Features](#key-features)
  - [Installation](#Installation)
  - [Usage](#Usage)
    - [Example Usage](#Example-Usage)
    - [Documentation](#Documentation)
  - [Contributing](#Contributing)
  - [Stay Tuned](#Stay-Tuned)

## Introduction
SwiftRUI is an innovative library of SwiftUI components designed to accelerate 
the development of new applications. Our goal is to provide a robust and versatile toolkit that 
simplifies the UI/UX design process for Swift developers.

As of now, SwiftRUI is in its beta phase. We are actively working on expanding and refining our 
component library. While a stable release isn't available yet, we encourage you to explore our beta 
version and contribute to its evolution. Your feedback and contributions during this phase are 
invaluable in shaping a library that truly meets the needs of the Swift developer community.

### Key Features
  - <b>Comprehensive Component Library</b>: A growing collection of SwiftUI components that are versatile and easy to customize.
  - <b>SwiftUI-Focused</b>: Tailored specifically for SwiftUI, ensuring seamless integration with your Swift projects.
  - <b>Beta Access</b>: Early access to new features and components, allowing you to stay ahead in SwiftUI development.
  
## Installation
SwiftUI is only available in Swift Package Manager and it is not available in CocoaPods and Carthage.

### Swift Package Manager
The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the 
distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding Alamofire as a dependency is as easy. Click on 
`File` > `Add Packages...` > Paste the url `https://github.com/Sweekwang/SwiftRUI.git` to the 
search box > Dependency Rule type main.

## Usage
Using SwiftRUI components in your SwiftUI projects is straightforward and intuitive. To maintain 
clarity and consistency, all components in the SwiftRUI library are prefixed with RUI-. T
his distinctive prefix serves a dual purpose:

### Example Usage:
Coming Soon.

### Documentation
Coming Soon.

    
## Layout (OutDated)

### RUIFStack (FStack)

`RUIFStack` is a view that arranges its subviews that take up the whole parent view. You can state how do you want to arrange in the vertical and horizontal line. This view is useful when you want to create an overlay that cover the whole view. 

The following example shows a Text view places at the top leading corner with a black background at the back the cover the whole parent view:

<details>
<summary>Usage guide</summary>
  
```
RUIFStack(verticalAlignment: .top,
          horizontalAlignment: .leading) {
    Text("Hello  World!")
         .padding(24)
         .background(.white)
         .cornerRadius(18)
         .padding(12)
}
.background(
    .black
    .opacity(0.4)
)
```

</details>



## Layout (OutDated)

### RUIFStack (FStack)

`RUIFStack` is a view that arranges its subviews that take up the whole parent view. You can state how do you want to arrange in the vertical and horizontal line. This view is useful when you want to create an overlay that cover the whole view. 

The following example shows a Text view places at the top leading corner with a black background at the back the cover the whole parent view:

<details>
<summary>Usage guide</summary>
  
```
RUIFStack(verticalAlignment: .top,
          horizontalAlignment: .leading) {
    Text("Hello  World!")
         .padding(24)
         .background(.white)
         .cornerRadius(18)
         .padding(12)
}
.background(
    .black
    .opacity(0.4)
)
```

</details>

# Buttons (OutDated)
## Buttons Styles
Buttons styles enable you to have highly customized buttons by using `buttonStyle` modifier instead of using fixed componets

### RoundedCornerButtonStyle
RoundedCornerButtonStyle conforms to `ButtoneStyle` which creates a button that covered the whole width available with a deafult `blue` background and a `cornerRadius` of `4`. 

RoundedCornerButtonStyle offers loading state and disable stats color. When `isLoading` is changed to true, it displays a loading indicator and change the `.disable` modifier which will change to disable background colors.

**Properties:**
Properties are arranged in the order in which you should place when declaring.

| Properties | Type | Default Values |
| -- | -- | -- |
| isFullWidth | Bool | true |
| backgroundColor | Color | .blue |
| borderColor | Color | .blue |
| lineWidth | CGFloat | 1.0 |
| padding | RUIPadding | RUIPadding(vertical: 12, horizontal: 16) |
| cornerRadius | CGFloat | 4 |
| isLoading |  Binding<Bool> | .constant(false) |
| loaderTintColor | Color | .white |
| disabledBackgroundColor | Color | Color(uiColor: UIColor.systemGray3) |
| disabledBorderColor | Color | Color(uiColor: UIColor.systemGray3) |
| disabledTintColor | Color? | nil |


**Example:**

```
Button {
    isLoading.toggle()
} label: {
    Text("Text")
        .foregroundColor(.white)
}
.buttonStyle(
    RoundedCornerButtonStyle()
)
```

#### Loading state
When `isLoading` is true, it will display a loading indicator add the middle. The example below has a loading indicator of red color.


```
Button {
    isLoading.toggle()
} label: {
    Text("Text")
        .foregroundColor(.white)
}
.buttonStyle(
    RoundedCornerButtonStyle(
        isLoading: $isLoading,
        loaderTintColor: .red
    )
)
```

#### Disable state
When the buttons are disabled, the background color and border color used are `disabledBackgroundColor` and `disabledBorderColor`. Moreover, you can also change the loading indicator tint color `disabledTintColor`.

```
Button {
    isLoading.toggle()
} label: {
    Text("Text")
        .foregroundColor(.black)
}
.buttonStyle(
    RoundedCornerButtonStyle(
        disabledBackgroundColor: .flatBlue,
        disabledBorderColor: .flatBlue
    )
)
.disabled(true)
```


### deprecated: Rounded Corner Text Button (RUIRoundedCornerTextButton)
Button that contains only text in the middle. The button can be filled or outlined.


Rounded corner button filled with the background color of white with a text in the middle, `"login"`. The font size is changed to 20 and when the user clicked on it, it will print `hello world` to the console.
```
RUIRoundedCornerTextButton(
  text: "Login",
  font: .system(size: 20),
  action: { print("Hello world") })
```

Rounded corner button changed to outlined.
```
RUIRoundedCornerTextButton(
  text: "I'm looking for a tutee",
  type: .outlined,
  action: { })
```

## Contributing
We welcome contributions from the developer community! Whether it's suggesting new features, 
reporting bugs, or improving documentation, your input is crucial for the growth of SwiftRUI.

## Stay Tuned
- Website: Our official website is under construction and will be your go-to resource for all things SwiftRUI. Stay tuned!
- Documentation: Comprehensive documentation is on the way, which will provide in-depth guidance on leveraging SwiftRUI to its fullest.

Thank you for your interest in SwiftRUI. Together, we're building something amazing for the Swift developer community!


