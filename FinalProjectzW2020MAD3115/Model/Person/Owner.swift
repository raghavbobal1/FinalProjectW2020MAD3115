//
//  Owner.swift
//  RenterProjectW2020MAD3004
//
//  Created by Raghav Bobal on 2020-02-12.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

/* Customer class which inherts person*/
class Owner : Person
{
    
    var companyTitle: String
    var url: String
    var vehicleList = [String: Vehicle]()
    
    init(id: String, firstName: String, lastName: String, gender: Gender, birthDate: Date?,
        userName: String, password: String, contact: Contact, companyTitle: String,  url: String,
        vehicleList: [String: Vehicle])
    {
        self.companyTitle = companyTitle
        self.url = url
        self.vehicleList = vehicleList
        super.init(id: id, firstName: firstName, lastName: lastName, gender: gender, birthDate: birthDate, userName: userName, password: password, contact: contact)
    }
    
    init(ownerDict: [String: Any]) throws{
    
        
        guard let companyTitle = ownerDict["companyTitle"] as? String else {
            throw JsonValidationError.isNotValidInput(
                className: String(describing:type(of: self)),
                memberName: "companyTitle")
        }
        
        guard let url = ownerDict["url"] as? String else {
            throw JsonValidationError.isNotValidInput(
                className: String(describing:type(of: self)),
                memberName: "url")
        }
        
        // getVehicles
        guard let vehicles = ownerDict["vehicles"] as? [String] else {
            throw JsonValidationError.isNotValidInput(
                className: String(describing:type(of: self)),
                memberName: "vehicles")
        }
        var vehicleManger = ObjectManager.getInstance()
        var vehicleObjectList = [String: Vehicle]()
        for vehicleId in vehicles{
            if let vehicle = ObjectManager.getVehicleById(id: vehicleId){
                vehicleObjectList.updateValue(vehicle, forKey: vehicleId)
            }
        }
        
        self.companyTitle = companyTitle
        self.url = url
        self.vehicleList = vehicleObjectList
        try super.init(personDict: ownerDict)
        
    }
    
    
    
  

    func addVehicle(vehicleId: String, vehicle: Vehicle)
    {
      if vehicleList.keys.contains(vehicleId)
      {
        print("\nERROR! VEHICLE ALREADY IN LIST")
      }
      else
      {
        vehicleList.updateValue(vehicle,forKey: vehicleId)
      }
    }
}
