import SystemConfiguration
import Foundation
import RxSwift
import UIKit


struct Shared {

    private static var instance: Shared = Shared()
    let DARK_BLUE = UIColor(red: 0.00, green: 0.10, blue: 0.66, alpha: 1.0)

    func isLineStatusCall(url: String) -> Bool {
        return url == ApiEndPoints().lineStatusEndPoint()
    }

    static var Instance: Shared {
        get {
            return Shared.instance
        }
    }

    func updateUI(code: @escaping () -> Void) {
        DispatchQueue.main.async {
            code()
        }
    }

    func runCodeInIntervals(interval: Float, code: @escaping () -> Void) -> Disposable {
        return Observable<Int>.interval(RxTimeInterval(interval), scheduler: SerialDispatchQueueScheduler(qos: .default))
            .subscribe { event in
                code()
                print("\(Date())")
        }
    }

    func runCode(
        _ codeToRunWhenOnline: @escaping () -> Void,
        _ codeToRunWhenOffline: @escaping () -> Void
    ) -> Void {

        let reachability = SCNetworkReachabilityCreateWithName(nil, "www.google.com")!
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability, &flags)
        if flags.contains(.reachable) {
            codeToRunWhenOnline()
        } else {
            codeToRunWhenOffline()
        }
    }

    func goTo<T: UIViewController>(storyBoard: UIStoryboard, controllerName: String) -> T {
        let rootCtrl = getRootController()
        let ctrl: T = createLineStatusControllerFromStroyBoard(storyBoard: storyBoard, controllerName: controllerName)
        rootCtrl.present(ctrl, animated: true, completion: nil)
        return ctrl
    }

    private func createLineStatusControllerFromStroyBoard<T:UIViewController>
    (storyBoard: UIStoryboard,
        controllerName: String) -> T {
        return storyBoard.instantiateViewController(withIdentifier: controllerName) as! T
    }

    private func getRootController() -> UIViewController {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var viewController = appDelegate.window!.rootViewController

        while((viewController?.presentedViewController) != nil) {
            viewController = viewController?.presentedViewController
        }

        return viewController!
    }

    func delayForOneSecond() -> Shared {
        Thread.sleep(until: Date(timeIntervalSinceNow: 1.0))
        return Shared.Instance
    }
}
