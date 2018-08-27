import Foundation

class LineMessageCard : Card {
    
    var style : CardStyles
    var line : String
    var name : String
    var cardParts : [CardPart]
    
    init(style:CardStyles,line:String,name:String,cardParts:[CardPart] = [CardPart]()) {
        self.style = style
        self.line = line
        self.name = name
        self.cardParts = cardParts
    }
    
    func addCardPart(cardPart:CardPart) {
        self.cardParts.append(cardPart)
    }
}

