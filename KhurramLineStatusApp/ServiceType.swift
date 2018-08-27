import Foundation
import UIKit

class ServiceType : Codable {
    
    var name:String
    var uri :String
    
    init(name:String,uri:String) {
        self.name = name
        self.uri = uri
    }
    
    func isNightService() -> Bool {
        return self.name != ServiceTypes.Regular.rawValue
    }
}


class NetworkStatus : Codable {
    var status: String
    var message: String
    var statusLevel: Int
    
    init(status:String,message:String,statusLevel:Int) {
        self.status = status
        self.message = message
        self.statusLevel = statusLevel
    }
}
