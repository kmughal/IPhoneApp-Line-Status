import Foundation
import RxSwift
struct Shared {
    
    private static var instance:Shared = Shared()
    let DARK_BLUE = UIColor(red:0.00, green:0.10, blue:0.66, alpha:1.0)
    
    static var Instance:Shared {
        get {
            return Shared.instance
        }
    }
    
    func updateUI(code:@escaping ()-> Void) {
        DispatchQueue.main.async {
            code()
        }
    }
    
    func runCodeInIntervals(interval:Float,code:@escaping () -> Void) -> Disposable {
      
        return Observable<Int>.interval(RxTimeInterval(interval), scheduler: SerialDispatchQueueScheduler(qos: .default))
            .subscribe { event in
                code()
                print("\(Date())")
        }
    }
}
