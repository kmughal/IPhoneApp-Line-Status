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
}

