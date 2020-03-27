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
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let owner = self.owner else {
            return
        }
        var ownerObj  = ObjectManager.getInstance().getOwnerById(id: owner.id)
        
        guard let o = ownerObj  else {
            return
        }
        
        self.labelFullName.text = o.fullName
        self.labelDOB.text = o.birthDate?.printFormat()
        self.labelEmail.text = o.contact.emailId
        self.labelPhoneNumber.text = o.contact.mobileNumber
        self.labelCompanyName.text = o.companyTitle
        
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
