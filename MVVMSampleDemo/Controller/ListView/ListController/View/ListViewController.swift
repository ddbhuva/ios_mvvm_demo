//
//  ListViewController.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 28/11/22.
//

import UIKit
import Kingfisher

class ListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var listViewModel : ListViewModel?
    var listDataModel : ListDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTableview()
    }
    
    func setupView() {
        listViewModel = ListViewModel()
        callApiViewModel()
    }
    
    func setupTableview(){
        tableView.register(ListDataTableCell.nib, forCellReuseIdentifier: ListDataTableCell.reuseIdentifier)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.popVC()
    }
}

//MARK:- Call api setup
extension ListViewController {
    
    func callApiViewModel(){
    
        // Call api
        listViewModel?.getListData()
        
        // Call back api
        callbackApiViewModel()
    }

    func callbackApiViewModel(){
      
        // Call back error
        listViewModel?.showAlert = { message  in
            self.showAlert(message: message)
        }
        
        // Call back response
        listViewModel?.getSuccessData = { response in
            self.listDataModel = response
            self.tableView.reloadData()
        }
    }
}

//MARK:- Call UITableView Delegate & Datasource
extension ListViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDataModel?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListDataTableCell.reuseIdentifier) as! ListDataTableCell
        
        let data = listDataModel?.data?[indexPath.row]
        
        cell.lblTitle.text = data?.categoryName ?? ""
        
        cell.imgVIew.download(from: data?.imagePath ?? "")
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
