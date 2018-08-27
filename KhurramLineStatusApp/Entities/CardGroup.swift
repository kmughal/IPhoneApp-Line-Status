import Foundation

class CardGroup {
    var style:CardGroupStyles
    var cards : [Card]
    
    init(style:CardGroupStyles,cards:[Card]) {
        self.style = style
        self.cards = cards
    }
}
