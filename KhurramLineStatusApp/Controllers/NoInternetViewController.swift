import UIKit
import RxSwift

class NoInternetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(_ animated: Bool) {
        initialiseTimer()
    }

    func goToLineStatusPage() {
        Shared.Instance.updateUI {
            let lineStatusControllerName = "LineStatusController"
            let ctrl = Shared.Instance
                .goTo(
                    storyBoard: self.storyboard!,
                    controllerName: lineStatusControllerName) as LineStatusViewController
            print("Showing : \(ctrl.nibName ?? "nothing to display")")
        }
    }

    func presentLineStatusController(_ disp: Disposable) -> Void {
        Shared.Instance.runCode({
            print("you have internet cool")
            self.goToLineStatusPage()
            disp.dispose()
        }, {
                print("still no internet")
            })
    }

    func initialiseTimer() {
        var disp: Disposable?
        disp = Shared.Instance.runCodeInIntervals(interval: 2.0, code: { self.presentLineStatusController(disp!) })
    }
}
