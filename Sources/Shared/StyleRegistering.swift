public protocol StyleRegistering {

  func register<T: Styleable>(name: String, stylization: T -> Void)
}
