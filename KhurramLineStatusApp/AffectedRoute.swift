import Foundation

class AffectedRoute : Codable {
    
    var name:String
    var direction:String
    var originationName:String
    var destinationName:String
    
    init (name:String,direction:String,originationName:String,destinationName:String) {
        self.name = name
        self.direction = direction
        self.originationName = originationName
        self.destinationName = destinationName
    }
}
