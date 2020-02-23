# DotPager

DotPager is an image paging library made with SwiftUI
<p align="center">
    <img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platforms" />
    <img src="https://img.shields.io/badge/Swift-5-orange.svg" />
    <a href="https://github.com/yotsu12/DotPager/blob/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>
<center>
<img src="DotPager.gif"/>
</center>

## Usage
```swift
struct ContentView: View {
    
    let images: [Image]
    
    var body: some View {
        GeometryReader { geometry in
            DotPager(
            self.images,
            contentWidth: geometry.size.width,
            contentHeight: 300.0,
            contentMode: .fill,
            thresholdType: .harf) { image in
                image
            }
        }
    }
}
```

## Installation

`DotPager` is available via [Swift Package Manager](https://swift.org/package-manager).

Using Xcode 11, go to `File -> Swift Packages -> Add Package Dependency` and enter [https://github.com/yotsu12/DotPager](https://github.com/yotsu12/DotPager) 