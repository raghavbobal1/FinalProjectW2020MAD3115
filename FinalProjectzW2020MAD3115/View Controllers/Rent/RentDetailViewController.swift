//
//  RentDetailViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class RentDetailViewController: UIViewController {
    @IBOutlet weak var labelRentId: UILabel!
    var vehicleRent: VehicleRent?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let vehicleRent = self.vehicleRent else {
                    return
                }
        self.labelRentId.text = vehicleRent.id
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
