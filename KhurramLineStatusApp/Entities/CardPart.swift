import Foundation

class CardPart {
    var style : CardPartStyles
    var state : String
    var message : String
    
    init(style:CardPartStyles,state:String,message:String) {
        self.style = style
        self.state = state
        self.message = message
    }
}
