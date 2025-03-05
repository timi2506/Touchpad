
<p align="right">
  <img align="right" height="140" src="https://github.com/timi2506/RAW-files-i-need-for-stuff/blob/main/TouchPadExample.png?raw=true" alt="Touchpad Logo" style="float: right; border-radius: 10px;"/>
</p>

<h1 align="left">Touchpad</h1>
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Ftimi2506%2FTouchpad%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/timi2506/Touchpad)
## Showcase
Examples of this Package can be seen in [this Example Project](https://github.com/timi2506/Touchpad-Example).

## Installation
### Using Xcode's built-in Package Manager 
Go to File > Add Package Dependencies...

then, in the Search-Bar enter: 

```https://github.com/timi2506/Touchpad.git``` 

and press "Add Package" and make sure to link it to your target.
<img width="362" alt="Screenshot 2025-03-04 at 11 16 34" src="https://github.com/user-attachments/assets/8b3672b9-9345-4d6b-9b0d-26d03bd189c7" />

## Usage
### Examples
**TouchpadView**
```swift
TouchpadView(buttons: [
   TouchpadButton(id: "button1", text: "Button1", symbolName: "apple.logo", boundaries: CGRect(x: 100, y: 100, width: 100, height: 100), action: {
        print("button 1 pressed")
    })
], touchPadLabel: "Touchpad")
```
**Recommended Usecases:**
- ✅ in NavigationLinks
- ✅ in Sheets
- ❌ inside another View

**TouchpadButton**

```swift
TouchpadButton(id: "button1", text: "Button1", symbolName: "apple.logo", boundaries: CGRect(x: 100, y: 100, width: 100, height: 100), action: {
    print("button 1 pressed")
})
```

- **id** *Required*
  - A String used to identify each button, make SURE the id is unique and only used in one button
- **text** *Semi-Optional*
  - A String used in the Buttons Text Element
- **symbolName** *Semi-Optional*
  - The SwiftUI Symbol Name as String to use in the Buttons Image
- **boundaries** *Required*
  - a CGRect that defines the location (coordinates: x and y) of the button and the tapArea(width and height) that the cursor has to be in to register a button tap and the frame the button is in.
- **action** *Semi-Optional*
  - The Action that gets executed when the button is clicked with the cursor
- **border** *Required*
  - Bool that toggles showing a border of the tapArea
- **borderColor** *Optional - defaults to red*
  - Color of the Border
- **borderRadius** *Optional - defaults to 0*
  - CGFloat of the BorderRadius
 
***Optional*** means it can be nil without causing issues

***Semi-Optional*** means that you have to define AT LEAST ONE Semi Optional Value, the rest can be nil if not needed

***Required*** means you NEED to define this value and it cant be nil
## Issues or Questions

If you have any issues or questions feel free to open an [issue](https://github.com/timi2506/Touchpad/issues/new/choose) or contact me on [Twitter](https://x.com/timi2506)

## Requirements
- macOS 12+
- iOS 15+
