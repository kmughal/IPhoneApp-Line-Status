import Foundation

class GoodServicesBuilder {
    
    
    private func addOverallStatus(vm:LineStatusViewModel,cards: [Card]) -> LineStatusViewModel {
        vm.addCardPack(
            cardPack: CardPack(
                style: CardPackStyles.Secondary,
                cardGroups: [CardGroup(
                    style: CardGroupStyles.Status,
                    cards:cards)]))
        return vm
    }
    
    private func getOverallStatusCards() -> [Card] {
        return [
            OverallStatusCard(
                style: CardStyles.OverallStatus,
                message: "Good service on all other lines"
            )]
    }
    
    private func getGoodServiceStatusCards() -> [Card] {
      return [OverallGoodStatusCard(),OverallGoodStatusServiceModesCard()]
    }
    
    func build(vm:LineStatusViewModel,apiVm:ApiLineStatusViewModel) -> LineStatusViewModel {
        if apiVm.hasDisruptions {
            return addOverallStatus(vm: vm, cards: getOverallStatusCards())
        } else if apiVm.hasGoodService {
            return addOverallStatus(vm: vm, cards: getGoodServiceStatusCards())
        }
        return vm
    }
}
