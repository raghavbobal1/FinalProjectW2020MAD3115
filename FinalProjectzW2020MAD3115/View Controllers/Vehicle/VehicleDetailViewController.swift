//
//  VehicleDetailViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class VehicleDetailViewController: UIViewController {

    @IBOutlet weak var labelOwnerName: UILabel!
    @IBOutlet weak var labelDriverName: UILabel!
    @IBOutlet weak var labelKMRate: UILabel!
    @IBOutlet weak var labelBaseRate: UILabel!
    @IBOutlet weak var labelInsuranceCompany: UILabel!
    @IBOutlet weak var imageInsuranceBool: UIImageView!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelManufacturer: UILabel!
    @IBOutlet weak var labelFuelType: UILabel!
    var vehicle:Vehicle?
    var type: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let vehicle = self.vehicle else {
                   return
               }
        
        self.labelFuelType.text =  vehicle.fuelType.rawValue
        self.labelManufacturer.text = vehicle
        .manufacturer
        self.labelDesc.text = vehicle.description
        if(vehicle.isInsured){
            self.imageInsuranceBool.image = UIImage(named: "tick")
        }
        else{
            self.imageInsuranceBool.image = UIImage(named: "cross")
        }
        
        self.labelInsuranceCompany.text = vehicle.insuranceProviderName
        
        self.labelBaseRate.text = vehicle.baseRate.priceFormat()
        
        self.labelKMRate.text = "\(vehicle.perKmRate.priceFormat())/KM"
        
        self.labelDriverName.text = vehicle.driver?.fullName ?? "Driver not Assigned"
        
        
        if let owner = ObjectManager.getOwnerForVehicle(id: vehicle.vehicleId){
            self.labelOwnerName.text = owner.fullName
            
        }
        else{
            self.labelOwnerName.text = "Owner not Assigned"
            
        }
        
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
