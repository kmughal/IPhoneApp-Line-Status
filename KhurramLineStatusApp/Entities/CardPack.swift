import Foundation

class CardPack {
    var style : CardPackStyles
    var cardGroups:[CardGroup]
    
    init(style:CardPackStyles,cardGroups:[CardGroup]) {
        self.style = style
        self.cardGroups = cardGroups
    }
}
