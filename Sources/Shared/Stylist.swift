/// Style keeper, resolver and manager.
public class Stylist {

  public static let master = Stylist()

  typealias Stylization = (model: Styleable) -> Void

  var styles: [String: Stylization] = [:]

  // MARK: - Stylization

  /**
  Applies set of styles to the passed `Styleable` model.

  - Parameter styles: Names of the style you want to apply in the specified order.
  - Parameter model: `Styleable` view/model.
  */
  func apply(styles: [String], model: Styleable) -> Void {
    for style in styles {
      apply(style, model: model)
    }
  }

  /**
   Applies a single style to the passed `Styleable` model.

   - Parameter style: Name of the style you want to apply.
   - Parameter model: `Styleable` view/model.
   */
  func apply(style: String, model: Styleable) -> Void {
    guard let style = styles[style] else { return }

    style(model: model)
  }
}

// MARK: - StyleRegistering

extension Stylist: StyleManaging {

  /**
   Registers stylization closure with the specified name.
   Type used in the closure should conform to `Styleable` protocol

   - Parameter name: The name of the style you can apply to your view afterwards.
   - Parameter stylization: Closure where you can apply styles.
   */
  public func register<T: Styleable>(name: String, stylization: T -> Void) {
    let style = Style(process: stylization)

    styles[name] = style.applyTo
  }

  /**
   Unregisters stylization closure with the specified name.

   - Parameter name: The name of the style you can apply to your view afterwards.
   */
  public func unregister(name: String) {
    styles.removeValueForKey(name)
  }
}
