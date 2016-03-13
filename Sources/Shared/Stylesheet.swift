/// Convenience protocol for all types where you register your styles.
public protocol Stylesheet: StyleManaging {

  /**
   Convenience function to register your styles.
   */
  func define()
}

public extension Stylesheet {

  /**
   Registers stylization closure with the specified name.
   Type used in the closure should conform to `Styleable` protocol

   - Parameter name: The name of the style you can apply to your view afterwards.
   - Parameter stylization: Closure where you can apply styles.
   */
  public func register<T: Styleable>(name: String, stylization: T -> Void) {
    Stylist.master.register(name, stylization: stylization)
  }

  /**
   Unregisters stylization closure with the specified name.

   - Parameter name: The name of the style you can apply to your view afterwards.
   */
  public func unregister(name: String) {
    Stylist.master.unregister(name)
  }
}
