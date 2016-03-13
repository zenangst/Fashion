import Quick
import Nimble
@testable import Makeup

class StylesheetUIAppearanceSpec: QuickSpec {

  override func spec() {
    describe("Stylesheet+UIAppearanceSpec") {
      let stylesheet = TestEmptyStylesheet()

      beforeEach {
        Stylist.master.styles.removeAll()
      }

      describe("#share") {
        it("applies a stylization closure to UIAppearance context") {
          stylesheet.shareAppearance({ (navigationBar: UINavigationBar) in
            navigationBar.alpha = 0.5
          })

          expect(UINavigationBar.appearance().alpha).to(equal(0.5))
        }
      }
    }
  }
}
