import Cocoa

extension NSView: Styleable {}

public extension NSView {

  private struct AssociatedKeys {
    static var Style = "makeup_StyleAssociatedKey"
  }

  public func stylize(styles: String...) {
    Stylesheet.master.apply(styles, model: self)
  }

  @IBInspectable public var style: String? {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.Style) as? String
    }
    set (newValue) {
      objc_setAssociatedObject(self, &AssociatedKeys.Style,
        newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

      if let newValue = newValue {
        let styles = newValue.componentsSeparatedByString(" ")
        Stylesheet.master.apply(styles, model: self)
      }
    }
  }
}
