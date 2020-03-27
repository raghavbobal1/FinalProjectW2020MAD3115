//
//  AddRentViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class AddRentViewController: UIViewController {

    @IBOutlet weak var textStartDate: UITextField!
    
    @IBOutlet weak var textVehicle: UITextField!
    @IBOutlet weak var textKMDriven: UITextField!
    @IBOutlet weak var textEndDate: UITextField!
    
    var isStartEditing = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pickerView = UIPickerView()
       pickerView.delegate = self
       pickerView.dataSource = self
        
        self.textVehicle.inputView = pickerView
        
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        textStartDate.inputView = datePicker
        textEndDate.inputView = datePicker
        
        textStartDate.addTarget(self, action: #selector(startTouched), for: .touchDown)
       textEndDate.addTarget(self, action: #selector(endTouched), for: .touchDown)

        
         datePicker.addTarget(self, action: #selector(AddPersonViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(AddPersonViewController.viewTapped(guestureRecognizer:)))
        view.addGestureRecognizer(tapGuesture)
        // Do any additional setup after loading the view.
    }
    
    @objc func startTouched(textField: UITextField) {
        self.isStartEditing = true
    }
    
    @objc func endTouched(textField: UITextField) {
           self.isStartEditing = false
       }
    
    @objc func viewTapped(guestureRecognizer: UITapGestureRecognizer) {
               view.endEditing(true)
           }

    @objc func dateChanged(datePicker: UIDatePicker) {
        if isStartEditing{
            self.textStartDate.text = datePicker.date.printFormat(format: "MMMM/dd/yyyy")
        }
        else{
            self.textEndDate.text = datePicker.date.printFormat(format: "MMMM/dd/yyyy")
        }
               
               //view.endEditing(true)
    }
    @IBAction func btnSaveDown(_ sender: Any) {
        self.defaultConfigLoad()
        let textStartDate = self.textStartDate.text ?? ""
        if textStartDate.isEmpty{
            self.view.showToast(toastMessage: "StartDate can't be empty", duration: 1)
            self.textStartDate.animateToColor(selectedColor: UIColor.red)
                      return
        }
        let startDate = Date.ofStr(dateString: textStartDate) ?? Date()
        
        
        let textEndDate = self.textEndDate.text ?? ""
        if textEndDate.isEmpty{
            self.view.showToast(toastMessage: "EndDate can't be empty", duration: 1)
            self.textEndDate.animateToColor(selectedColor: UIColor.red)
                      return
        }
        let endDate = Date.ofStr(dateString: textEndDate) ?? Date()
        
        
        
        if (endDate < startDate){
            self.view.showToast(toastMessage: "endDate can't be before startDate", duration: 1)
                self.textEndDate.animateToColor(selectedColor: UIColor.red)
                          return
        }
        
        let textKMDriven = self.textKMDriven.text ?? "0.0"
        
        let textVehicle = self.textVehicle.text!
        if textVehicle.isEmpty{
            self.view.showToast(toastMessage: "Vehicle can't be empty", duration: 1)
            self.textVehicle.animateToColor(selectedColor: UIColor.red)
                      return
        }
        
        var vehicleObj = ObjectManager.getVehicleById(id: textVehicle)
        
        var vehicleRent = VehicleRent(id: ObjectManager.getInstance().getRandomID(), rentStartDate: startDate, rentEndDate: endDate, vehicle: vehicleObj!, kmDriven: Float(textKMDriven) ?? 0.0)
        
        
        ObjectManager.vehicleRentObjects.updateValue(vehicleRent, forKey: vehicleRent.id)

        
        
    }
    
    func defaultConfigLoad() {
        
        self.textStartDate.animateToColor(selectedColor: .black)
        self.textEndDate.animateToColor(selectedColor: .black)
        self.textVehicle.animateToColor(selectedColor: .black)
        
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

extension AddRentViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
          }
          
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ObjectManager.getAllUnBookedVehicles().count
      }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ObjectManager.getAllUnBookedVehicles()[row].vehicleId
       }
          
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textVehicle.text = "\(ObjectManager.getAllUnBookedVehicles()[row].vehicleId)"
       }
}
