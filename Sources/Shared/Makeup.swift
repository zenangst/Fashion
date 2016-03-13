/**
 Registers passed stylesheets by calling `define` function where
 all styling closures should be added.

 - Parameter stylesheets: Array of stylesheets to be registered.
 */
public func register(stylesheets: [Stylesheet]) {
  stylesheets.forEach {
    $0.define()
  }
}
