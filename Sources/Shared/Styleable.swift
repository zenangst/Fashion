/// Convenience protocol for all types that could be styled.
public protocol Styleable {}

public extension Styleable {

  public func style<T: Styleable>(stylization: T -> Void) -> Self {
    let style = Style(process: stylization)

    style.applyTo(self)

    return self
  }
}
