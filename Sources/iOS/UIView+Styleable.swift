import UIKit

extension UIView {

  private struct AssociatedKeys {
    static var Style = "fashion_StyleAssociatedKey"
  }

  public convenience init(frame: CGRect = CGRectZero, styles: [StringConvertible]) {
    self.init(frame: frame)
    self.styles = styles.map { $0.string } .joinWithSeparator(" ")
  }

  public convenience init(frame: CGRect = CGRectZero, styles: StringConvertible) {
    self.init(frame: frame)
    stylize(styles)
  }

  /**
   Applies previously registered styles.

   - Parameter styles: Set of style names.
   */

  public func stylize(styles: StringConvertible...) {
    self.styles = styles.map { $0.string } .joinWithSeparator(" ")
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
  @IBInspectable public var styles: String? {
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
