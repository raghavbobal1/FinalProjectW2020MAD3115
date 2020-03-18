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
    override func viewDidLoad()
       {
           super.viewDidLoad()
       }
    
   @IBAction func backBtn(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
}
