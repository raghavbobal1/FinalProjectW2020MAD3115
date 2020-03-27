//
//  VehicleRepository.swift
//  RenterProjectW2020MAD3004
//
//  Created by Prakash on 2020-02-24.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

// Singleton struct to manage vehicles
struct ObjectManager{
    private init(){}
    
    static var vehicleObjects = [String: [Vehicle]]()
    static var personObjects = [String: [Person]]()
    static var rentObjects = [VehicleRent]()
    
    
    static var customerObjects = [String: Customer]()
    static var driverObjects = [String: Driver]()
    static var ownerObjects = [String: Owner]()

    static var carObjects = [String: Car]()
    static var busObjects = [String: Bus]()
    static var motorCycleObjects = [String: MotorCycle]()

    static var vehicleRentObjects = [String: VehicleRent]()

    var objectType: String = "Vehicle"
    
    
    
    private static var obj = ObjectManager()
    static func getInstance() -> ObjectManager{
        return obj
    }
    
    func getRandomID() -> String{
       func randomString(len:Int) -> String {
            let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let c = Array(charSet)
            var s:String = ""
            for _ in (1...10) {
                s.append(c[Int(arc4random()) % c.count])
            }
            return s
        }
        return randomString(len: 8)
    }
    
    
    static func getVehicleById(id: String) -> Vehicle? {
        if ObjectManager.carObjects.keys.contains(id){
            return ObjectManager.carObjects[id]
        }
        if ObjectManager.busObjects.keys.contains(id){
            return ObjectManager.busObjects[id]
        }
        if ObjectManager.motorCycleObjects.keys.contains(id){
            return ObjectManager.motorCycleObjects[id]
        }
        return nil
        
    }
    
    static func getAllUnBookedVehicles() -> [Vehicle]{
        
        var allBookedVehiclesId = [String]()
        for (_,owner) in self.ownerObjects{
            for(key,vl) in owner.vehicleList{
                allBookedVehiclesId.append(key)
            }
            
        }
        
        var vehList = [Vehicle]()
        for (k1,v) in ObjectManager.carObjects{
            if allBookedVehiclesId.contains(k1){
               continue
            }
            vehList.append(v)
        }
        
        for (k2,a) in ObjectManager.busObjects{
            if allBookedVehiclesId.contains(k2){
               continue
            }
                   vehList.append(a)
               }
        for (k3,b) in ObjectManager.motorCycleObjects{
            if allBookedVehiclesId.contains(k3){
               continue
            }
                   vehList.append(b)
        }
        
        return vehList
        
    }
    
//    func getVehicleById( id: String, typeName: String = "all") -> Vehicle? {
//        if typeName == "all"{
//            let vechObjs = ObjectManager.vehicleObjects[Car.typeSName] ?? []
//            for vehicle in vechObjs{
//                if vehicle.vehicleId == id && (vehicle.typeName == typeName || typeName == "all"){
//                    return vehicle
//                }
//            }
//            let vechObjs2 = ObjectManager.vehicleObjects[Bus.typeSName] ?? []
//                       for vehicle in vechObjs2{
//                           if vehicle.vehicleId == id && (vehicle.typeName == typeName || typeName == "all"){
//                               return vehicle
//                           }
//            }
//
//            let vechObjs3 = ObjectManager.vehicleObjects[MotorCycle.typeSName] ?? []
//                       for vehicle in vechObjs3{
//                           if vehicle.vehicleId == id && (vehicle.typeName == typeName || typeName == "all"){
//                               return vehicle
//                           }
//                       }
//        }
//        else{
//            let vechObjs = ObjectManager.vehicleObjects[typeName] ?? []
//            for vehicle in vechObjs{
//                if vehicle.vehicleId == id && (vehicle.typeName == typeName || typeName == "all"){
//                    return vehicle
//                }
//            }
//        }
//
//
//        return nil
//    }
    
    func getPersonById( id: String, typeName: String = Customer.typeSName) -> Person? {
        let personObjs = ObjectManager.personObjects[typeName] ?? []
        for person in personObjs{
            if person.id == id && (person.typeName == typeName || typeName == "all"){
                return person
            }
        }
        return nil
    }
    
    func getRentById( id: String) -> VehicleRent? {
        for rent in ObjectManager.rentObjects{
            if rent.id == id {
                return rent
            }
        }
        return nil
    }
    
    func  getCustomerById(id: String) -> Customer? {
        return  ObjectManager.customerObjects[id]
    }
    
    func  getOwnerById(id: String) -> Owner? {
        return  ObjectManager.ownerObjects[id]
    }
    
    func  getDriverById(id: String) -> Driver? {
        return  ObjectManager.driverObjects[id]
    }
    
    func  getCarById(id: String) -> Car? {
           return  ObjectManager.carObjects[id]
       }
    
    func  getBusById(id: String) -> Bus? {
           return  ObjectManager.busObjects[id]
       }
    
    func  getmotorCycleById(id: String) -> MotorCycle? {
           return  ObjectManager.motorCycleObjects[id]
       }
    
    func  getVehicleRentById(id: String) -> VehicleRent? {
           return  ObjectManager.vehicleRentObjects[id]
       }
    
    
    
    func addObject(vehicle: Vehicle, typeName: String = Car.typeSName){
        if ObjectManager.vehicleObjects[typeName] == nil {
            ObjectManager.vehicleObjects.updateValue([Vehicle](), forKey: typeName)
        }
        ObjectManager.vehicleObjects[typeName]?.append(vehicle)
    }
    
    func addObject(person: Person, typeName: String = Customer.typeSName){
        if ObjectManager.personObjects[typeName] == nil {
            ObjectManager.personObjects.updateValue([Person](), forKey: typeName)
        }
        ObjectManager.personObjects[typeName]?.append(person)
    }
    
    func addObject(vehicleRent: VehicleRent){
        ObjectManager.rentObjects.append(vehicleRent)
    }
    
   
    
    
    func loadData() {



       //-------------  ARRAY OF DRIVER OBJECTS -------------
       var driverReader = CustomFileHandler(fileName:"DriverData")
       var driverArray = driverReader.read()

       if let driverArray = driverReader.read(){
           for driverDict in driverArray {
               do {
                   let o = try Driver(driverDict: driverDict)
                  ObjectManager.driverObjects.updateValue(o, forKey: o.id)
               }
               catch JsonValidationError.isNotValidInput(let msgg){
                   print("Could not create object. Error while reading from json: ")
                   print(msgg)
               }
               catch{
                print("Error")
            }
           }
       }


       //-------------  ARRAY OF MOTORCYCLE OBJECTS -------------
       var motorcyleReader = CustomFileHandler(fileName:"MotorCycleData")
       var motorCyclesArray = motorcyleReader.read()

       if let motorCyclesArray = motorcyleReader.read(){
           for motorCycleDict in motorCyclesArray{

               do{
                   let mc = try MotorCycle(motorCycleDict: motorCycleDict)
                ObjectManager.motorCycleObjects.updateValue(mc, forKey: mc.vehicleId)
               }
               catch JsonValidationError.isNotValidInput(let msgg){
                   print("Could not create object. Error while reading from json: ")
                   print(msgg)
               }
                catch{
                              print("Error")
                          }
           }
       }
       //mcObjects[0].display()


       //-------------  ARRAY OF BUS OBJECTS -------------
       var busReader = CustomFileHandler(fileName:"BusData")
       var busArray = busReader.read()

       if let busArray = busReader.read(){
           for busDict in busArray {
               do {
                   let b = try Bus(busDict: busDict)
                ObjectManager.busObjects.updateValue(b, forKey: b.vehicleId)
               }
               catch JsonValidationError.isNotValidInput(let msgg){
                   print("Could not create object. Error while reading from json: ")
                   print(msgg)
               }
            catch{
                print("Error")
                      }
           }
       }

       //-------------  ARRAY OF CAR OBJECTS -------------
       var carReader = CustomFileHandler(fileName:"CarData")
       var carArray = carReader.read()

       if let carArray = carReader.read(){
           for carDict in carArray {
               do {
                   let c = try Car(carDict: carDict)
                ObjectManager.carObjects.updateValue(c, forKey: c.vehicleId)
               }
               catch JsonValidationError.isNotValidInput(let msgg){
                   print("Could not create object. Error while reading from json: ")
                   print(msgg)
               }
                catch{
                print("Error")
                      }
           }
       }
       // carObjects[0].display()

       //-------------  ARRAY OF OWNER OBJECTS -------------
       var ownerReader = CustomFileHandler(fileName:"OwnerData")
       var ownerArray = ownerReader.read()

       if let ownerArray = ownerReader.read(){
           for ownerDict in ownerArray {
               do {
                   let o = try Owner(ownerDict: ownerDict)
                ObjectManager.ownerObjects.updateValue(o, forKey: o.id)
               }
               catch JsonValidationError.isNotValidInput(let msgg){
                   print("Could not create object. Error while reading from json: ")
                   print(msgg)
               }
                catch{
                print("Error")
                      }
           }
       }



       //-------------  ARRAY OF VEHICLE RENT OBJECTS -------------

       // rent for car(SCBLF44J47C415338)
       guard var vr1Vehicle = ObjectManager.getVehicleById(id: "SCBLF44J47C415338") else {
           print("no vehicle found")
           exit(1)
       }
       var vr1 = VehicleRent(id:"1",
                             rentStartDate: "2019-04-22".toDate(),
                             rentEndDate:"2019-04-24".toDate(),
                             vehicle: vr1Vehicle, kmDriven: 22)
        ObjectManager.vehicleRentObjects.updateValue(vr1, forKey: vr1.id)


       // rent for bus(3VW517AT7FM076063)
       guard var vr2Vehicle = ObjectManager.getVehicleById(id: "3VW517AT7FM076063") else {
           print("no vehicle found")
           exit(1)
       }
       var vr2 = VehicleRent(id:"2",
                             rentStartDate: "2019-09-22".toDate(),
                             rentEndDate:"2019-10-2".toDate(),
                             vehicle: vr2Vehicle, kmDriven: 34)
       ObjectManager.vehicleRentObjects.updateValue(vr2, forKey: vr2.id)




       // rent for MotorCycle(1GKS1CE02ER511717)
       guard var vr3Vehicle = ObjectManager.getVehicleById(id: "1GKS1CE02ER511717") else {
           print("no vehicle found")
           exit(1)
       }
       var vr3 = VehicleRent(id:"3",
                             rentStartDate: "2020-01-22".toDate(),
                             rentEndDate:"2020-1-22".toDate(),
                             vehicle: vr3Vehicle, kmDriven: 11)
      ObjectManager.vehicleRentObjects.updateValue(vr3, forKey: vr3.id)


       // rent for MotorCycle(WAUVFAFH4DN164011)
       guard var vr4Vehicle = ObjectManager.getVehicleById(id: "WAUVFAFH4DN164011") else {
           print("no vehicle found")
           exit(1)
       }
       var vr4 = VehicleRent(id:"4",
                             rentStartDate: "2020-02-22".toDate(),
                             rentEndDate:"2020-2-29".toDate(),
                             vehicle: vr4Vehicle, kmDriven: 55)
      ObjectManager.vehicleRentObjects.updateValue(vr4, forKey: vr4.id)



       // rent for Bus(WAUKF98E67A648746)
       guard var vr5Vehicle = ObjectManager.getVehicleById(id: "WAUKF98E67A648746") else {
           print("no vehicle found")
           exit(1)
       }
       var vr5 = VehicleRent(id:"5",
                             rentStartDate: "2020-02-19".toDate(),
                             rentEndDate:"2020-3-29".toDate(),
                             vehicle: vr5Vehicle, kmDriven: 45)
      ObjectManager.vehicleRentObjects.updateValue(vr5, forKey: vr5.id)



       // rent for Bus(4T1BD1EB5DU398278)
       guard var vr6Vehicle = ObjectManager.getVehicleById(id: "4T1BD1EB5DU398278") else {
           print("no vehicle found")
           exit(1)
       }
       var vr6 = VehicleRent(id:"6",
                             rentStartDate: "2020-01-19".toDate(),
                             rentEndDate:"2020-1-29".toDate(),
                             vehicle: vr6Vehicle,kmDriven: 90)
      ObjectManager.vehicleRentObjects.updateValue(vr6, forKey: vr6.id)


       // rent for car(YV440MBK0F1011572)
       guard var vr7Vehicle = ObjectManager.getVehicleById(id: "YV440MBK0F1011572") else {
           print("no vehicle found")
           exit(1)
       }
       var vr7 = VehicleRent(id:"7",
                             rentStartDate: "2019-01-19".toDate(),
                             rentEndDate:"2019-1-23".toDate(),
                             vehicle: vr7Vehicle, kmDriven: 3)
      ObjectManager.vehicleRentObjects.updateValue(vr7, forKey: vr7.id)



       // rent for car(1D7RB1CT2BS745200)
       guard var vr8Vehicle = ObjectManager.getVehicleById(id: "1D7RB1CT2BS745200") else {
           print("no vehicle found")
           exit(1)
       }
       var vr8 = VehicleRent(id:"8",
                             rentStartDate: "2020-01-19".toDate(),
                             rentEndDate:"2020-1-23".toDate(),
                             vehicle: vr8Vehicle,
                           kmDriven: 34)
      ObjectManager.vehicleRentObjects.updateValue(vr8, forKey: vr8.id)




       //-------------  ARRAY OF CUSTOMER OBJECTS -------------
       var customerReader = CustomFileHandler(fileName:"CustomerData")
       var customerArray = customerReader.read()

       var customerObjects = Array<Customer>()
       if let customerArray = customerReader.read(){
           for customerDict in customerArray {
               do {
                   let o = try Customer(customerDict: customerDict)
                ObjectManager.customerObjects.updateValue(o, forKey: o.id)
               }
               catch JsonValidationError.isNotValidInput(let msgg){
                   print("Could not create object. Error while reading from json: ")
                   print(msgg)
               }
               catch{
                   let nsError = error as NSError
                   print(nsError.localizedDescription)
               }
           }
           
       }
        
        
    }
    
    
}
