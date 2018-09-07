import Foundation

class LocalJsonFileReader {
    
    public static var Instace = LocalJsonFileReader()
    
    func read<T:Codable>(_ fileName:String) throws -> (T?) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            let data = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
            let result:T = tryParse(data: data as Data)!
            return result
        } else {
            
        }
        return nil
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
    
    func createApiLineStatusViewModel(lines:[Line]) -> ApiLineStatusViewModel {
    
        return ApiLineStatusViewModel(
            lines: lines,
            networkStatus: NetworkStatus.CreateEmpty(),
            hasDisruptions: ApiLineStatusViewModel.hasDelays(ls: lines),
            hasGoodService: ApiLineStatusViewModel.hasAtleastOneGoodService(ls: lines),
            rawJsonResponseForLineStatus : ""
        )
    
    }
    
}
