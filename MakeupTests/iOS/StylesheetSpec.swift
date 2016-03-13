import Quick
import Nimble
@testable import Makeup

class StylesheetSpec: QuickSpec {

  override func spec() {
    describe("Stylesheet") {
      let stylesheet = TestEmptyStylesheet()
      let style = "red-button"

      beforeEach {
        Stylist.master.styles.removeAll()
      }

      describe("#register") {
        it("registers stylization closure with a specified style name") {
          stylesheet.register(style, stylization: { (button: UIButton) in
            button.backgroundColor = UIColor.redColor()
          })

          expect(Stylist.master.styles[style]).toNot(beNil())
        }
      }

      describe("#unregister") {
        it("unregisters stylization closure") {
          stylesheet.register(style, stylization: { (button: UIButton) in
            button.backgroundColor = UIColor.redColor()
          })

          expect(Stylist.master.styles[style]).toNot(beNil())

          stylesheet.unregister(style)

          expect(Stylist.master.styles[style]).to(beNil())
        }
      }
    }
  }
}
