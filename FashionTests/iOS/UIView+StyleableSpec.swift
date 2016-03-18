import Quick
import Nimble
@testable import Fashion

class UIViewStyleableSpec: QuickSpec {

  override func spec() {
    describe("UIView+Styleable") {
      var label: UILabel!

      beforeEach {
        Stylist.master.styles.removeAll()
        Stylist.master.sharedStyles.removeAll()

        label = UILabel()
        label.backgroundColor = UIColor.redColor()
        label.textColor = UIColor.whiteColor()
        label.numberOfLines = 2

        Stylist.master.register("label-1") { (label: UILabel) in
          label.textColor = UIColor.redColor()
          label.numberOfLines = 10
        }

        Stylist.master.register("label-2") { (label: UILabel) in
          label.backgroundColor = UIColor.yellowColor()
          label.numberOfLines = 3
        }
      }

      describe("#init:frame:styles") {
        it("applies styles") {
          label = UILabel(styles: "label-1 label-2")

          expect(label.backgroundColor).to(equal(UIColor.yellowColor()))
          expect(label.textColor).to(equal(UIColor.redColor()))
          expect(label.numberOfLines).to(equal(3))
        }
      }

      describe("#stylize") {
        it("applies previously registered styles") {
          label.stylize("label-1", "label-2")

          expect(label.backgroundColor).to(equal(UIColor.yellowColor()))
          expect(label.textColor).to(equal(UIColor.redColor()))
          expect(label.numberOfLines).to(equal(3))
        }

        it("does not apply not registered styles") {
          label.stylize("label-3", "label-4")

          expect(label.backgroundColor).to(equal(UIColor.redColor()))
          expect(label.textColor).to(equal(UIColor.whiteColor()))
          expect(label.numberOfLines).to(equal(2))
        }
      }

      describe("#styles") {
        it("returns a style that has been previously set") {
          label.styles = "label-1"

          expect(label.styles).to(equal("label-1"))
        }

        context("with a single style") {
          it("applies previously registered style") {
            label.styles = "label-1"

            expect(label.backgroundColor).to(equal(UIColor.redColor()))
            expect(label.textColor).to(equal(UIColor.redColor()))
            expect(label.numberOfLines).to(equal(10))
          }

          it("does not apply not registered style") {
            label.styles = "label-3 label-4"

            expect(label.backgroundColor).to(equal(UIColor.redColor()))
            expect(label.textColor).to(equal(UIColor.whiteColor()))
            expect(label.numberOfLines).to(equal(2))
          }
        }

        context("with multiple styles") {
          it("applies previously registered styles") {
            label.styles = "label-1 label-2"

            expect(label.backgroundColor).to(equal(UIColor.yellowColor()))
            expect(label.textColor).to(equal(UIColor.redColor()))
            expect(label.numberOfLines).to(equal(3))
          }

          it("does not apply not registered styles") {
            label.styles = "label-3 label-4"

            expect(label.backgroundColor).to(equal(UIColor.redColor()))
            expect(label.textColor).to(equal(UIColor.whiteColor()))
            expect(label.numberOfLines).to(equal(2))
          }
        }
      }
    }
  }
}
