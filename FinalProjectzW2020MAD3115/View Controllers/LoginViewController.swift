//
//  LoginViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Raghav Bobal on 2020-03-17.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
    @IBOutlet weak var switchRememberMe: UISwitch!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
@IBAction func backBtn(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
  
    
    
    
}
