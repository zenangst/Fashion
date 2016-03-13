public protocol Stylesheet {

  func register<T: Styleable>(name: String, stylization: T -> Void)
}

extension Stylesheet {

  public func register<T: Styleable>(style: String, stylization: T -> Void) {
    Stylist.shared.register(style, stylization: stylization)
  }
}
