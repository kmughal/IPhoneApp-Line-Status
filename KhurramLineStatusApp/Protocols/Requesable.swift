import Foundation
import RxSwift

protocol Requestable {
    func getResult<T:Codable>(_ url:String) -> Observable<(T,String)>
    
}
