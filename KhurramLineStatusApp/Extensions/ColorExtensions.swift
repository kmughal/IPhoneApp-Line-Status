import Foundation
import UIKit


extension UIColor {
    
    static private func getSettings() -> [String:Any] {
        return Bundle.main.infoDictionary!
    }
    
   static private func getStringValue(propertyName:String) -> String {
        let settings = getSettings()
        return settings[propertyName] as! String
    }
    
    static func lineColor(name:String) -> UIColor {
        let colors: [String:UIColor] =
            [
            "Circle": UIColor.init(hex: getStringValue(propertyName:"Circle")),
            "District" :UIColor.init(hex: getStringValue(propertyName:"District")),
            "Waterloo" :UIColor.init(hex: getStringValue(propertyName:"Waterloo")),
            "Overground" :UIColor.init(hex: getStringValue(propertyName:"Overground")),
            "Bakerloo" :UIColor.init(hex: getStringValue(propertyName:"Bakerloo")),
            "Hammer" :UIColor.init(hex: getStringValue(propertyName:"Hammer")),
            "Victoria" :UIColor.init(hex: getStringValue(propertyName:"Victoria")),
            "Piccadilly" : Shared.Instance.DARK_BLUE,
             "Metro" : UIColor.purple,
             "Tfl": Shared.Instance.DARK_BLUE,
             "Central" : .red,
             "Northern" : .black
            ]
       
       let n = name.lowercased()
       let result = colors.filter({
            $0.key.lowercased().contains(n) || n.contains($0.key.lowercased())
        })
        
        if result.count > 0 {
            return result.first!.value
        }
        
        return UIColor.white
    }
    
    convenience init(hex:String) {
        
        var cString:String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            let firstIndex = cString.index(cString.startIndex, offsetBy: 1)
            let endIndex = cString.index(cString.endIndex, offsetBy: 0)
            let range = firstIndex..<endIndex
            cString = String(cString[range])
            
        }
        
        if ((cString.count) != 6) {
            self.init (red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        } else {
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            
            self.init(red:CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
        }
    }
}



