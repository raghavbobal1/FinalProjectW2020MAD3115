//
//  AddRentViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class AddRentViewController: UIViewController {

    @IBOutlet weak var textVehicle: UITextField!
    @IBOutlet weak var textKMDriven: UITextField!
    @IBOutlet weak var textEndDate: UITextField!
    @IBOutlet weak var textStartDate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        textStartDate.inputView = datePicker
        textEndDate.inputView = datePicker

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
