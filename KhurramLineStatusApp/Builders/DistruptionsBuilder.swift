import Foundation

class DisruptionsBuilder {
    
    func getDisruptedLines(apiVm:ApiLineStatusViewModel) -> [Line] {
        return ApiLineStatusViewModel.getDisruptedLinesOnly(ls: apiVm.lines)
    }
    
    func build(vm:LineStatusViewModel,apiVm: ApiLineStatusViewModel) -> LineStatusViewModel {
        if apiVm.hasDisruptions {
            
            let disruptedLines = getDisruptedLines(apiVm: apiVm)
            
            var cards = [Card]()
            for line in disruptedLines {
                cards.append(Card.init(
                    style: CardStyles.LineMessage,
                    line: line.name,
                    name: line.lineStatuses[0].statusSeverityDescription))
            }
            
            vm.addCardPack(
                cardPack: CardPack.init(
                    style:CardPackStyles.Secondary,
                    cardGroups:[CardGroup.init(
                        style:CardGroupStyles.Disruption,
                        cards: cards)]))
        }
        return vm
    }
}
