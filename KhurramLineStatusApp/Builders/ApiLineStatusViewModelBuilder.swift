import Foundation
import RxCocoa
import RxSwift

class ApiLineStatusViewModelBuilder {
    
    private let lineStatusService:ApiService
    
    init(lineStatusService:ApiService) {
        self.lineStatusService = lineStatusService
    }
    
    func build() -> Observable<ApiLineStatusViewModel> {
        
       let fetchLineStatus = lineStatusService.getLineStatus()
       let fetchNetworkStatus = lineStatusService.getNetworkStatus()
        
        return Observable
            .zip(fetchLineStatus,
                 fetchNetworkStatus) { (lineStatusResponse, networkStatusResponse) throws -> ApiLineStatusViewModel in
                    
                    let (lines,linesRawJson) = lineStatusResponse
                    let (networkStatus,_) = networkStatusResponse
                    
                    return ApiLineStatusViewModel(
                        lines: lines,
                        networkStatus: networkStatus,
                        hasDisruptions: ApiLineStatusViewModel.hasDelays(ls: lines),
                        hasGoodService: ApiLineStatusViewModel.hasAtleastOneGoodService(ls: lines),
                        rawJsonResponseForLineStatus : linesRawJson
                    )
            }
    }
}
