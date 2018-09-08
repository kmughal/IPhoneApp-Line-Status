import Foundation

class TestHelpers {
    
    public static var Instance = TestHelpers()
    
    func createEmptyLineStatusViewModel() -> LineStatusViewModel {
        return LineStatusViewModel.init(style: String(), cardPacks: [CardPack]())
    }
    
    func createApiLineStatusViewFromJsonFile(_ fileName:String) -> ApiLineStatusViewModel {
        do {
            if let lines:[Line] = try LocalJsonFileReader.Instace.read(fileName) {
                return ApiLineStatusViewModel(
                    lines: lines,
                    networkStatus: NetworkStatus.CreateEmpty(),
                    hasDisruptions: ApiLineStatusViewModel.hasDelays(ls: lines),
                    hasGoodService: ApiLineStatusViewModel.hasAtleastOneGoodService(ls: lines),
                    rawJsonResponseForLineStatus : ""
                )
            } else {
                print("fail to load api lines from \(fileName)")
            }
            
        } catch {
            print("error reading \(fileName):\(error)")
        }
        return ApiLineStatusViewModel.CreateEmpty()
    }
}
