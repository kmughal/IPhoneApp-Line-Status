import Foundation

class ComplexCardPart : CardPart {
    var style: CardPartStyles
    var direction : String
    var from:String
    var to:String
    
    init(style:CardPartStyles,direction:String,from:String,to:String) {
        self.style = style
        self.direction = direction
        self.to = to
        self.from = from
    }
}
