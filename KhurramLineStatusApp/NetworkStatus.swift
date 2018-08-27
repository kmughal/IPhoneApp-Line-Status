import Foundation


class NetworkStatus : Codable {
    var status: String
    var message: String
    var statusLevel: Int
    
    init(status:String,message:String,statusLevel:Int) {
        self.status = status
        self.message = message
        self.statusLevel = statusLevel
    }
    
    static func CreateEmpty() -> NetworkStatus {
        return NetworkStatus.init(status: "", message:"", statusLevel: -1)
    }
}
