
<p align="right">
  <img align="right" height="140" src="https://github.com/timi2506/RAW-files-i-need-for-stuff/blob/main/TouchPadExample.png?raw=true" alt="Touchpad Logo" style="float: right; border-radius: 10px;"/>
</p>

<h1 align="left">Touchpad</h1>

## Showcase
Examples of this Package can be seen in this Example Project. (SOON)

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

## Issues or Questions

If you have any issues or questions feel free to open an [issue](https://github.com/timi2506/Touchpad/issues) or contact me on [Twitter](https://x.com/timi2506)
