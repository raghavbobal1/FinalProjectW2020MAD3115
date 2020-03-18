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

    init(id: String, fullName: String, lastName: String, gender: Gender,birthDate: Date?,age:Int, email: String, password: String, contact: Contact)
    {
        super.init(id: id, fullName: fullName, gender: gender, birthDate: birthDate, email: email, password: password, contact: contact)
    }
 

}
