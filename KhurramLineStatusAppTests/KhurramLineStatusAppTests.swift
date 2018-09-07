import XCTest

@testable import KhurramLineStatusApp

class KhurramLineStatusAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
       
        
    }
    
    private func tryParse<T:Codable>(data:Data) ->  (T?)  {
        let decoder = JSONDecoder()
        var result:T
        do {
            result = try decoder.decode(T.self, from: data)
            return result
            
        } catch {
            print("error \(error), descrption:\(error.localizedDescription)")
        }
        return nil
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGoodService() {
        
      let apiLines:[Line] = try! LocalJsonFileReader.Instace.read("good-service")!
      let apiVm = LocalJsonFileReader.Instace.createApiLineStatusViewModel(lines: apiLines)
      let builder = GoodServicesBuilder()
      var vm = LineStatusViewModel.init(style:"",cardPacks : [CardPack]())
      vm = builder.build(vm:vm, apiVm: apiVm)
      XCTAssertEqual(vm.cardPacks.count, 1)
      XCTAssertEqual(vm.cardPacks[0].style, CardPackStyles.Secondary)
      XCTAssertEqual(vm.cardPacks[0].cardGroups.count,1)
      XCTAssertEqual(vm.cardPacks[0].cardGroups[0].style,CardGroupStyles.Status)
      XCTAssertEqual(vm.cardPacks[0].cardGroups[0].cards.count,2)
      XCTAssertEqual(vm.cardPacks[0].cardGroups[0].cards[0].style,CardStyles.OverallGoodStatusCard)
      XCTAssertEqual(vm.cardPacks[0].cardGroups[0].cards[1].style,CardStyles.OverallGoodStatusServiceModesCard)
      XCTAssertEqual(apiVm.hasGoodService, true)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
