//
//  ListViewModel.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 28/11/22.
//

import Foundation
import UIKit
import ProgressHUD

class ListViewModel : NSObject {
    
    // Define network Status for check network connection
    var networkStatus = Reach().connectionStatus()
    
    // Get response from api and send to view
    var getSuccessData: ((ListDataModel) -> ())?
    
    // Show Error
    var showAlert : ((String) -> ())?
    
    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()
    }
    
    // Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }
    
    // Check internet reachability
    func getListData() {
        
        switch networkStatus {
        case .Offline:
            ez.runThisInMainThread {
                self.showAlert?(Messages.networkUnavailable)
            }
        case .Online:
            callGetListData()
        case .Unknown:
            break
        }
    }
}

// Call Api
extension ListViewModel {
    
    func callGetListData() {
      
        ProgressHUD.show()
        nm.dataservide.request(.resource) { result in
            ProgressHUD.dismiss()
            switch result {
                
            case let .success(response):
                if let listDataModel = try? JSONDecoder().decode(ListDataModel.self, from: response.data) {
                    
                    if  listDataModel.status == "success" {
                        self.getSuccessData?(listDataModel)
                    }else{
                        self.showAlert?(listDataModel.message ?? "")
                    }
                }else{
                    self.showAlert?(Messages.technicalIssue)
                }
            case let .failure(error):
                self.showAlert?(error.localizedDescription)
            }
        }
    }
}
