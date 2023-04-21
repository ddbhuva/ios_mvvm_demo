//
//  LoginViewController.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 25/11/22.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var loginViewModel : LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        loginViewModel = LoginViewModel()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view == view {
            self.view.endEditing(true)
        }
    }
    
    @IBAction func btnActSignin(_ sender: Any) {
        checkValidations()
    }
    
    @IBAction func btnActCreateAccount(_ sender: Any) {
        let vc = UIStoryboard.signupViewController()
        self.pushVC(vc)
    }
}

extension LoginViewController {
    
    // Check validation
    func checkValidations() {
        
        if !CheckValidation.shared.validateEmail(text: txtEmail.text!) {
            if txtEmail.text != ""{
                showAlert(title: "Message",message: Messages.emailV)
            }else{
                showAlert(title: "Message",message: Messages.email)
            }
        }else if txtPassword.text == "" {
            showAlert(title: "Message",message: Messages.password)
        }else{
            callLoginView()
        }
    }
    
    // Fetch exist user for login
    func callLoginView() {
        let email = txtEmail.text ?? ""
        let password = txtPassword.text ?? ""
        
        loginViewModel?.checkUserLogin(email: email, password: password, completion: { (status) in
            if status{
                UserDefaults.setObject(value: true, key: UDFKey.isUserLogin)
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.callListViewController()
            }else{
                self.showAlert(title: "Message",message: Messages.loginError)
            }
        })
    }
}

// MARK:- UITextFieldDelegate
extension LoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

     if textField == txtEmail {
            txtPassword.becomeFirstResponder()
        } else if textField == txtPassword {
            textField.resignFirstResponder()
        }

        return true
    }
}
