//
//  CustomerDetailViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class CustomerDetailViewController: UIViewController {
    @IBOutlet weak var tblBookins: UITableView!
    
    @IBOutlet weak var labelPhoneNumber: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelDOB: UILabel!
    @IBOutlet weak var labelFullName: UILabel!
    var customer: Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let customer = self.customer else {
            return
        }
        var customerObj  = ObjectManager.getInstance().getCustomerById(id: customer.id)
        
        guard let cust = customerObj  else {
            return
        }
        
        self.labelFullName.text = cust.fullName
        self.labelDOB.text = cust.birthDate?.printFormat()
        self.labelEmail.text = cust.contact.emailId
        self.labelPhoneNumber.text = cust.contact.mobileNumber
        
        
        
        
        
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
