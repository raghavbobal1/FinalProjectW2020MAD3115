//
//  AddVehicleViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class AddVehicleViewController: UIViewController {
    @IBOutlet weak var textPerKM: UITextField!
    
    @IBOutlet weak var textDriver: UITextField!
    @IBOutlet weak var textBaseRate: UITextField!
    @IBOutlet weak var segmentFuelType: UISegmentedControl!
    @IBOutlet weak var segmentHasInsurance: UISegmentedControl!
    @IBOutlet weak var textInsuranceProvider: UITextField!
    @IBOutlet weak var segmentIsSelfDrive: UISegmentedControl!
    @IBOutlet weak var textManufacturer: UITextField!
    @IBOutlet weak var textDescription: UITextField!
    var vehicle: Vehicle?
    var type: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pickerView = UIPickerView()
                pickerView.delegate = self
                pickerView.dataSource = self
        self.textDriver.inputView = pickerView
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(AddPersonViewController.viewTapped(guestureRecognizer:)))
                  view.addGestureRecognizer(tapGuesture)

        
        // Do any additional setup after loading the view.
    }
    @objc func viewTapped(guestureRecognizer: UITapGestureRecognizer) {
              view.endEditing(true)
          }
    
    func defaultConfigLoad() {
               
        self.textBaseRate.animateToColor(selectedColor: .black)
        self.textPerKM.animateToColor(selectedColor: .black)
        self.textManufacturer.animateToColor(selectedColor: .black)
               
               

           }
    
    @IBAction func btnSave(_ sender: Any) {
        self.defaultConfigLoad()
       let textManufacturer = self.textManufacturer.text!
              
      if textManufacturer.isEmpty {
       self.view.showToast(toastMessage: "Manufacturer can't be Empty", duration: 1)
           self.textManufacturer.animateToColor(selectedColor: UIColor.red)
          return
      }
        
      let textDescription = self.textDescription.text!
       
      var selfDrive = true
        if self.segmentIsSelfDrive.titleForSegment(at: self.segmentIsSelfDrive.selectedSegmentIndex)  == "No"{
            selfDrive = false
        }
        
    var hasInsurance = true
    if self.segmentHasInsurance.titleForSegment(at: self.segmentHasInsurance.selectedSegmentIndex)  == "No"{
        selfDrive = hasInsurance
    }
        
        var insuranceProvider = textInsuranceProvider.text!
        
    let fuelType: FuelType = FuelType.getFuelType(fuelString: self.segmentFuelType.titleForSegment(at: self.segmentFuelType.selectedSegmentIndex)     ?? "Petrol")
     
        let textBaseRate = self.textBaseRate.text!
    if textBaseRate.isEmpty {
     self.view.showToast(toastMessage: "BaseRate can't be Empty", duration: 1)
         self.textBaseRate.animateToColor(selectedColor: UIColor.red)
        return
    }
        
        let textPerKM = self.textPerKM.text!
        if textPerKM.isEmpty {
         self.view.showToast(toastMessage: "PerKM rate can't be Empty", duration: 1)
             self.textPerKM.animateToColor(selectedColor: UIColor.red)
            return
        }
        
        let textDriver = self.textDriver.text!
        var driver: Driver?
        if textDriver.isEmpty{
            driver = nil
        }
        else{
            driver = ObjectManager.getInstance().getDriverById(id: textDriver)
        }
        
        switch type {
        case Car.typeSName:
            var car = Car(vehicleId: ObjectManager.getInstance().getRandomID(), description: description, manufacturer: textManufacturer, fuelType:fuelType, carColor: "red", carType: "small", isSelfDrive: selfDrive, isInsured: hasInsurance, insuranceProviderName: insuranceProvider, numberOfSeat: 4, baseRate: Float(textBaseRate) ?? 0, perKmRate: Float(textPerKM) ?? 0.0, driver: driver)
            ObjectManager.carObjects.updateValue(car, forKey: car.vehicleId)
        case Bus.typeSName:
            var bus = Bus(vehicleId: ObjectManager.getInstance().getRandomID(), description: description, manufacturer: textManufacturer, fuelType:fuelType,   isSelfDrive: selfDrive, isInsured: hasInsurance, insuranceProviderName: insuranceProvider, numberOfSeat: 4, baseRate: Float(textBaseRate) ?? 0.0, perKmRate: Float(textPerKM) ?? 0.0, busType: "long", accessibilityServices: true, wifiAvailability: true, standingCapacity: 20, driver:driver)
            ObjectManager.busObjects.updateValue(bus, forKey: bus.vehicleId)
            
        default:
            var motorCycle = MotorCycle(vehicleId: ObjectManager.getInstance().getRandomID(), description: description, manufacturer: textManufacturer, fuelType:fuelType, topSpeed: 45, mileage: 33, isSelfDrive: selfDrive, isInsured: hasInsurance, insuranceProviderName: insuranceProvider, numberOfSeat: 3, baseRate: Float(textBaseRate) ?? 0.0, perKmRate: Float(textPerKM) ?? 0.0, driver: driver)
            ObjectManager.motorCycleObjects.updateValue(motorCycle, forKey: motorCycle.vehicleId)
        }
        
        self.navigationController?.popViewController(animated: true)
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


extension AddVehicleViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
          }
          
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ObjectManager.getAllFreeDrivers().count
      }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ObjectManager.getAllFreeDrivers()[row].id
       }
          
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textDriver.text = "\(ObjectManager.getAllFreeDrivers()[row].id)"
       }
}
