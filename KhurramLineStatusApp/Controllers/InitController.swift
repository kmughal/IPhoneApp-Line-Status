import UIKit

class InitController: UIViewController {
    
    let lineStatusControllerName = "LineStatusController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let filepath = Bundle.main.path(forResource: "test", ofType: "json") {
            print("f:\(filepath)")
        }
        self.showLineStatus()
    }
    
    func showLineStatus() {
        delayForOneSecond()
            .getRootController()
            .present(createLineStatusControllerFromStroyBoard()!, animated: true, completion: nil)
    }
    
    func createLineStatusControllerFromStroyBoard() -> LineStatusViewController? {
        return storyboard?.instantiateViewController(withIdentifier: lineStatusControllerName) as! LineStatusViewController?
    }
    
    func getRootController() -> UIViewController {
        return (view.window?.rootViewController)!
    }
    
    func delayForOneSecond() -> InitController {
        Thread.sleep(until: Date(timeIntervalSinceNow: 1.0))
        return self
    }
}

