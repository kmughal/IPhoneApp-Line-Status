import Foundation
import RxCocoa
import RxSwift

class ApiService {
    
    private let apiEndPointHelper:ApiEndPoints
    
    init() {
        self.apiEndPointHelper = ApiEndPoints()
    }
    
    
    func getLineStatus() -> Observable<[Line]> {
        let result:Observable<[Line]> = getResponse(url:apiEndPointHelper.lineStatusEndPoint())
        return result
    }
    
    func getNetworkStatus() -> Observable<NetworkStatus> {
        let result:Observable<NetworkStatus> = getResponse(url:apiEndPointHelper.networkStatusEndPoint())
        return result
    }
    
    private func getResponse<T:Codable>(url:String) -> Observable<T> {
        let client = JsonClient()
        let result:Observable<T> = client.getResult(url)
        return result
    }
}

