import Foundation
import UIKit

extension CALayer {
    
    func setLeftBorder(width:Float,height:Float,color:UIColor) -> Void {
        self.frame = CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height))
        self.backgroundColor = color.cgColor
    }
}
