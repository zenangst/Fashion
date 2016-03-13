import Quick
import Nimble
@testable import Makeup

class UIViewSharedStylesSpec: QuickSpec {

  override func spec() {
    describe("UIView+Shared") {
      beforeEach {
        Stylist.master.styles.removeAll()
        Stylist.master.sharedStyles.removeAll()
        Makeup.runtimeStyles = true
      }

      describe("#willMoveToSuperview:") {
        beforeEach {
          Stylist.master.register("label-1") { (label: UILabel) in
            label.textColor = UIColor.redColor()
          }

          Stylist.master.share { (label: UILabel) in
            label.textColor = UIColor.greenColor()
            label.layer.borderWidth = 2
          }

          Stylist.master.share { (view: UIView) in
            view.backgroundColor = UIColor.yellowColor()
            view.tintColor = UIColor.redColor()
            view.layer.borderWidth = 3
          }
        }

        context("with runtime styles enabled") {
          it("applies shared styles when the view is added to superview") {
            let label = UILabel()
            let view = UIView()

            view.addSubview(label)

            expect(label.backgroundColor).to(equal(UIColor.yellowColor()))
            expect(label.tintColor).to(equal(UIColor.redColor()))
            expect(label.textColor).to(equal(UIColor.greenColor()))
            expect(label.layer.borderWidth).to(equal(2))

            let textView = UITextView()
            view.addSubview(textView)

            expect(textView.backgroundColor).to(equal(UIColor.yellowColor()))
            expect(textView.tintColor).to(equal(UIColor.redColor()))
            expect(textView.textColor).to(beNil())
            expect(textView.layer.borderWidth).to(equal(3))

            let button = Button()
            view.addSubview(button)

            expect(button.backgroundColor).to(equal(UIColor.yellowColor()))
            expect(button.tintColor).to(equal(UIColor.redColor()))
            expect(button.layer.borderWidth).to(equal(3))
          }

          it("does not override view-specific styles") {
            let label = UILabel()
            label.style = "label-1"
            let view = UIView()

            view.addSubview(label)

            expect(label.backgroundColor).to(equal(UIColor.yellowColor()))
            expect(label.tintColor).to(equal(UIColor.redColor()))
            expect(label.textColor).to(equal(UIColor.redColor()))
            expect(label.layer.borderWidth).to(equal(2))
          }
        }

        context("with runtime styles disabled") {
          it("does not apply shared styles") {
            Makeup.runtimeStyles = false

            let label = UILabel()
            let view = UIView()

            view.addSubview(label)

            expect(label.backgroundColor).notTo(equal(UIColor.yellowColor()))
            expect(label.tintColor).notTo(equal(UIColor.redColor()))
            expect(label.textColor).notTo(equal(UIColor.greenColor()))
            expect(label.layer.borderWidth).notTo(equal(2))
          }
        }
      }
    }
  }
}
