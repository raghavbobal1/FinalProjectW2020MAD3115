//
//  RentDetailViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class RentDetailViewController: UIViewController {
    @IBOutlet weak var labelKMDriven: UILabel!
    @IBOutlet weak var labelVehicleId: UILabel!
    @IBOutlet weak var labelTotalBill: UILabel!
    @IBOutlet weak var labelDays: UILabel!
    @IBOutlet weak var labelEndDate: UILabel!
    @IBOutlet weak var labelStartDate: UILabel!
    var vehicleRent: VehicleRent?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let vehicleRent = self.vehicleRent else {
                    return
                }
        
        self.labelStartDate.text = vehicleRent.rentStartDate.printFormat()
        self.labelEndDate.text = vehicleRent.rentEndDate.printFormat()
        self.labelDays.text = "\(vehicleRent.calculateNumberOfDays()) Days"
        
        self.labelTotalBill.text = vehicleRent.calculateTotalBill().priceFormat()
        self.labelVehicleId.text = vehicleRent.vehicle.vehicleId
        
        self.labelKMDriven.text = vehicleRent.kmDriven.distanceFormat()
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
