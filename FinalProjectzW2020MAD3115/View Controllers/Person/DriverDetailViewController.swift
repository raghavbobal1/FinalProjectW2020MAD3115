//
//  DriverDetailViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class DriverDetailViewController: UIViewController {

    var driver: Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let driver = self.driver else {
            return
        }
        var driverObj  = ObjectManager.getInstance().getDriverById(id: driver.id)
        
        guard let d = driverObj  else {
            return
        }
        
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
