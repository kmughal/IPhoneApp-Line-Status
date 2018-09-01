import Foundation


class NetworkStatus : Codable,ApiResponse {
    var status: String
    var message: String
    var statusLevel: Int
    var RawJson : String? = ""
    
    func setRawJson(rawJson: String) {
        self.RawJson = rawJson
    }
    
    init(status:String,message:String,statusLevel:Int) {
        self.status = status
        self.message = message
        self.statusLevel = statusLevel
    }
    
    static func CreateEmpty() -> NetworkStatus {
        return NetworkStatus.init(status: "", message:"", statusLevel: -1)
    }
}
