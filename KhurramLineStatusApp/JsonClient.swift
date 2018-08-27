import Foundation
import RxCocoa
import RxSwift

class JsonClient {
    
    func getResult<T:Codable>(_ url:String) -> Observable<T> {
        
        return Observable.create {
            observer in
            let dataStream = self.getDataStream(url:url).subscribe(onNext: { result in
                let rEntity:T
                rEntity = self.tryParse(data:result)!
                observer.onNext(rEntity)
            })
            return Disposables.create { dataStream.dispose() }
        }
    }
    
    private func tryParse<T:Codable>(data:Data) ->  T?  {
        let decoder = JSONDecoder()
        var result:T
        do {
            let jsonString = try JSONSerialization.jsonObject(with:
                data, options: [])
            
             result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            print("error \(error)")
        }
        return nil
    }
    
    private func getDataStream(url:String) -> Observable<Data> {
        return Observable.create {
            observer in
            let url = URL(string:url)
            print(url)
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
