//
//  Driver.swift
//  RenterProjectW2020MAD3004
//
//  Created by Raghav Bobal on 2020-02-12.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

/* Customer class which inherts person*/
class Driver : Person
{
     
     var drivingLicenceNumber: String
     var isDrivingHistoryClean: Bool
     var salary: Float
    
    init(id: String, fullName: String, gender: Gender, birthDate: Date? , email: String,age: Int, password: String, contact: Contact, drivingLicenceNumber: String, isDrivingHistoryClean: Bool, salary: Float)
    {
        self.drivingLicenceNumber = drivingLicenceNumber
        self.isDrivingHistoryClean = isDrivingHistoryClean
        self.salary = salary
        super.init(id: id, fullName: fullName, gender: gender, birthDate: birthDate, email: email, password: password, contact: contact)
    }
    

}
