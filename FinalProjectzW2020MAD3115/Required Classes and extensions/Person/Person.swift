//
//  Person.swift
//  RenterProjectW2020MAD3004
//
//  Created by Raghav Bobal on 2020-02-12.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

/* Person class containing necessary variables and functions to use*/

class Person : TypeName
{
     
     var fullName: String
     var gender: Gender
     var birthDate: Date?
     var age: Int {get{ self.birthDate?.age() ?? 0 }}
     var email: String
     var password: String
     var contact: Contact
     var salt: String
    
    init(fullName: String, gender: Gender,birthDate: Date?, email: String, password: String, contact: Contact)
    {
      
        self.fullName = fullName
        self.gender = gender
        self.birthDate = birthDate
        self.email = email
        self.contact = contact
        self.salt = PasswordUtil.getSalt()
        self.password = PasswordUtil.getHashedPassword(salt: self.salt, plainPassword: password)
    }
    
    
    
   
    
}

