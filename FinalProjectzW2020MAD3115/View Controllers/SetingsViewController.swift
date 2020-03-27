//
//  SetingsViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class SetingsViewController: UIViewController {

    @IBOutlet weak var labelCurrentUser: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        labelLogout.isUserInteractionEnabled = true
        labelLogout.addGestureRecognizer(singleTap)
        
        self.labelCurrentUser.text = UserDefaults.standard.string(forKey: "username")
        
        // Do any additional setup after loading the view.
    }
    //Action
    @objc func tapDetected() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                         let vcStoryBoardId = "LoginViewController"
//                         var detailView = storyboard.instantiateViewController(identifier: vcStoryBoardId) as!  LoginViewController
//
//                    self.navigationController?.pushViewController(detailView, animated: true)
        
        self.navigationController?.popToRootViewController(animated: true)

        
    }
    
    
    @IBOutlet weak var labelLogout: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
