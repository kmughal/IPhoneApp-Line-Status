import Foundation

class LineStatusViewModel {
    
    var style: String
    var cardPacks : [CardPack]
    
    static var LastResponse = ""
    
    init(style:String,cardPacks : [CardPack]) {
        self.style = style
        self.cardPacks = cardPacks
    }
    
    func addCardPack(cardPack:CardPack) {
        self.cardPacks.append(cardPack)
    }
}
