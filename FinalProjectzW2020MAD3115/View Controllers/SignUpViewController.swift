//
//  SignUpViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Raghav Bobal on 2020-03-17.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController
{
    @IBOutlet weak var txtfullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var txtDOB: UIDatePicker!
    override func viewDidLoad()
       {
           super.viewDidLoad()
           self.txtDOB.setInputViewDatePicker(target: self, selector: #selector(tapDone))
       }
    
   @IBAction func backBtn(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpBtn(_ sender: Any)
      {
          let txtNumber = txtMobileNumber.text!
          let txtmail  = txtEmail.text!
          
          if(txtfullName.text == "")
          {
              let alertController = UIAlertController(title:"Error", message: "Invalid entry, name left blank", preferredStyle: .alert)
              alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
              self.present(alertController, animated: true, completion: nil)
              return
          }
          
          if Validations.email(email: txtmail == false && Validations.mobileNumber(number: txtNumber) == false)
          {
              let alertController = UIAlertController(title:"Error", message: "Invalid email ID and phone number", preferredStyle: .alert)
              alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
              self.present(alertController, animated: true, completion: nil)
              return
          }
          
          if(Validations.email(email: txtmail) == false)
              {
                  let alertController = UIAlertController(title:"Error", message: "Invalid email ID", preferredStyle: .alert)
                  alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                  self.present(alertController, animated: true, completion: nil)
                  return
              }
          
          if(Validations.mobileNumber(number: txtNumber) == false)
          {
              let alertController = UIAlertController(title:"Error", message: "Invalid phone number", preferredStyle: .alert)
              alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
              self.present(alertController, animated: true, completion: nil)
              return
          }
          let c = Customer(customerId: txtNewCustomerId.text!, name: txtNewCustomerName.text!, email: txtNewCustomerEmail.text!, userName: txtNewCustomerUserName.text!, password: txtNewCustomerPassword.text!, mobileNumber: txtNewCustomerNumber.text!, dob: txtNewCustomerDOB.text!)
          
              DataRepository.getInstance().addCustomer(customer: c)
          
          
          let alertController = UIAlertController(title: "Success", message: "Customer Added", preferredStyle: .alert)
              alertController.addAction(UIAlertAction(title: "OK", style: .default, handler:
              {action in self.dismissView()}))
                  self.present(alertController, animated: true, completion: nil)
       }
          func dismissView()
          {
              navigationController?.popViewController(animated: true)
          }
        
        @objc func tapDone()
        {
          if let datePicker = self.txtNewCustomerDOB.inputView as? UIDatePicker
          {
                let dateformatter = DateFormatter()
                dateformatter.dateStyle = .medium
                self.txtNewCustomerDOB.text = dateformatter.string(from: datePicker.date)
            }
            self.txtNewCustomerDOB.resignFirstResponder()
          }
    }
    
    
}
