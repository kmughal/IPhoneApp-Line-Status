import Foundation

class ApiLineStatusViewModel {
    
    var lines: [Line]
    var networkStatus : NetworkStatus
    var hasDisruptions : Bool
    var hasGoodService : Bool
    
    static func CreateEmpty() -> ApiLineStatusViewModel {
        return ApiLineStatusViewModel(
            lines: [Line](),
            networkStatus: NetworkStatus.CreateEmpty() ,
            hasDisruptions: false,
            hasGoodService: false)
    }
    
    init(lines:[Line],networkStatus: NetworkStatus,hasDisruptions: Bool,hasGoodService: Bool) {
        self.lines = lines
        self.networkStatus = networkStatus
        self.hasDisruptions = hasDisruptions
        self.hasGoodService = hasGoodService
    }
    
    static func hasDelays(ls:[Line]) -> Bool {
        return getDisruptedLinesOnly(ls: ls).count > 0
    }
    
    static func hasAtleastOneGoodService(ls:[Line]) -> Bool {
        return ls.filter({
            return $0.lineStatuses.filter({
                return $0.statusSeverity == SeverityCodes.GoodService.rawValue
            }).count > 0
        }).count > 0
    }
    
    static func getDisruptedLinesOnly(ls:[Line]) -> [Line] {
        return ls.filter({
            return $0.lineStatuses.filter({
                return $0.statusSeverity != SeverityCodes.GoodService.rawValue
            }).count > 0
        })
    }
}
