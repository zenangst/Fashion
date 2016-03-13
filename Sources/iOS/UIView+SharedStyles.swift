import UIKit
import Sugar

extension UIView {

  // MARK: - Method Swizzling

  public override class func initialize() {
    struct Static {
      static var token: dispatch_once_t = 0
    }

    if self !== UIView.self { return }

    dispatch_once(&Static.token) {
      Swizzler.swizzle("initWithFrame:", cls: self, prefix: "makeup")
      Swizzler.swizzle("initWithCoder:", cls: self, prefix: "makeup")
    }
  }

  func makeup_init(frame frame: CGRect) -> UIView {
    let instance = makeup_init(frame: frame)
    Stylist.master.applyShared(self)

    return instance
  }

  func makeup_init(coder aDecoder: NSCoder) -> UIView {
    let instance = makeup_init(coder: aDecoder)
    Stylist.master.applyShared(self)

    return instance
  }
}
