import UIKit
import Sugar

extension UIView {

  private struct AssociatedKeys {
    static var stylesApplied = "fashion_StylesAppliedAssociatedKey"
  }

  // MARK: - Method Swizzling

  override public class func initialize() {
    struct Static {
      static var token: dispatch_once_t = 0
    }

    if self !== UIView.self { return }

    dispatch_once(&Static.token) {
      Swizzler.swizzle("willMoveToSuperview:", cls: self, prefix: "fashion")
    }
  }

  func fashion_willMoveToSuperview(newSuperview: UIView?) {
    fashion_willMoveToSuperview(newSuperview)

    guard runtimeStyles else {
      return
    }

    guard Stylist.master.applyShared(self) && stylesApplied != true else {
      return
    }

    stylesApplied = true

    if let style = style {
      self.style = style
    }
  }

  private var stylesApplied: Bool? {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.stylesApplied) as? Bool
    }
    set (newValue) {
      objc_setAssociatedObject(self, &AssociatedKeys.stylesApplied,
        newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
}
