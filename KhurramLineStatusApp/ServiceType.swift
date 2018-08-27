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
