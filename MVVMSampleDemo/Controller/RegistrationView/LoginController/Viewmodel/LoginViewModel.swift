//
//  LoginViewModel.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 25/11/22.
//

import Foundation
import UIKit
import CoreData

class LoginViewModel: NSObject {
    
    // Reference to managed object contaxt
    var contaxt = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var item : [Signup]?

    override init() {
        super.init()
    }
    
    // Check exist user Email or Password for Login
    func checkUserLogin(email:String,password:String,completion : @escaping (Bool) -> ()) {
        
        do{
            self.item = try contaxt.fetch(Signup.fetchRequest())
            
            let data = self.item?.firstIndex(where: {$0.email == email})
            
            // Compare exist user record
            if let indx = data{
                if self.item?[indx].email == email && self.item?[indx].password == password{
                    completion(true)
                }else{
                    completion(false)
                }
            }else{
                completion(false)
            }
        }
        catch{
            completion(false)
        }
    }
}

