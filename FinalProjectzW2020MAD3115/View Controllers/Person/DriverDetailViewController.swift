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
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let driver = self.driver else {
            return
        }
        var driverObj  = ObjectManager.getInstance().getDriverById(id: driver.id)
        
        guard let d = driverObj  else {
            return
        }
        
        self.lableFullName.text = d.fullName
        self.labelDOB.text
            = d.birthDate?.printFormat()
        self.labelEmail.text = d.contact.emailId
        self.labelPhoneNumber.text = d.contact.mobileNumber
        self.labelDrivingLicence.text = d.drivingLicenceNumber
        
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
