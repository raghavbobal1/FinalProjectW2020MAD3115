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
    var customerObj: Customer?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let customer = self.customer else {
            return
        }
        var customerObj  = ObjectManager.getInstance().getCustomerById(id: customer.id)
        
        guard let cust = customerObj  else {
            return
        }
        self.customerObj = customerObj
        
        self.labelFullName.text = cust.fullName
        self.labelDOB.text = cust.birthDate?.printFormat()
        self.labelEmail.text = cust.contact.emailId
        self.labelPhoneNumber.text = cust.contact.mobileNumber
        
        self.tblBookins.dataSource = self
        self.tblBookins.delegate = self
        
        
        
        
        // Do any additional setup after loading the view.
    }
    


}


extension CustomerDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print((self.customerObj?.getVehicleRents().count)!)
        return (self.customerObj?.getVehicleRents().count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CustomerDetailRentCell")
        cell?.textLabel?.text = "Booking id: \((self.customerObj?.getVehicleRents()[indexPath.row].id)!)"
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let vcStoryBoardId = "RentDetailViewController"
             var detailView = storyboard.instantiateViewController(identifier: vcStoryBoardId) as!  RentDetailViewController
             detailView.vehicleRent = self.customerObj?.getVehicleRents()[indexPath.row]
              self.navigationController?.pushViewController(detailView, animated: true)
    }

    
    
    
    
}
