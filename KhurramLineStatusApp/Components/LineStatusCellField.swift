import Foundation
import UIKit

class LineStatusCellField {
    var name : String = ""
    var status : String = ""
    var color : UIColor = .white
    
    init(name:String,status:String,color: UIColor) {
        self.name = name
        self.status = status
        self.color = color
    }
}
