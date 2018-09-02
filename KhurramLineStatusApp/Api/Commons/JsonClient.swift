import Foundation
import RxCocoa
import RxSwift

class JsonClient : Requestable {
    
    func getResult<T:Codable>(_ url:String) -> Observable<(T,String)> {
        
        return Observable.create {
            observer in
            let dataStream = self.getDataStream(url:url).subscribe(onNext: { result in
                let rEntity:T
                print("url:\(url)")
                rEntity = self.tryParse(data:result)!
                let result:(T,String) = (rEntity,String.init(data: result, encoding: .utf8)!)
                observer.onNext(result)
            })
            return Disposables.create { dataStream.dispose() }
        }
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
    
    private func getDataStream(url:String) -> Observable<Data> {
        return Observable.create {
            observer in
            let url = URL(string:url)
            let task = URLSession.shared.dataTask(with: url!) {
                data,response,error in
                if let dataResponse = data {
                    observer.onNext(dataResponse)
                } else {
                    observer.onError(RxCocoaURLError.unknown)
                }
            }
            task.resume()
            return Disposables.create { task.cancel() }
        }
    }
}
