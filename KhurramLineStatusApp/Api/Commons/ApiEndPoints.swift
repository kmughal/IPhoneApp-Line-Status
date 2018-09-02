import Foundation

class ApiEndPoints : ApiEndPointUrls {
    
    private let lineStatus = "LineStatus"
    private let networkStatus = "NetworkStatus"
    private var baseUrl = ""
    
    init() {
        setBaseUrl()
    }
    
    private func setBaseUrl() -> Void {
        let propertyName = "BaseUrl"
        self.baseUrl = getStringValue(propertyName: propertyName)
    }
    
    private func getSettings() -> [String:Any] {
        return Bundle.main.infoDictionary!
    }
    
    func lineStatusEndPoint() -> String {
        return getUrl(propertyName: lineStatus)
    }
    
    func networkStatusEndPoint() -> String {
        return getUrl(propertyName: networkStatus)
    }
    
    private func getUrl(propertyName:String) -> String {
        return "\(self.baseUrl)\(self.getStringValue(propertyName: propertyName))"
    }
    
    private func getStringValue(propertyName:String) -> String {
        let settings = getSettings()
        return settings[propertyName] as! String
    }
}
