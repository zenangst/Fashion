import UIKit
import Makeup

struct TestEmptyStylesheet: Stylesheet {

  init() {}
  func define() {}
}

struct TestStylesheet: Stylesheet {

  let style = "red-button"

  init() {}

  func define() {
    register(style, stylization: { (button: UIButton) in
      button.backgroundColor = UIColor.redColor()
    })
  }
}

class Button: UIButton {
  override var backgroundColor: UIColor? {
    didSet {
    }
  }
}
