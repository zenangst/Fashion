/// Convenience protocol for all types that could be styled.
public protocol Styleable {}

public extension Styleable {

  /**
   Applies a stylization closure.

   - Parameter stylization: Closure where you can apply styles.
   */
  public func stylize(stylization: Self -> Void) -> Self {
    stylization(self)
    return self
  }
}
