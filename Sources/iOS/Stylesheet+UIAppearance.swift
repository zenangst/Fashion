import UIKit

public extension Stylesheet {

  /**
   Wrapper function to set UIAppearance.

   - Parameter stylization: Closure where you can apply styles.
   */
  public func shareAppearance<T: UIAppearance>(stylization: T -> Void) {
    stylization(T.appearance())
  }
}
