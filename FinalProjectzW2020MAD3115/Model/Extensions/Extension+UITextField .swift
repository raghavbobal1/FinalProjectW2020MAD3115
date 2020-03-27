
import Foundation
import UIKit
extension UITextField
{
    func setInputViewDatePicker(target: Any, selector: Selector)
    {
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.datePickerMode = .date
        self.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
    
    @objc func tapCancel()
    {
        self.resignFirstResponder()
    }
    
    func animateToColor(selectedColor: UIColor) {
        let color = CABasicAnimation(keyPath: "borderColor")
        
        color.fromValue = self.layer.borderColor
        
        color.toValue = selectedColor
        
        color.duration = 0.4
        color.repeatCount = 1
        
        self.layer.borderColor =  selectedColor.cgColor
        
        if selectedColor == UIColor.black{
            self.layer.borderWidth = 0.0
        }
        else{
            self.layer.borderWidth = 1.0
        }
        
        self.layer.add(color, forKey: "borderColor")
    }
    
}
