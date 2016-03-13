public class Stylist {

  static let shared = Stylist()

  typealias Stylization = (model: Styleable) -> Void

  var styles: [String: Stylization] = [:]

  public func register<T: Styleable>(name: String, stylization: T -> Void) {
    let style = Style(process: stylization)

    styles[name] = style.applyTo
  }

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
