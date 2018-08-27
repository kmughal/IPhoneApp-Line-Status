import Foundation

class Disruption : Codable {
    
    var affectedRoutes : [AffectedRoute]?
    
    init(affectedRoutes : [AffectedRoute]?) {
        self.affectedRoutes = affectedRoutes
    }
}
