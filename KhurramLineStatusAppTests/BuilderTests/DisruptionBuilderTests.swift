import XCTest

class DisruptionBuilderTests: XCTestCase {
    
    public static var cardPacks = [CardPack]()
    
    override class func setUp() {
        let testerHelpers = TestHelpers.Instance
        let apiViewModel = testerHelpers.createApiLineStatusViewFromJsonFile("disruptions")
        
        let disruptionBuilder = DisruptionsBuilder.init()
        var sut = testerHelpers.createEmptyLineStatusViewModel()
        sut = disruptionBuilder.build(vm: sut, apiVm: apiViewModel)
        
        let goodServiceBuilder = GoodServicesBuilder()
        sut = goodServiceBuilder.build(vm: sut, apiVm: apiViewModel)
        
        DisruptionBuilderTests.cardPacks = sut.cardPacks
        
    }
    
    
    
    func testCardPacksNullValues() {
        XCTAssertNotNil(DisruptionBuilderTests.cardPacks)
    }
    
    func testCardPackCount() {
        XCTAssertEqual(DisruptionBuilderTests.cardPacks.count, 2)
    }
    
    func testPrimaryCardPack() {
       let primaryCardPack = DisruptionBuilderTests.cardPacks[0]
       
       XCTAssertNotNil(primaryCardPack)
       XCTAssertEqual(primaryCardPack.style, CardPackStyles.Primary)
        
       let cardGroups = primaryCardPack.cardGroups
       XCTAssertNotNil(cardGroups)
       XCTAssertEqual(cardGroups.count, 1)
       
       let cardGroup = cardGroups[0]
       XCTAssertEqual(cardGroup.style, CardGroupStyles.Disruption)
       
       let cards = cardGroup.cards
       XCTAssertNotNil(cards)
       XCTAssertGreaterThan(cards.count, 0)
    }
    
    func testSecondaryCardPack() {
        
        let secondaryCardPack = DisruptionBuilderTests.cardPacks[1]
        
        XCTAssertNotNil(secondaryCardPack)
        XCTAssertEqual(secondaryCardPack.style, CardPackStyles.Secondary)
        
        let cardGroups = secondaryCardPack.cardGroups
        XCTAssertNotNil(cardGroups)
        XCTAssertEqual(cardGroups.count, 1)
        
        let cardGroup = cardGroups[0]
        XCTAssertEqual(cardGroup.style, CardGroupStyles.Status)
        
        let cards = cardGroup.cards
        XCTAssertNotNil(cards)
        XCTAssertEqual(cards.count, 1)
        
        let card = cards[0]
        XCTAssertEqual(card.style, CardStyles.OverallStatus)
    }
    
}
