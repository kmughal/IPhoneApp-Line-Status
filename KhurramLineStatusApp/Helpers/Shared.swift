import Foundation
import RxSwift
struct Shared {
    
    private static var instance:Shared = Shared()
    
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
        return Observable<Int>.interval(5, scheduler: SerialDispatchQueueScheduler(qos: .default))
            .subscribe { event in
                code()
                print("\(Date())")
        }
    }
}
