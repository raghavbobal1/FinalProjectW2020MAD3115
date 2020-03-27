//
//  Customer .swift
//  RenterProjectW2020MAD3004
//
//  Created by Raghav Bobal on 2020-02-12.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

/* Customer class which inherts person*/
class Customer : Person
{
    
    private lazy var vehicleRents = [String: VehicleRent]()
    var totalBill: Double  {
        get{
            var total: Double = 0
            for (_,rent) in self.vehicleRents{
                total += Double(rent.totalBill)
                
            }
            return total
        }
        
    }

    override init(id: String, firstName: String, lastName: String, gender: Gender,birthDate: Date?, userName: String, password: String, contact: Contact)
    {
        super.init(id: id, firstName: firstName, lastName: lastName, gender: gender, birthDate: birthDate, userName: userName, password: password, contact: contact)
    }
    
    init(customerDict: [String: Any]) throws {
        
        // get rents
        guard let rents = customerDict["rentsId"] as? [String] else {
            throw JsonValidationError.isNotValidInput(
                className: String(describing:type(of: self)),
                memberName: "rentsId")
        }
        let rentsManger = ObjectManager.getInstance()
        var rentsObjectList = [String: VehicleRent]()
        for rentId in rents{
            if let rent = rentsManger.getRentById(id: rentId){
                rentsObjectList.updateValue(rent, forKey: rentId)
            }
        }
        
        try super.init(personDict: customerDict)
        self.vehicleRents = rentsObjectList
    }
    
    
    func getVehicleRents() -> [VehicleRent]{
        return Array(self.vehicleRents.values)
    }
    
   
    
  
  func addVehicleRents(vehicleRent: VehicleRent)
    {
        if vehicleRents.keys.contains(vehicleRent.id)
      {
        print("\nERROR! VEHICLE Rent ALREADY RENTED")
      }
      else
      {
        vehicleRents.updateValue(vehicleRent,forKey: vehicleRent.id)
      }
    }

}
