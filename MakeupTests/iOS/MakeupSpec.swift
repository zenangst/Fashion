import Quick
import Nimble
@testable import Makeup

class MakeupSpec: QuickSpec {

  override func spec() {
    describe("Makeup") {
      let stylesheet = TestStylesheet()

      beforeEach {
        Stylist.master.styles.removeAll()
      }

      describe("#register") {
        it("registers passed stylesheets") {
          Makeup.register([stylesheet])

          expect(Stylist.master.styles[stylesheet.style]).toNot(beNil())
        }
      }
    }
  }
}
