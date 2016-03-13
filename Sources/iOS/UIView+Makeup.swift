import UIKit

extension UIView: Styleable {}

extension UIView {

  private struct AssociatedKeys {
    static var Style = "makeup_StyleAssociatedKey"
  }

  func stylize(styles: String...) {
    Stylist.shared.apply(styles, model: self)
  }

  @IBInspectable var style: String? {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.Style) as? String
    }
    set (newValue) {
      objc_setAssociatedObject(self, &AssociatedKeys.Style,
        newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

      if let newValue = newValue {
        let styles = newValue.componentsSeparatedByString(" ")
        Stylist.shared.apply(styles, model: self)
      }
    }
  }
}
