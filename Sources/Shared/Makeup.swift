public func register(stylesheets: [Stylesheet]) {
  stylesheets.forEach {
    $0.define()
  }
}
