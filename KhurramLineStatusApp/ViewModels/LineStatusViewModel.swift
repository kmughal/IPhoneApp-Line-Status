import Foundation

class LineStatusViewModel {
    
    var style: String
    var cardPacks : [CardPack]
    var rawJson : String = ""
    
    init(style:String,cardPacks : [CardPack]) {
        self.style = style
        self.cardPacks = cardPacks
    }
    
    func addCardPack(cardPack:CardPack) {
        self.cardPacks.append(cardPack)
    }
    
    static func isJsonDifferent(oldJson:String,newJson:String) -> Bool {
        return oldJson != newJson
    }
}
