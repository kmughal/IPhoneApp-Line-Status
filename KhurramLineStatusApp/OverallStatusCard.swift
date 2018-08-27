import Foundation

class OverallStatusCard : Card {
    var style: CardStyles
    var message : String
    
    init(style:CardStyles,message:String) {
        self.style = style
        self.message = message
    }
}
