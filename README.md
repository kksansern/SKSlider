
# SKSlider

Simple Custom UISlider

## Features

- [x] Easily use UISlider

## Installation

you can copy SKSlider folder into your project manually.

## Requirements

- iOS 9.0+ 
- Swift 4.2

## How to use

Using by UIView
```swift
//Create UIView and change class to be SKSliderView
@IBOutlet var skSlider: SKSliderView!

skSlider.setTrackLine(height: 10) //CGFloat
skSlider.setMaximumTrackLine(color: .lightGray) //UIColor
skSlider.setMinimumTrackLine(color: .green) //UIColor
skSlider.setup( minValue: 100, //Float
                maxValue: 1000, //Float
                thumbImage: UIImage(named: "thumb_normal"), //UIImage
                didValueChange: didSliderValueChange) //(_ value: Float) -> Void

```

if you need to custom by your self without view container, you can use SKCustomslider as UISlider