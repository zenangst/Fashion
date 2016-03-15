import UIKit

extension UIView {

  private struct AssociatedKeys {
    static var Style = "fashion_StyleAssociatedKey"
  }

  /**
   Applies previously registered styles.

   - Parameter styles: Set of style names.
   */
  public func stylize(styles: String...) {
    style = styles.joinWithSeparator(" ")
  }

  /**
   Inherits registered shared styles.
   */
  public func inheritStyles() {
    Stylist.master.applyShared(self)
  }

  /**
   Applies previously registered styles.

   - Parameter styles: Single style or multiple styles separated by whitespace.
   */
  @IBInspectable public var style: String? {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.Style) as? String
    }
    set (newValue) {
      objc_setAssociatedObject(self, &AssociatedKeys.Style,
        newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

      if let newValue = newValue {
        let styles = newValue.componentsSeparatedByString(" ")
        Stylist.master.apply(styles, model: self)
      }
    }
  }
}
