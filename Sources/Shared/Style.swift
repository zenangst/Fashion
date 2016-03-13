public protocol Styleable {}

final class Style<T: Styleable> {

  private let process: (model: T) -> Void

  init(process: (model: T) -> Void) {
    self.process = process
  }

  func applyTo(model: Styleable) -> Void {
    guard let model = model as? T else {
      return
    }

    process(model: model)
  }
}
