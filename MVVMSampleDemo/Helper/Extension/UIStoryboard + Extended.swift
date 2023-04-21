//
//  UIStoryboard + Extended.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 25/11/22.
//

import Foundation
import UIKit

fileprivate enum Storyboard : String {
    
    case main = "Main"
    
}

fileprivate extension UIStoryboard {
    
    static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
    
    static func loadFromMain(_ identifier: String) -> UIViewController {
        return load(from: .main, identifier: identifier)
    }
    
}

// MARK: App View Controllers Main storyboard

/// Load from Main Storyboard

extension UIStoryboard {
    
    class func loginViewController() -> LoginViewController{
        return loadFromMain("LoginViewController") as! LoginViewController
    }
    
    class func signupViewController() -> SignupViewController{
        return loadFromMain("SignupViewController") as! SignupViewController
    }
    
    class func listViewController() -> ListViewController{
        return loadFromMain("ListViewController") as! ListViewController
    }
}

extension UITableViewCell{
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

extension UICollectionViewCell{
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
