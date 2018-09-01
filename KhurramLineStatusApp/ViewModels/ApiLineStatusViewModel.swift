import Foundation

class ApiLineStatusViewModel {
    
    var lines: [Line]
    var networkStatus : NetworkStatus
    var hasDisruptions : Bool
    var hasGoodService : Bool
    var rawJsonResponseForLineStatus : String
    
    static func CreateEmpty() -> ApiLineStatusViewModel {
        return ApiLineStatusViewModel(
            lines: [Line](),
            networkStatus: NetworkStatus.CreateEmpty() ,
            hasDisruptions: false,
            hasGoodService: false,
            rawJsonResponseForLineStatus : "")
    }
    
    
    init(lines:[Line],networkStatus: NetworkStatus,hasDisruptions: Bool,hasGoodService: Bool,rawJsonResponseForLineStatus:String) {
        self.lines = lines
        self.networkStatus = networkStatus
        self.hasDisruptions = hasDisruptions
        self.hasGoodService = hasGoodService
        self.rawJsonResponseForLineStatus = rawJsonResponseForLineStatus
    }
    
    static func hasDelays(ls:[Line]) -> Bool {
        return getDisruptedLinesOnly(ls: ls).count > 0
    }
    
    static func hasAtleastOneGoodService(ls:[Line]) -> Bool {
        return ls.filter({
               $0.lineStatuses.filter({
                $0.statusSeverity == SeverityCodes.GoodService.rawValue
            }).count > 0
        }).count > 0
    }
    
    static func getDisruptedLinesOnly(ls:[Line]) -> [Line] {
        return ls.filter({
               $0.lineStatuses.filter({
                 $0.statusSeverity != SeverityCodes.GoodService.rawValue
            }).count > 0
        })
    }
}
