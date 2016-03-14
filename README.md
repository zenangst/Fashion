![Makeup](https://github.com/vadymmarkov/Makeup/blob/master/Resources/MakeupPresentation.png)

[![CI Status](http://img.shields.io/travis/vadymmarkov/Makeup.svg?style=flat)](https://travis-ci.org/vadymmarkov/Makeup)
[![Version](https://img.shields.io/cocoapods/v/Makeup.svg?style=flat)](http://cocoadocs.org/docsets/Makeup)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Makeup.svg?style=flat)](http://cocoadocs.org/docsets/Makeup)
[![Platform](https://img.shields.io/cocoapods/p/Makeup.svg?style=flat)](http://cocoadocs.org/docsets/Makeup)

## Description

**Makeup** is your helper to share and reuse UI styles in a Swift way. The
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

Makeup.register([MainStylesheet()])

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

**Makeup** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Makeup'
```

**Makeup** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "vadymmarkov/Makeup"
```

## Author

Vadym Markov, markov.vadym@gmail.com

## Contributing

We would love you to contribute to **Makeup**, check the [CONTRIBUTING](https://github.com/vadymmarkov/Makeup/blob/master/CONTRIBUTING.md) file for more info.

## License

**Makeup** is available under the MIT license. See the [LICENSE](https://github.com/vadymmarkov/Makeup/blob/master/LICENSE.md) file for more info.
