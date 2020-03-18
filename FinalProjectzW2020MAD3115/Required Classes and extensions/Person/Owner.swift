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
    
    init(id: String, fullName: String, gender: Gender, birthDate: Date?, age:Int,
        email: String, password: String, contact: Contact, companyTitle: String,  url: String,
        vehicleList: [String: Vehicle])
    {
        self.companyTitle = companyTitle
        self.url = url
        self.vehicleList = vehicleList
        super.init(id: id, fullName: fullName, gender: gender, birthDate: birthDate, email: email, password: password, contact: contact)
    }
    
}
