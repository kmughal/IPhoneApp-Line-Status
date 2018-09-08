import XCTest

@testable import KhurramLineStatusApp

class KhurramLineStatusAppTests: XCTestCase {
    
    func testGoodService() {
        
      let apiViewModel = TestHelpers.init().createApiLineStatusViewFromJsonFile("good-service")
      let builder = GoodServicesBuilder()
      var sut = LineStatusViewModel.init(style:"",cardPacks : [CardPack]())
      sut = builder.build(vm:sut, apiVm: apiViewModel)
      XCTAssertEqual(sut.cardPacks.count, 1)
      XCTAssertEqual(sut.cardPacks[0].style, CardPackStyles.Secondary)
      XCTAssertEqual(sut.cardPacks[0].cardGroups.count,1)
      XCTAssertEqual(sut.cardPacks[0].cardGroups[0].style,CardGroupStyles.Status)
      XCTAssertEqual(sut.cardPacks[0].cardGroups[0].cards.count,2)
      XCTAssertEqual(sut.cardPacks[0].cardGroups[0].cards[0].style,CardStyles.OverallGoodStatusCard)
      XCTAssertEqual(sut.cardPacks[0].cardGroups[0].cards[1].style,CardStyles.OverallGoodStatusServiceModesCard)
      XCTAssertEqual(apiViewModel.hasGoodService, true)
    }
}
