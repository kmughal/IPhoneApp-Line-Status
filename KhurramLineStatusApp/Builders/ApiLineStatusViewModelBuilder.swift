import Foundation
import RxCocoa
import RxSwift

class ApiLineStatusViewModelBuilder {
    
    private let lineStatusService:ApiService
    
    init() {
        self.lineStatusService = ApiService()
    }
    
    func build() -> Observable<ApiLineStatusViewModel> {
        
       let fetchLineStatus = lineStatusService.getLineStatus()
       let fetchNetworkStatus = lineStatusService.getNetworkStatus()
        
        return Observable
            .zip(fetchLineStatus,
                 fetchNetworkStatus) { (lines, networkStatus) throws -> ApiLineStatusViewModel in
                    return ApiLineStatusViewModel(
                        lines: lines,
                        networkStatus: networkStatus,
                        hasDisruptions: ApiLineStatusViewModel.hasDelays(ls: lines),
                        hasGoodService: ApiLineStatusViewModel.hasAtleastOneGoodService(ls: lines))
            }
    }
}
