import Foundation

class SimpleTextCardPart : CardPart {
    
    var style:CardPartStyles
    var message : String
    
    init(style:CardPartStyles,message:String) {
        self.style = style
        self.message = message
    }
}
