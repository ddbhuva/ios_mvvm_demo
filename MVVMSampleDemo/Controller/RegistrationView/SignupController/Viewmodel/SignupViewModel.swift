//
//  SignupViewModel.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 28/11/22.
//

import Foundation
import UIKit
import CoreData

class SignupViewModel: NSObject {
    
    // Reference to managed object contaxt
    var contaxt = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var item : [Signup]?
    
    override init() {
        super.init()
    }
    
    // Add new user Firstname,Lastname,Email or Password to Database
    func addUserData(fName:String,lName:String,email:String,password:String,completion : @escaping (Bool,String) -> ()) {
        
        let addNewUser = Signup(context: contaxt)
        
        // Fetch store record
        do{
            self.item = try contaxt.fetch(Signup.fetchRequest())
        }
        catch{
        }
        
        let data = self.item?.firstIndex(where: {$0.email == email})
        
        // Check Email in already exist or not
        if let indx = data{
            if self.item?[indx].email == email{
                completion(false, Messages.emailAlreadyExist)
            }else{
                completion(false, Messages.error)
            }
        }else{
            addNewUser.firstname = fName
            addNewUser.lastname = lName
            addNewUser.email = email
            addNewUser.password = password
           
            // Save this Data
            do{
                try self.contaxt.save()
                completion(true, Messages.signupSuccess)
            }
            catch{
                completion(false, Messages.error)
            }
        }
    }
}
