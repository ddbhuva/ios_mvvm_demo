//
//  AppDelegate.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 25/11/22.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        window?.overrideUserInterfaceStyle = .light
        
//        if UserDefaults.bool(key: UDFKey.isUserLogin) {
//            callListViewController()
//        }else{
//            callLoginViewController()
//        }
        
        return true
    }
}

//MARK:- Add Code Database
extension AppDelegate{
    
    // Core data container
    var persistentContainer : NSPersistentContainer{
        
        let container = NSPersistentContainer(name: "MVVMDataBase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let err = error as Error?{
                fatalError("Error  \(err), \(err.localizedDescription)")
            }
        })
        return container
    }
    
    // Core Data Saving Support
    func saveContext()  {
        
        let context = persistentContainer.viewContext
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                let err = error as Error
                fatalError("Error  \(err), \(err.localizedDescription)")
            }
        }
    }
}

extension AppDelegate {
    
    func callLoginViewController(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let navigationController = UINavigationController.init(rootViewController: viewController)
        navigationController.navigationBar.isHidden = true
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
    func callListViewController(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        let navigationController = UINavigationController.init(rootViewController: viewController)
        navigationController.navigationBar.isHidden = true
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
