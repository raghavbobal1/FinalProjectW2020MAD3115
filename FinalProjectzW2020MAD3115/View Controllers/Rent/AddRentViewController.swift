//
//  AddRentViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class AddRentViewController: UIViewController {

    @IBOutlet weak var textStartDate: UITextField!
    
    @IBOutlet weak var textVehicle: UITextField!
    @IBOutlet weak var textKMDriven: UITextField!
    @IBOutlet weak var textEndDate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        textStartDate.inputView = datePicker
        textEndDate.inputView = datePicker
        
         datePicker.addTarget(self, action: #selector(AddPersonViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(AddPersonViewController.viewTapped(guestureRecognizer:)))
        view.addGestureRecognizer(tapGuesture)
        // Do any additional setup after loading the view.
    }
    
    @objc func viewTapped(guestureRecognizer: UITapGestureRecognizer) {
               view.endEditing(true)
           }

    @objc func dateChanged(datePicker: UIDatePicker) {
               self.textStartDate.text = datePicker.date.printFormat(format: "MMMM/dd/yyyy")
               //view.endEditing(true)
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
