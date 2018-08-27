import Foundation
import RxCocoa
import RxSwift

class ApiService {
    
//    func isGoodService(lines:[Line]) -> Bool {
//        return lines.filter({
//            return $0.lineStatuses.filter({
//                return $0.statusSeverity != 10
//            }).count == 0
//        }).count == 0
//    }
    
   
    func getLineStatusUrl() -> String {
        if  let dic = Bundle.main.infoDictionary {
            return dic["LineStatusUrl"] as! String
        } else {
            return ""
        }
    }
    
    
    func get() -> Observable<[Line]> {
        let client = JsonClient()
        let result:Observable<[Line]> = client.getResult(getLineStatusUrl())
       return result
    }
}

