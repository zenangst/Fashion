public protocol Stylesheet: StyleRegistering {

  func define()
}

public extension Stylesheet {

  public func register<T: Styleable>(style: String, stylization: T -> Void) {
    Stylist.master.register(style, stylization: stylization)
  }
}
