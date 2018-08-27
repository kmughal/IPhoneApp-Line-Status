import UIKit

import RxSwift
import RxCocoa

class LineStatusViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func revertColor() {
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.view.backgroundColor = UIColor.lightGray
        let builder = ApiLineStatusViewModelBuilder()
        builder.Build().subscribe(onNext: {
            vm in
            print("HasDisruptions: \(vm.hasDisruptions)")
            print("Network Status: \(vm.networkStatus.status)")
            print("Good Status: \(vm.hasGoodService)")
            DispatchQueue.main.sync {
                self.view.backgroundColor = .white
            }
        }, onError: nil, onCompleted: nil, onDisposed: nil)
    }
}
