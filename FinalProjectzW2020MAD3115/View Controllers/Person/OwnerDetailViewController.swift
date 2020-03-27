//
//  OwnerDetailViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class OwnerDetailViewController: UIViewController {
    @IBOutlet weak var tblVehicles: UITableView!
    
    @IBOutlet weak var labelCompanyName: UILabel!
    @IBOutlet weak var labelPhoneNumber: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelDOB: UILabel!
    @IBOutlet weak var labelFullName: UILabel!
    var owner: Person?
    var ownerObjs: Owner?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let owner = self.owner else {
            return
        }
        var ownerObj  = ObjectManager.getInstance().getOwnerById(id: owner.id)
        
        guard let o = ownerObj  else {
            return
        }
        self.ownerObjs = o
        
        self.labelFullName.text = o.fullName
        self.labelDOB.text = o.birthDate?.printFormat()
        self.labelEmail.text = o.contact.emailId
        self.labelPhoneNumber.text = o.contact.mobileNumber
        self.labelCompanyName.text = o.companyTitle
        
        self.tblVehicles.dataSource = self
        self.tblVehicles.delegate = self
        
        // Do any additional setup after loading the view.
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


extension OwnerDetailViewController: UITableViewDataSource, UITableViewDelegate{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print((self.ownerObjs?.vehicleList.values.count)!)
           return (self.ownerObjs?.vehicleList.count)!
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           var cell = tableView.dequeueReusableCell(withIdentifier: "OwnerDetailVehicleCell")
        cell?.textLabel?.text = "Vehicle id: \((Array((self.ownerObjs?.vehicleList.values)!)[indexPath.row].vehicleId))"
           return cell!
       }
       
       func numberOfSections(in tableView: UITableView) -> Int {
           return 1
           
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vcStoryBoardId = "VehicleDetailViewController"
                var detailView = storyboard.instantiateViewController(identifier: vcStoryBoardId) as!  VehicleDetailViewController
        detailView.vehicle = Array((self.ownerObjs?.vehicleList.values)!)[indexPath.row]
                 self.navigationController?.pushViewController(detailView, animated: true)
       }

    
    
    
}
