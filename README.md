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
instance objects of the specified type.

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

    register("red-button") { (button: UIButton) in
      button.backgroundColor = UIColor.redColor()
    }
  }
}

Fashion.register([MainStylesheet()])

//...
let button = UIButton() // let button = UIButton(styles: "red-button")
button.styles = "red-button" // backgroundColor => UIColor.redColor()

let label = UILabel()
addSubview(label) // textColor => UIColor.blueColor()
```

### Stylesheet

`Stylesheet` is a protocol that helps you to organize your styles by registering
them in `define` method:

**Register a style**

```swift
// Registers stylization closure with the specified name.
register("card-view") { (view: UIView) in
  view.backgroundColor = UIColor.whiteColor()
  view.layer.masksToBounds = false
  view.layer.shadowColor = UIColor.blackColor().CGColor
  view.layer.shadowOffset = CGSize(width: 0, height: 0.5)
  view.layer.shadowOpacity = 0.2
  view.layer.cornerRadius = 8
}
```

**Unregister a style**

```swift
// Unregisters stylization closure with the specified name.
unregister("card-view")
```

**Share a style**
The style will be shared across all objects of this type, considering
inheritance.
```swift
// All views will have red background color.
share { (view: UIView) in
  view.backgroundColor = UIColor.redColor()
}

// All table views will have white background color, it overrides the white
// background registered above.
share { (tableView: UITableView) in
  tableView.backgroundColor = UIColor.whiteColor()
  tableView.tableFooterView = UIView(frame: CGRect.zero)
  tableView.separatorStyle = .None
  tableView.separatorInset = UIEdgeInsetsZero
}
```

**Unshare a style**

```swift
// Unregisters shared stylization closure for the specified type.
unshare(UITableView.self)
```

### Stylist

When you register/share your styles in the `Stylesheet` all the actual work is
done by `Stylist`, so if you want more freedom it's possible to use `Stylist`
class directly.

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
