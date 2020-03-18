//
//  Person.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Raghav Bobal on 2020-03-17.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
class Person
{
     var id: String
     var fullName: String
     var gender: Gender
     var password: String
     var contact: Contact
     var salt: String
    
    init(id: String, fullName: String, gender: Gender, password: String, contact: Contact)
    {
        self.id = id
        self.fullName= fullName
        self.gender = gender
        self.contact = contact
        self.salt = PasswordUtil.getSalt()
        self.password = PasswordUtil.getHashedPassword(salt: self.salt, plainPassword: password)
    }
    
    
    
    init(personDict: [String: Any]) throws{
        guard let id = personDict["id"] as? String else {
            throw JsonValidationError.isNotValidInput(
                className: String(describing:type(of: self)),
                memberName: "id")
        }
        
        
        guard let firstName = personDict["firstName"] as? String else {
            throw JsonValidationError.isNotValidInput(
                className: String(describing:type(of: self)),
                memberName: "firtName")
        }
        
        guard let lastName = personDict["lastName"] as? String else {
            throw JsonValidationError.isNotValidInput(
                className: String(describing:type(of: self)),
                memberName: "lastName")
        }
        
        guard let genderString =  personDict["gender"] as? String else {
            throw JsonValidationError.isNotValidInput(
                className: String(describing:type(of: self)),
                memberName: "gender")
        }
        let gender = Gender.getGenderType(genderString: genderString)
        
        
        
        guard let birthDateString = personDict["birthDate"] as? String else {
            throw JsonValidationError.isNotValidInput(
                className: String(describing:type(of: self)),
                memberName: "birthDate")
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let birthDate = dateFormatter.date(from: birthDateString) else{
            throw JsonValidationError.isNotValidInput(
            className: String(describing:type(of: self)),
            memberName: "birthDate")
        }
        
        
        guard let userName = personDict["userName"] as? String else {
            throw JsonValidationError.isNotValidInput(
                className: String(describing:type(of: self)),
                memberName: "userName")
        }
        
        
        guard let password = personDict["password"] as? String else {
            throw JsonValidationError.isNotValidInput(
                className: String(describing:type(of: self)),
                memberName: "password")
        }
        
        guard let addressJson = personDict["address"] as? [String: String] else {
            throw JsonValidationError.isNotValidInput(
                className: String(describing:type(of: self)),
                memberName: "address")
        }
        
        guard let contactJson = personDict["contact"] as? [String: String] else {
            throw JsonValidationError.isNotValidInput(
                className: String(describing:type(of: self)),
                memberName: "contact")
        }
        
        var contact:Contact?
        do{
            var address:Address?
            address = try Address(addressDict: addressJson)
            contact = try Contact(contactDict: contactJson, address:address!)
        }
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.birthDate = birthDate
        self.userName = userName
        self.contact = contact!
        self.salt = PasswordUtil.getSalt()
        self.password = PasswordUtil.getHashedPassword(salt: self.salt, plainPassword: password)
        
    }
    
    
}
