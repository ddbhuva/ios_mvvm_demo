//
//  Validations.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 28/11/22.
//

import Foundation
import UIKit

class CheckValidation {
    
    static let shared = CheckValidation()
    
    // Email Validation
    // Ex :- "test.123@gmail.com"
    func validateEmail(text: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._ %+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
    
    // Password Validation
    // Password length Minimum 8 character
    // Ex :- "Test#123.Com"
    func validatePassword(text: String) -> Bool {
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordTest.evaluate(with: text.removeWhitespace())
    }
    
    // Username Validation
    // Username must between 2 to 18 character
    // Username should be in alphabetical Ex :- "Test"
    func validateName(text:String) -> Bool {
        let usernameRegEx = "[A-Za-z]{2,18}"
        let usernameTest = NSPredicate(format:"SELF MATCHES %@", usernameRegEx)
        return usernameTest.evaluate(with: text)
    }
}
