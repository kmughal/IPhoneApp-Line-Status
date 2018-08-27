import Foundation

class GoodServicesBuilder {
    
    func build(vm:LineStatusViewModel,apiVm:ApiLineStatusViewModel) -> LineStatusViewModel {
        if apiVm.hasGoodService {
            vm.addCardPack(
                cardPack: CardPack(
                    style: CardPackStyles.Secondary,
                    cardGroups: [CardGroup(
                        style: CardGroupStyles.Status,
                        cards:[OverallStatusCard(style:
                            CardStyles.OverallStatus,
                                    message: "Good service on all other lines"
                                   )])]))
        }
        
        return vm
    }
}
