import Foundation

class DisruptionsBuilder  : DisruptionsConstructor {
    
    func build(
        vm:LineStatusViewModel,
        apiVm: ApiLineStatusViewModel
        ) -> LineStatusViewModel {
        
        if apiVm.hasDisruptions {
            
            let disruptedLines = getDisruptedLines(apiVm: apiVm)
            var cards = [Card]()
            
            for line in disruptedLines {
                cards.append(LineMessageCard.init(
                    style: CardStyles.LineMessage,
                    line: line.name,
                    message: line.lineStatuses[0].statusSeverityDescription,
                    cardParts:createCardParts(line: line)))
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
    
    private func getDisruptedLines(apiVm:ApiLineStatusViewModel) -> [Line] {
        return ApiLineStatusViewModel.getDisruptedLinesOnly(ls: apiVm.lines)
    }
    
    private func createCardParts(line:Line) -> [CardPart] {
        var result = [CardPart]()
        let lineStatuses = line.lineStatuses
        if lineStatuses.count > 0 {
            for lineStatus in lineStatuses {
                if lineStatus.disruption != nil && lineStatus.disruption?.affectedRoutes != nil {
                    if let disruption = lineStatus.disruption {
                        if let affectedRoutes = disruption.affectedRoutes {
                            affectedRoutes.forEach({
                                result.append(
                                    ComplexCardPart(
                                        style: CardPartStyles.ComplexMessage,
                                        direction:$0.direction ,
                                        from: $0.originationName,
                                        to: $0.destinationName))})
                        } else {
                            // ignore affected route
                        }
                    } else {
                        // ignore disruption cast
                    }
                }
            }
        }
        
        
        let displayCard = { (r:CardPart) in
            if r is ComplexCardPart {
                let e = (r as! ComplexCardPart)
                print("\(e.from) - \(e.to)")
            }
        }
        
        result.forEach({displayCard($0)})
        return result
    }
}
