//
//  UIViewController + Extensions.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 25/11/22.
//

import Foundation
import UIKit

// Navigation Controller

extension UIViewController{
    
    public func pushVC(_ vc: UIViewController,animated : Bool = true) {
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    public func popVC(animated: Bool = true) {
        _ = navigationController?.popViewController(animated: animated)
    }
    
    public func popView(to viewcontroller: UIViewController) {
        DispatchQueue.main.async {
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: viewcontroller.classForCoder) {
                    _ =  self.navigationController?.popToViewController(controller, animated: true)
                    break
                } else {
                    self.navigationController?.pushViewController(viewcontroller, animated: true)
                    break
                }
            }
        }
    }
    
    public func dismissViewControllers() {
        
        guard let vc = self.presentingViewController else { return }
        
        while (vc.presentingViewController != nil) {
            vc.dismiss(animated: true, completion: nil)
        }
    }
}

// UIAlertController

extension UIViewController {
    
    func showAlert(title: String? = nil, message: String? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: { error in
            
        })
        
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: {
            
        })
    }
    
    func showAlert(title: String? = nil, message: String? = nil, completion: (() -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            completion?()
        })
        
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: {
            
        })
    }
    
    func showAlert(title: String? = nil, message: String? = nil, titleAction: String? = "OK", completion: (() -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
       
        let action = UIAlertAction(title: titleAction, style: .cancel, handler: { _ in
            completion?()
        })
        
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: {
        })
    }
}
