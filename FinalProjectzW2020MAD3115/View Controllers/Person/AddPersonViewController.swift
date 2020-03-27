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
        
        // Do any additional setup after loading the view.
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
