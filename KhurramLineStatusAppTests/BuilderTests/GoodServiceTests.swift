import XCTest

@testable import KhurramLineStatusApp

class GoodServiceBuildersTests: XCTestCase {
   
    static var cardPacks: [CardPack] = []
    
    override class func setUp() {
        super.setUp()
        let apiViewModel:ApiLineStatusViewModel = TestHelpers.Instance.createApiLineStatusViewFromJsonFile("good-service")
        let builder = GoodServicesBuilder()
        var sut = LineStatusViewModel.init(style:"",cardPacks : [CardPack]())
        sut = builder.build(vm: sut, apiVm: apiViewModel)
        GoodServiceBuildersTests.cardPacks = sut.cardPacks
    }
    
    func testForNull() {
        XCTAssertNotNil(GoodServiceBuildersTests.cardPacks)
        
        let cardGroups = GoodServiceBuildersTests.cardPacks[0].cardGroups
        XCTAssertNotNil(cardGroups)
        
        let cards = cardGroups[0].cards
        XCTAssertNotNil(cards)
    }
    
    func testCardPacksCountAndStyle() {
         XCTAssertEqual(GoodServiceBuildersTests.cardPacks.count, 1)
         XCTAssertEqual(GoodServiceBuildersTests.cardPacks[0].style, CardPackStyles.Secondary)
    }
    
    func testCardGroupsCountAndStyle() {
        let cardGroups = GoodServiceBuildersTests.cardPacks[0].cardGroups
        
         XCTAssertEqual(cardGroups.count, 1)
         XCTAssertEqual(cardGroups[0].style, CardGroupStyles.Status)
    }
    
    func testCardsCount() {
        let cardGroup = GoodServiceBuildersTests.cardPacks[0].cardGroups[0]
        XCTAssertEqual(cardGroup.cards.count,2)
    }
    
    func testCardForOverallStatus() {
        let firstCard = GoodServiceBuildersTests.cardPacks[0].cardGroups[0].cards[0]
        XCTAssertEqual(firstCard.style,CardStyles.OverallGoodStatusCard)
    }
    
    func testModesCard() {
        let secondCard = GoodServiceBuildersTests.cardPacks[0].cardGroups[0].cards[1]
        XCTAssertEqual(secondCard.style,CardStyles.OverallGoodStatusServiceModesCard)
    }
}
