////
////  SignUpViewController.swift
////  FinalProjectzW2020MAD3115
////
////  Created by Raghav Bobal on 2020-03-19.
////  Copyright © 2020 com.lambton. All rights reserved.
////
//
//import UIKit
//
//class SignUpViewController: UIViewController
//{
//        @IBOutlet weak var txtfullName: UITextField!
//        @IBOutlet weak var txtEmail: UITextField!
//        @IBOutlet weak var txtPassword: UITextField!
//        @IBOutlet weak var txtMobileNumber: UITextField!
//        @IBOutlet weak var txtDOB: UIDatePicker!
//        override func viewDidLoad()
//           {
//               super.viewDidLoad()
//               self.txtDOB.setInputViewDatePicker(target: self, selector: #selector(tapDone))
//           }
//        
//       @IBAction func backBtn(_ sender: Any)
//        {
//            navigationController?.popViewController(animated: true)
//        }
//        
//        @IBAction func signUpBtn(_ sender: Any)
//          {
//                let fullName = self.txtfullName.text!
//                
//                if fullName.isEmpty {
//                    self.txtfullName.placeholder = "Name cant be Empty"
//                    return
//                }
//            
//                // Create contact and handle errors
//                let email = self.txtEmail.text!
//                let phoneNumber = self.txtMobileNumber.text!
//                
//                var contact :Contact? = nil
//                do{
//                    contact = try Contact(contactDict: phoneNumber , address: email)
//                }
//                catch EmailValidationError.isEmpty(let email){
//                    self.emailErrorLabel.text = "Email can't be Empty."
//                    self.emailTextField.animateToColor(selectedColor: UIColor.red)
//                    return
//                }
//                catch EmailValidationError.isNotValidEmail(let email){
//                    self.emailErrorLabel.text = "Email is not Valid."
//                    self.emailTextField.animateToColor(selectedColor: UIColor.red)
//
//                    return
//                }
//                catch EmailValidationError.isNotValidLength(let email){
//                    self.emailErrorLabel.text = "Email is of not valid length"
//                    self.emailTextField.animateToColor(selectedColor: UIColor.red)
//                    return
//                }
//                catch PhoneNumberValidationError.voiletsMaxLength(let number){
//                    self.phoneNumberErrorLabel.text = "Phone number must be smaller than 17"
//                    self.phoneNumberTextField.animateToColor(selectedColor: UIColor.red)
//                    return
//                }
//                catch PhoneNumberValidationError.voiletsMinLength(let number){
//                    self.phoneNumberErrorLabel.text = "Phone number must be longer than 6"
//                   self.phoneNumberTextField.animateToColor(selectedColor: UIColor.red)
//                    return
//                }
//                catch{
//                    let alertController = UIAlertController(title: "Error", message:
//                        "Error in Email or PhoneNumber", preferredStyle: .alert)
//                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
//
//                    self.present(alertController, animated: true, completion: nil)
//                    return
//                }
//                
//
//}
