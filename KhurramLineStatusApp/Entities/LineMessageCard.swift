import Foundation

class LineMessageCard : Card {
    
    var style : CardStyles
    var line : String
    var message : String
    var cardParts : [CardPart]
    
    init(style:CardStyles,line:String,message:String,cardParts:[CardPart] = [CardPart]()) {
        self.style = style
        self.line = line
        self.message = message
        self.cardParts = cardParts
    }
    
    func addCardPart(cardPart:CardPart) {
        self.cardParts.append(cardPart)
    }
}

