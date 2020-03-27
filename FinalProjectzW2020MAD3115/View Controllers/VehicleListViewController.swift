//
//  VehicleListViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-26.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class VehicleCustomCell: UITableViewCell{
    
    @IBOutlet weak var nameLabel: UILabel!
    
}

class VehicleListViewController: UIViewController {
       
    @IBOutlet weak var segmentVehicleType: UISegmentedControl!
    @IBOutlet weak var vehicleTable: UITableView!
    var valueArr: [Vehicle] = Array(ObjectManager.carObjects.values)
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.vehicleTable.delegate = self
            self.vehicleTable.dataSource = self
            
            segmentVehicleType.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
            // Do any additional setup after loading the view.
        }
        
        @objc func handleSegmentChange()  {
            switch segmentVehicleType.selectedSegmentIndex {
            case 0:
                valueArr = Array(ObjectManager.carObjects.values)
            case 1:
                valueArr = Array(ObjectManager.busObjects.values)
            default:
                valueArr = Array(ObjectManager.motorCycleObjects.values)
            }
            self.vehicleTable.reloadData()
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
            cell.nameLabel.text = valueArr[indexPath.row].vehicleId
            return cell
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        
    }
