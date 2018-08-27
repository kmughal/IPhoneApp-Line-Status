import Foundation

class Disruption : Codable {
    
    var category:String
    var categoryDescription: String
    var description: String
    var additionalInfo :String
    
    init(category:String,categoryDescription:String,description:String,additionalInfo:String) {
        self.category = category
        self.categoryDescription = categoryDescription
        self.description = description
        self.additionalInfo = additionalInfo
    }
}
