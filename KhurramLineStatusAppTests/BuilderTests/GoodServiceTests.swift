import XCTest

@testable import KhurramLineStatusApp

class GoodServiceBuildersTests: XCTestCase {
   
    private var cardPacks: [CardPack] = []
    private var cardGroups : [CardGroup] = []
    
    override func setUp() {
        super.setUp()
        let apiViewModel:ApiLineStatusViewModel = TestHelpers.Instance.createApiLineStatusViewFromJsonFile("good-service")
        let builder = GoodServicesBuilder()
        var sut = LineStatusViewModel.init(style:"",cardPacks : [CardPack]())
        sut = builder.build(vm: sut, apiVm: apiViewModel)
        self.cardPacks = sut.cardPacks
    }
    
    func testForNull() {
        XCTAssertNotNil(self.cardPacks)
        
        let cardGroups = self.cardPacks.first?.cardGroups
        XCTAssertNotNil(cardGroups)
        
        let cards = cardGroups?.first?.cards
        XCTAssertNotNil(cards)
    }
    
    func testCardPacksCountAndStyle() {
         XCTAssertEqual(cardPacks.count, 1)
         XCTAssertEqual(cardPacks.first?.style, CardPackStyles.Secondary)
    }
    
    func testCardGroupsCountAndStyle() {
         XCTAssertEqual(cardPacks.first?.cardGroups.count, 1)
         XCTAssertEqual(cardPacks.first?.cardGroups.first?.style, CardGroupStyles.Status)
    }
    
    func testCardsCount() {
        let cardGroup = cardPacks.first?.cardGroups.first
        XCTAssertEqual(cardGroup?.cards.count,2)
    }
    
    func testCardForOverallStatus() {
         let cardGroup = cardPacks.first?.cardGroups.first
        let firstCard = cardGroup?.cards.first
        XCTAssertEqual(firstCard?.style,CardStyles.OverallGoodStatusCard)
    }
    
    func testModesCard() {
        let cardGroup = cardPacks.first?.cardGroups.first
        let secondCard = cardGroup?.cards[1]
        XCTAssertEqual(secondCard?.style,CardStyles.OverallGoodStatusServiceModesCard)
    }
}
