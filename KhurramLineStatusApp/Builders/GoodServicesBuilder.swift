import Foundation

class GoodServicesBuilder {
    
    func build(vm:LineStatusViewModel,apiVm:ApiLineStatusViewModel) -> LineStatusViewModel {
        if apiVm.hasGoodService {
            vm.addCardPack(
                cardPack: CardPack(
                    style: CardPackStyles.Secondary,
                    cardGroups: [CardGroup(
                        style: CardGroupStyles.Status,
                        cards:[Card(style:
                            CardStyles.OverallStatus,
                                    line: "Good service on all other lines",
                                    name: "")])]))
        }
        
        return vm
    }
}
