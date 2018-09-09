import UIKit

class InitController: UIViewController {

    let lineStatusControllerName = "LineStatusController"
    let noInternetControllerName = "NoInternetController"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Shared.Instance.runCode(self.goToLineStatusPage,self.goToNoInternetPage)
    }
    
    func goToNoInternetPage() {
        let ctrl = Shared.Instance
            .delayForOneSecond()
            .goTo(
                storyBoard: self.storyboard!,
                controllerName:  noInternetControllerName) as NoInternetViewController
        print("Showing : \(ctrl.nibName ?? "nothing to display")")
    }

    func goToLineStatusPage() {
        let ctrl = Shared.Instance
            .delayForOneSecond()
            .goTo(
                storyBoard: self.storyboard!,
                controllerName:  lineStatusControllerName) as LineStatusViewController
        print("Showing : \(ctrl.nibName ?? "nothing to display")")
    }
}

