import Quick
import Nimble
@testable import Makeup

class StylesheetSpec: QuickSpec {
  override func spec() {
    describe("Stylesheet") {
      let stylesheet = TestStylesheet()

      beforeEach {
        Stylist.master.styles.removeAll()
      }

      describe("register") {
        it("registers stylization closure with a specified style name") {
          stylesheet.register("red-button", stylization: { (button: UIButton) in
            button.backgroundColor = UIColor.redColor()
            button.setTitle("Red", forState: .Normal)
          })

          expect(Stylist.master.styles["red-button"]).toNot(beNil())
        }
      }
    }
  }
}
