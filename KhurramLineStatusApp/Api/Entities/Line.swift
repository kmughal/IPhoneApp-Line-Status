import Foundation

protocol ApiResponse {
    func setRawJson(rawJson:String) -> Void
}

class Lines {
    var lines:[Line]
    var rawString: String
    
    init(lines:[Line],rawString:String) {
        self.lines = lines
        self.rawString = rawString
    }
}

class Line : Codable {
    var id:String
    var modeName:String
    var name:String
    var lineStatuses:[LineStatus] = [LineStatus]()
    var serviceTypes:[ServiceType] = [ServiceType]()
    
    init(id:String,modeName:String,name:String,lineStatuses:[LineStatus],serviceTypes :[ServiceType]) {
        self.id = id
        self.modeName = modeName
        self.name = name
        self.lineStatuses = lineStatuses
        self.serviceTypes = serviceTypes
    }
}
