//
//  AddOwnerViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class AddOwnerViewController: UIViewController {
      @IBOutlet weak var textFirstName: UITextField!
        @IBOutlet weak var textLastName: UITextField!
        
        @IBOutlet weak var segmentGender: UISegmentedControl!
        
        @IBOutlet weak var textEmail: UITextField!
        @IBOutlet weak var textPassword: UITextField!
        @IBOutlet weak var textPhoneNumber: UITextField!
        @IBOutlet weak var textBirthDate: UITextField!
    @IBOutlet weak var textCompanyName: UITextField!
    var personType: String?
    @IBOutlet weak var textVehicle: UITextField!
    override func viewDidLoad() {
            super.viewDidLoad()
            
            var pickerView = UIPickerView()
            pickerView.delegate = self
            pickerView.dataSource = self
    
            
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = .date
            textBirthDate.inputView = datePicker
        
        self.textVehicle.inputView = pickerView
            
            datePicker.addTarget(self, action: #selector(AddPersonViewController.dateChanged(datePicker:)), for: .valueChanged)
            
            let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(AddPersonViewController.viewTapped(guestureRecognizer:)))
            view.addGestureRecognizer(tapGuesture)
            
        }
        
        @objc func viewTapped(guestureRecognizer: UITapGestureRecognizer) {
            view.endEditing(true)
        }
        
        @objc func dateChanged(datePicker: UIDatePicker) {
            self.textBirthDate.text = datePicker.date.printFormat(format: "MMMM/dd/yyyy")
            //view.endEditing(true)
        }
        
        func defaultConfigLoad() {
            
            self.textEmail.animateToColor(selectedColor: UIColor.black)
            
            
            self.textPhoneNumber.animateToColor(selectedColor: UIColor.black)
            
            self.textFirstName.animateToColor(selectedColor: UIColor.black)

            self.textPassword.animateToColor(selectedColor: UIColor.black)
            self.textCompanyName.animateToColor(selectedColor: .black)
            
            

        }
        
        @IBAction func btnSaveDown(_ sender: Any) {
           self.defaultConfigLoad()
            let firstName = self.textFirstName.text!
                   
           if firstName.isEmpty {
            self.view.showToast(toastMessage: "FirstName can't be Empty", duration: 1)
                self.textFirstName.animateToColor(selectedColor: UIColor.red)
               return
           }
           let lastName = self.textLastName.text!
            
            let password = self.textPassword.text!
            if password.isEmpty {
             self.view.showToast(toastMessage: "password can't be Empty", duration: 1)
                 self.textPassword.animateToColor(selectedColor: UIColor.red)
                return
            }
        
            
            // Create contact and handle errors
            let email = self.textEmail.text!
            let phoneNumber = self.textPhoneNumber.text!
            
            var contact :Contact? = nil
            do{
                contact = try Contact(mobileNumber: phoneNumber , emailId: email, address: nil)
            }
            catch EmailValidationError.isEmpty(let email){
                self.view.showToast(toastMessage: "Email can't be Empty", duration: 1.3)
                self.textEmail.animateToColor(selectedColor: UIColor.red)
                return
            }
            catch EmailValidationError.isNotValidEmail(let email){
                self.view.showToast(toastMessage: "Email Invalid format", duration: 1.3)
                self.textEmail.animateToColor(selectedColor: UIColor.red)

                return
            }
            catch EmailValidationError.isNotValidLength(let email){
                self.view.showToast(toastMessage: "Email not valid length", duration: 1.3)
                self.textEmail.animateToColor(selectedColor: UIColor.red)
                return
            }
            catch PhoneNumberValidationError.voiletsMaxLength(let number){
                self.view.showToast(toastMessage: "Phonenumber's length should be less than 17", duration: 1.3)
                self.textPhoneNumber.animateToColor(selectedColor: UIColor.red)
                return
            }
            catch PhoneNumberValidationError.voiletsMinLength(let number){
                self.view.showToast(toastMessage: "Phone number must be longer than 6", duration: 1.3)
                self.textPhoneNumber.animateToColor(selectedColor: UIColor.red)
                return
            }
            catch{
                let alertController = UIAlertController(title: "Error", message:
                    "Error in Email or PhoneNumber", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                self.present(alertController, animated: true, completion: nil)
                return
            }
            
            let gender: Gender = Gender.getGenderType(genderString:self.segmentGender.titleForSegment(at: self.segmentGender.selectedSegmentIndex)     ?? "Male")
            
            let birthDateString = self.textBirthDate.text ?? ""
            let birthDate = Date.ofStr(dateString: birthDateString) ?? Date()
            
            
            
            let companyName = self.textCompanyName.text!
           if companyName.isEmpty {
            self.view.showToast(toastMessage: "companyName can't be Empty", duration: 1)
                self.textCompanyName.animateToColor(selectedColor: UIColor.red)
               return
           }
            
            let vehicleId = self.textVehicle.text ?? ""
            
            var vehicleList = [String: Vehicle]()
            if let vehicle = ObjectManager.getVehicleById(id: vehicleId){
                vehicleList.updateValue(vehicle, forKey: vehicle.vehicleId)
            }

            var owner = Owner(id: ObjectManager.getInstance().getRandomID(), firstName: firstName, lastName: lastName, gender: gender, birthDate: birthDate,  userName: "testUsername", password: password, contact: contact!, companyTitle: companyName, url: "test.com", vehicleList: vehicleList)
            
            ObjectManager.ownerObjects.updateValue(owner, forKey: owner.id)
            
            self.navigationController?.popViewController(animated: true)
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


  extension AddOwnerViewController : UIPickerViewDataSource, UIPickerViewDelegate{
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
               return 1
              }
              
          func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return ObjectManager.getAllUnBookedVehicles().count
          }
           
           func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return ObjectManager.getAllUnBookedVehicles()[row].vehicleId
           }
              
           func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.textVehicle.text = "\(ObjectManager.getAllUnBookedVehicles()[row].vehicleId)"
           }
    }
