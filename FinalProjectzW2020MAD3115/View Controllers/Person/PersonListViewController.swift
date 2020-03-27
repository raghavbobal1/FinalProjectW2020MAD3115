//
//  PersonListViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-26.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit


class PersonCustomCell: UITableViewCell{
    
    @IBOutlet weak var labelName: UILabel!
    
}

class PersonListViewController: UIViewController {
    
    @IBOutlet weak var personTable: UITableView!
    var valueArr: [Person] = Array(ObjectManager.customerObjects.values)
    var currentType =  Customer.typeSName
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var personSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personSegment.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        self.btnAdd.makeFloating()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.handleSegmentChange()
    }
    
    
    @objc func handleSegmentChange()  {
        switch personSegment.selectedSegmentIndex {
        case 0:
            valueArr = Array(ObjectManager.customerObjects.values)
            currentType = Customer.typeSName
        case 1:
            valueArr = Array(ObjectManager.ownerObjects.values)
            currentType = Owner.typeSName
        default:
            valueArr = Array(ObjectManager.driverObjects.values)
            currentType = Driver.typeSName
        }
        self.personTable.reloadData()
    }
    
    @IBAction func btnAddDown(_ sender: Any) {
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
       
        
        var vcStoryBoardId = "AddPersonViewController"
        switch currentType {
               case Customer.typeSName:
                   vcStoryBoardId = "AddPersonViewController"
                   let detailView = storyboard.instantiateViewController(identifier: vcStoryBoardId) as!  AddPersonViewController
                   self.navigationController?.pushViewController(detailView, animated: true)
                   
               case Owner.typeSName:
                    vcStoryBoardId = "AddOwnerViewController"
                   let detailView = storyboard.instantiateViewController(identifier: vcStoryBoardId) as!  AddOwnerViewController
                   self.navigationController?.pushViewController(detailView, animated: true)
               default:
                    vcStoryBoardId = "AddDriverViewController"
                   let detailView = storyboard.instantiateViewController(identifier: vcStoryBoardId) as!  AddDriverViewController
                   self.navigationController?.pushViewController(detailView, animated: true)
               }
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PersonListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valueArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell") as! PersonCustomCell
        cell.labelName.text = valueArr[indexPath.row].firstName
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var vcStoryBoardId = ""
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch currentType {
        case Customer.typeSName:
            vcStoryBoardId = "CustomerDetailViewController"
            let detailView = storyboard.instantiateViewController(identifier: vcStoryBoardId) as!  CustomerDetailViewController
            detailView.customer = self.valueArr[indexPath.row]
            self.navigationController?.pushViewController(detailView, animated: true)
            
        case Owner.typeSName:
             vcStoryBoardId = "OwnerDetailViewController"
            let detailView = storyboard.instantiateViewController(identifier: vcStoryBoardId) as!  OwnerDetailViewController
            detailView.owner = self.valueArr[indexPath.row]
            self.navigationController?.pushViewController(detailView, animated: true)
        default:
             vcStoryBoardId = "DriverDetailViewController"
            let detailView = storyboard.instantiateViewController(identifier: vcStoryBoardId) as!  DriverDetailViewController
            detailView.driver = self.valueArr[indexPath.row]
            self.navigationController?.pushViewController(detailView, animated: true)
        }
        
    }
    

}
