import Foundation
import RxCocoa
import RxSwift

class LineStatusBuilder {
    
    private let apiViewModel:ApiLineStatusViewModel
    private let apiViewModelBuilder:ApiLineStatusViewModelBuilder
    private static var previousLineStatusResponse = ApiLineStatusViewModel.CreateEmpty()
    private let disruptionBiulder : DisruptionsBuilder
    private let goodServiceBiulder : GoodServicesBuilder
    
    init(
        apiViewModelBuilder:ApiLineStatusViewModelBuilder,
        goodServiceBiulder : GoodServicesBuilder,
        disruptionBiulder : DisruptionsBuilder
        ) {
        self.apiViewModel = ApiLineStatusViewModel.CreateEmpty()
        self.apiViewModelBuilder = apiViewModelBuilder
        self.disruptionBiulder = disruptionBiulder
        self.goodServiceBiulder = goodServiceBiulder
    }
    
    func build() -> Observable<LineStatusViewModel> {
        return Observable.create({
            observer in
            self.apiViewModelBuilder.build()
                .subscribe({ r in
                    if let result = r.element {
                        var vm = LineStatusViewModel(style: "", cardPacks: [CardPack]())
                        vm = self.disruptionBiulder.build(vm: vm, apiVm: result)
                        vm = self.goodServiceBiulder.build(vm: vm, apiVm: result)
                        vm.rawJson = result.rawJsonResponseForLineStatus
                        LineStatusBuilder.previousLineStatusResponse = result
                        observer.onNext(vm)
                    } else {
                        
                    }
                })
        })
    }
}
