import Foundation

class Card {
    var style : CardStyles
    var line : String
    var name : String
    
    init(style:CardStyles,line:String,name:String) {
        self.style = style
        self.line = line
        self.name = name
    }
}
