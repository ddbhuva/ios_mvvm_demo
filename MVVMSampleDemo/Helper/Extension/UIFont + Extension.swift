//
//  UIFont + Extension.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 25/11/22.
//

import Foundation
import UIKit

//MARK:- App font name
public enum FontName : String {
    
    case Poppins
    
}

//MARK:- App font type
public enum FontType : String {
    
    case Regular = "Regular"
    case Medium = "Medium"
    case SemiBold = "SemiBold"
    case Bold = "Bold"
    
}

extension UIFont {
    
    public class func Font(_ name: FontName, type: FontType, size: CGFloat) -> UIFont! {
        
        let fontName = name.rawValue + "-" + type.rawValue
        if let font = UIFont(name: fontName, size: size) {
            return font
        }
        
        let fontNameNone = name.rawValue
        if let font = UIFont(name: fontNameNone, size: size) {
            return font
        }
            
        let fontNameRegular = name.rawValue + "-" + "Regular"
        if let font = UIFont(name: fontNameRegular, size: size) {
            return font
        }
        
        return nil
    }
    
    public class func PoppinsRegular(size: CGFloat) -> UIFont {
        return Font(.Poppins, type: .Regular, size: size)
    }
    
    public class func PoppinsMedium(size: CGFloat) -> UIFont {
        return Font(.Poppins, type: .Medium, size: size)
    }
    
    public class func PoppinsSemibold(size: CGFloat) -> UIFont {
        return Font(.Poppins, type: .SemiBold, size: size)
    }
    
    public class func PoppinsBold(size: CGFloat) -> UIFont {
        return Font(.Poppins, type: .Bold, size: size)
    }

}
