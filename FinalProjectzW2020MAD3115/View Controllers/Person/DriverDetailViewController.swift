//
//  DriverDetailViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class DriverDetailViewController: UIViewController {
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelDrivingLicence: UILabel!
    @IBOutlet weak var tblVehicles: UITableView!
    
    @IBOutlet weak var labelPhoneNumber: UILabel!
    @IBOutlet weak var labelDOB: UILabel!
    @IBOutlet weak var lableFullName: UILabel!
    var driver: Person?
    var driverObj: Driver?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let driver = self.driver else {
            return
        }
        var driverObj  = ObjectManager.getInstance().getDriverById(id: driver.id)
        
        guard let d = driverObj  else {
            return
        }
        
        self.driverObj = d
        self.lableFullName.text = d.fullName
        self.labelDOB.text
            = d.birthDate?.printFormat()
        self.labelEmail.text = d.contact.emailId
        self.labelPhoneNumber.text = d.contact.mobileNumber
        self.labelDrivingLicence.text = d.drivingLicenceNumber
        
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


extension DriverDetailViewController: UITableViewDataSource, UITableViewDelegate{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           var cell = tableView.dequeueReusableCell(withIdentifier: "OwnerDetailVehicleCell")
        
        
        if let vehicle = ObjectManager.getInstance().getVehicleForDriver(id: self.driverObj!.id)
        {
            
            cell?.textLabel?.text = "Vehicle id: \(vehicle.vehicleId)"
            
        }
        
        return cell!
    }
    
       func numberOfSections(in tableView: UITableView) -> Int {
           return 1
           
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vcStoryBoardId = "VehicleDetailViewController"
                var detailView = storyboard.instantiateViewController(identifier: vcStoryBoardId) as!  VehicleDetailViewController
        detailView.vehicle = ObjectManager.getInstance().getVehicleForDriver(id: self.driverObj!.id)!
                 self.navigationController?.pushViewController(detailView, animated: true)
       }

    
    
    
}
