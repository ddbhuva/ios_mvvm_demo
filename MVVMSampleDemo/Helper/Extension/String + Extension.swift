//
//  String + Extension.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 28/11/22.
//

import Foundation
import UIKit

extension String {
    
    //MARK:- Replace any character
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    
    //MARK:- Remove white space from string
    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
}
