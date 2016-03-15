![Fashion](https://github.com/vadymmarkov/Fashion/blob/master/Resources/FashionPresentation.png)

[![CI Status](http://img.shields.io/travis/vadymmarkov/Fashion.svg?style=flat)](https://travis-ci.org/vadymmarkov/Fashion)
[![Version](https://img.shields.io/cocoapods/v/Fashion.svg?style=flat)](http://cocoadocs.org/docsets/Fashion)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Fashion.svg?style=flat)](http://cocoadocs.org/docsets/Fashion)
[![Platform](https://img.shields.io/cocoapods/p/Fashion.svg?style=flat)](http://cocoadocs.org/docsets/Fashion)

## Description

**Fashion** is your helper to share and reuse UI styles in a Swift way. The
main goal is not to style your native apps in CSS, but use a set of convenience
helper functions to decouple your styles from a layout code. Also here we try to
go beyond the `UIAppearance` possibilities to customize appearance for all
instances objects of the specified type.

## Table of Contents

* [Usage](#usage)
  * [Conventional way](#conventional-way)
  * [Stylesheet](#stylesheet)
  * [Stylist](#stylist)
  * [UIView extensions](#uiview-extensions)
* [Installation](#installation)
* [Author](#author)
* [Contributing](#contributing)
* [License](#license)

## Usage

### Conventional way

```swift
struct MainStylesheet: Stylesheet {

  func define() {
    share { (label: UILabel) in
      label.textColor = UIColor.blueColor()
    }

    register("red-button", stylization: { (button: UIButton) in
      button.backgroundColor = UIColor.redColor()
    })
  }
}

Fashion.register([MainStylesheet()])

//...
let button = UIButton()
button.style = "red-button" // backgroundColor => UIColor.redColor()

let label = UILabel()
addSubview(label) // textColor => UIColor.blueColor()
```

### Stylesheet
```swift
```

### Stylist

```swift
```

### UIView extensions

```swift
```

## Author

Vadym Markov, markov.vadym@gmail.com

## Installation

**Fashion** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Fashion'
```

**Fashion** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "vadymmarkov/Fashion"
```

## Author

Vadym Markov, markov.vadym@gmail.com

## Contributing

We would love you to contribute to **Fashion**, check the [CONTRIBUTING](https://github.com/vadymmarkov/Fashion/blob/master/CONTRIBUTING.md) file for more info.

## License

**Fashion** is available under the MIT license. See the [LICENSE](https://github.com/vadymmarkov/Fashion/blob/master/LICENSE.md) file for more info.
