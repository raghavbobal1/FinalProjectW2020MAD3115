//
//  Vehicle.swift
//  RenterProjectW2020MAD3004
//
//  Created by MacStudent on 2020-02-12.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

class Vehicle: TypeName , Hashable
{
    
    
     var vehicleId: String
     var description: String?
     var manufacturer:String
     var isSelfDrive: Bool
     var isInsured: Bool
     var insuranceProviderName: String?
     var numberOfSeat: Int
     var fuelType: FuelType
     var baseRate: Float
     var perKmRate: Float
     var driver: Driver?
     var hashValue: Int {
        return (vehicleId + typeName).hashValue
    }
    static func == (lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    init(vehicleId: String, description: String?, manufacturer: String, fuelType: FuelType,  isSelfDrive: Bool, isInsured: Bool, insuranceProviderName: String?, numberOfSeat: Int, baseRate: Float, perKmRate: Float, driver:Driver) {
        self.vehicleId = vehicleId
        self.description = description
        self.manufacturer = manufacturer
        self.isInsured = isInsured
        self.isSelfDrive = isSelfDrive
        self.insuranceProviderName = insuranceProviderName
        self.numberOfSeat = numberOfSeat
        self.fuelType = fuelType
        self.baseRate = baseRate
        self.perKmRate = perKmRate
        self.driver = driver
        
    }
    
}



