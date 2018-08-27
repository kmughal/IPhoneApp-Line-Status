import Foundation

class LineStatus : Codable {
    var id:Int
    var statusSeverity:Int
    var statusSeverityDescription:String
    var reason:String?
    init(id:Int,statusSeverity:Int,statusSeverityDescription:String,reason:String?) {
        self.id = id
        self.statusSeverity = statusSeverity
        self.statusSeverityDescription = statusSeverityDescription
        self.reason = reason
    }
}
