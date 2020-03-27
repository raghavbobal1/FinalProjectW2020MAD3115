//
//  AddPersonViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {
    @IBOutlet weak var textFirstName: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    
    @IBOutlet weak var segmentGender: UISegmentedControl!
    
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textPhoneNumber: UITextField!
    @IBOutlet weak var textBirthDate: UITextField!
    var personType: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var pickerView = UIPickerView()
//        pickerView.delegate = self
//        pickerView.dataSource = self
//
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        textBirthDate.inputView = datePicker
        
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
    
    @IBAction func btnSaveDown(_ sender: Any) {
    
    
    
    
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


//func numberOfComponents(in pickerView: UIPickerView) -> Int {
//          return 1
//         }
//
//     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//         return Gender.allCases.count
//     }
//
//      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//          return "\(Gender.allCases[row])"
//      }
//
//      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//          self.genderTextField.text = "\(Gender.allCases[row])"
//      }
