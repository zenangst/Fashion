import Quick
import Nimble
@testable import Makeup

class StyleSpec: QuickSpec {
  override func spec() {
    describe("Style") {
      var style: Style<UILabel>!

      beforeEach {
        Stylist.master.styles.removeAll()

        style = Style<UILabel>(process: { (label: UILabel) in
          label.backgroundColor = UIColor.whiteColor()
          label.textColor = UIColor.redColor()
          label.numberOfLines = 10
        })
      }

      describe("applyTo: model") {
        context("when the model is of expected type") {
          it("applies the style to the passed model") {
            let label = UILabel()
            label.backgroundColor = UIColor.redColor()
            label.textColor = UIColor.whiteColor()
            label.numberOfLines = 2

            style.applyTo(label)

            expect(label.backgroundColor).to(equal(UIColor.whiteColor()))
            expect(label.textColor).to(equal(UIColor.redColor()))
            expect(label.numberOfLines).to(equal(10))
          }
        }

        context("when the model is of different type") {
          it("does not apply the style to the passed model") {
            let view = UIView()
            view.backgroundColor = UIColor.redColor()

            expect(view.backgroundColor).to(equal(UIColor.redColor()))
          }
        }
      }
    }
  }
}
