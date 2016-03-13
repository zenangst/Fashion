import Quick
import Nimble
@testable import Makeup

class StylistSpec: QuickSpec {

  override func spec() {
    describe("Stylist") {
      var stylist: Stylist!

      beforeEach {
        Stylist.master.styles.removeAll()

        stylist = Stylist()
      }

      describe("#apply:styles:model") {
        let styles = ["label-1", "label-2"]

        beforeEach {
          stylist.register("label-1") { (label: UILabel) in
            label.textColor = UIColor.redColor()
            label.numberOfLines = 10
          }

          stylist.register("label-2") { (label: UILabel) in
            label.backgroundColor = UIColor.yellowColor()
            label.numberOfLines = 3
          }
        }

        context("when the model is of expected type") {
          it("applies the styles to the passed model") {
            let label = UILabel()
            label.backgroundColor = UIColor.redColor()
            label.textColor = UIColor.whiteColor()
            label.numberOfLines = 2

            stylist.apply(styles, model: label)

            expect(label.backgroundColor).to(equal(UIColor.yellowColor()))
            expect(label.textColor).to(equal(UIColor.redColor()))
            expect(label.numberOfLines).to(equal(3))
          }
        }

        context("when the model is of different type") {
          it("does not apply the styles to the passed model") {
            let view = UIView()
            view.backgroundColor = UIColor.redColor()

            stylist.apply(styles, model: view)

            expect(view.backgroundColor).to(equal(UIColor.redColor()))
          }
        }
      }

      describe("#apply:style:model") {
        let style = "label-3"

        beforeEach {
          stylist.register("label-3") { (label: UILabel) in
            label.textColor = UIColor.redColor()
            label.backgroundColor = UIColor.yellowColor()
            label.numberOfLines = 10
          }
        }

        context("when the model is of expected type") {
          it("applies the styles to the passed model") {
            let label = UILabel()
            label.backgroundColor = UIColor.redColor()
            label.textColor = UIColor.whiteColor()
            label.numberOfLines = 2

            stylist.apply(style, model: label)

            expect(label.backgroundColor).to(equal(UIColor.yellowColor()))
            expect(label.textColor).to(equal(UIColor.redColor()))
            expect(label.numberOfLines).to(equal(10))
          }
        }

        context("when the model is of different type") {
          it("does not apply the styles to the passed model") {
            let view = UIView()
            view.backgroundColor = UIColor.redColor()

            stylist.apply(style, model: view)

            expect(view.backgroundColor).to(equal(UIColor.redColor()))
          }
        }
      }

      describe("#register") {
        let style = "red-button"

        it("registers stylization closure with a specified style name") {
          stylist.register(style, stylization: { (button: UIButton) in
            button.backgroundColor = UIColor.redColor()
          })

          expect(stylist.styles[style]).toNot(beNil())
        }
      }

      describe("#unregister") {
        let style = "red-button"

        it("unregisters stylization closure") {
          stylist.register(style, stylization: { (button: UIButton) in
            button.backgroundColor = UIColor.redColor()
          })

          expect(stylist.styles[style]).toNot(beNil())

          stylist.unregister(style)

          expect(stylist.styles[style]).to(beNil())
        }
      }

    }
  }
}
