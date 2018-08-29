import Foundation
import RxCocoa
import RxSwift

class LineStatusBuilder {
    
    private var apiViewModel:ApiLineStatusViewModel
    private let apiViewModelBuilder = ApiLineStatusViewModelBuilder()
    
    init() {
        self.apiViewModel = ApiLineStatusViewModel.CreateEmpty()
    }
    
    func initApiViewModel() -> Void {
        self.apiViewModelBuilder.build()
            .subscribe(onNext: { r in
                self.apiViewModel = r
            }, onError: nil, onCompleted: nil, onDisposed: nil)
    }
    
    func build() -> Observable<LineStatusViewModel> {
        return Observable.create({
            observer in
            self.apiViewModelBuilder.build()
                .subscribe({ r in
                    if let result = r.element {
                        var vm = LineStatusViewModel(style: "", cardPacks: [CardPack]())
                        vm = DisruptionsBuilder().build(vm: vm, apiVm: result)
                        vm = GoodServicesBuilder().build(vm: vm, apiVm: result)
                        observer.onNext(vm)
                    } else {
                        
                    }
                })
        })
    }
}
