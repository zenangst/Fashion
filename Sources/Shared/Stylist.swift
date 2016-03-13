public class Stylist {

  public static let master = Stylist()

  typealias Stylization = (model: Styleable) -> Void

  var styles: [String: Stylization] = [:]

  // MARK: - Apply styles

  func apply(styles: [String], model: Styleable) -> Void {
    for style in styles {
      apply(style, model: model)
    }
  }

  func apply(style: String, model: Styleable) -> Void {
    guard let style = styles[style] else { return }

    style(model: model)
  }
}

// MARK: - StyleRegistering

extension Stylist: StyleRegistering {

  public func register<T: Styleable>(name: String, stylization: T -> Void) {
    let style = Style(process: stylization)

    styles[name] = style.applyTo
  }
}
