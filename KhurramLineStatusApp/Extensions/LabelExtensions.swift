import Foundation
import UIKit

extension UILabel {
    
    func setFont(name:String) -> Void {
        
        guard let customFont = UIFont(name:name, size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the \(name) font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        self.font = UIFontMetrics.default.scaledFont(for: customFont)
        self.adjustsFontForContentSizeCategory = true
    }
    
    func setFontWithFontSize(name:String,size:Int) -> Void {
        
        guard let customFont = UIFont(name:name, size: CGFloat(size)) else {
            fatalError("""
                Failed to load the \(name) font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        self.font = UIFontMetrics.default.scaledFont(for: customFont)
        self.adjustsFontForContentSizeCategory = true
    }
    
    func startAnimation(duration:TimeInterval) {
        let slideInFromLeftTransition = CATransition()
        slideInFromLeftTransition.type = kCATransitionPush
        slideInFromLeftTransition.subtype = kCATransitionFromBottom
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromLeftTransition.fillMode = kCAFillModeRemoved
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
    }
}





