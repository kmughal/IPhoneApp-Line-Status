import Foundation
import RxCocoa
import RxSwift

class ApiService {
    
    private let apiEndPointHelper:ApiEndPoints
    
    init() {
        self.apiEndPointHelper = ApiEndPoints()
    }
    
    
    func getLineStatus() -> Observable<([Line],String)> {
        let result:Observable<([Line],String)> = getResponse(url:apiEndPointHelper.lineStatusEndPoint())
        return result
    }
    
    func getNetworkStatus() -> Observable<(NetworkStatus,String)> {
        let result:Observable<(NetworkStatus,String)> = getResponse(url:apiEndPointHelper.networkStatusEndPoint())
        return result
    }
    
    private func getResponse<T:Codable>(url:String) -> Observable<(T,String)> {
        let client = JsonClient()
        let result:Observable<(T,String)> = client.getResult(url)
        return result
    }
}

