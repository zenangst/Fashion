import Quick
import Nimble
@testable import Makeup

class StyleableSpec: QuickSpec {

  override func spec() {
    describe("Styleable") {
      var label: UILabel!

      beforeEach {
        Stylist.master.styles.removeAll()
        Stylist.master.sharedStyles.removeAll()

        label = UILabel()
        label.backgroundColor = UIColor.redColor()
        label.textColor = UIColor.whiteColor()
        label.numberOfLines = 2
      }

      describe("#stylize") {
        it("applies a stylization closure") {
          label.stylize({ label in
            label.backgroundColor = UIColor.whiteColor()
            label.textColor = UIColor.blueColor()
            label.numberOfLines = 10
          })

          expect(label.backgroundColor).to(equal(UIColor.whiteColor()))
          expect(label.textColor).to(equal(UIColor.blueColor()))
          expect(label.numberOfLines).to(equal(10))
        }
      }
    }
  }
}
