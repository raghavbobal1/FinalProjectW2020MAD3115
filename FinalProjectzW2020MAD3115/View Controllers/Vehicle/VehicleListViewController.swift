//
//  VehicleListViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-26.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class VehicleCustomCell: UITableViewCell{
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelSelfDrive: UILabel!
    
    @IBOutlet weak var labelBaseRate: UILabel!
    
    @IBOutlet weak var labelPerKm: UILabel!
    @IBOutlet weak var labelIsInsurerd: UILabel!
}

class VehicleListViewController: UIViewController {
       
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var segmentVehicleType: UISegmentedControl!
    @IBOutlet weak var vehicleTable: UITableView!
    var valueArr: [Vehicle] = Array(ObjectManager.carObjects.values)
    
    var currentType =  Car.typeSName
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.vehicleTable.delegate = self
            self.vehicleTable.dataSource = self
            
            segmentVehicleType.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
            
            self.btnAdd.makeFloating()
            // Do any additional setup after loading the view.
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.handleSegmentChange()
    }
        
        @objc func handleSegmentChange()  {
            switch segmentVehicleType.selectedSegmentIndex {
            case 0:
                valueArr = Array(ObjectManager.carObjects.values)
                currentType =  Car.typeSName
            case 1:
                valueArr = Array(ObjectManager.busObjects.values)
                currentType =  Bus.typeSName
            default:
                valueArr = Array(ObjectManager.motorCycleObjects.values)
                currentType =  MotorCycle.typeSName
            }
            self.vehicleTable.reloadData()
        }
        

    @IBAction func btnAdd(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
         
         var vcStoryBoardId = "AddVehicleViewController"
        vcStoryBoardId = "AddVehicleViewController"
        let detailView = storyboard.instantiateViewController(identifier: vcStoryBoardId) as!  AddVehicleViewController
        detailView.type = currentType
        self.navigationController?.pushViewController(detailView, animated: true)
        
        
        
        
        
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

extension VehicleListViewController: UITableViewDataSource, UITableViewDelegate{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return valueArr.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCell") as! VehicleCustomCell
            
            cell.labelId.text = valueArr[indexPath.row].vehicleId
            
            cell.labelBaseRate.text =
                String(valueArr[indexPath.row].baseRate)
            
            cell.labelPerKm.text =
                "\(valueArr[indexPath.row].perKmRate)/KM"
            
            if valueArr[indexPath.row].isInsured{
                cell.labelIsInsurerd.text = "With Insurance"
            }
            else{
                cell.labelIsInsurerd.text = "No Insurance"
            }
            
            if valueArr[indexPath.row].isSelfDrive{
                cell.labelSelfDrive.text = "Self Drive"
            }
            else{
                cell.labelSelfDrive.text = "Not Self Drive"
            }
            cell.layer.borderWidth = 1.0
            return cell
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vcStoryBoardId = "VehicleDetailViewController"
            var detailView = storyboard.instantiateViewController(identifier: vcStoryBoardId) as!  VehicleDetailViewController
            detailView.vehicle = self.valueArr[indexPath.row]
            detailView.type  = self.currentType
            self.navigationController?.pushViewController(detailView, animated: true)
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    
        
    }
