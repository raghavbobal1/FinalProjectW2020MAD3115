//
//  RentViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-26.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class RentCustomCell: UITableViewCell{
    
    @IBOutlet weak var labelID: UILabel!
    
    
}

class RentListViewController: UIViewController {

    @IBOutlet weak var tableRent: UITableView!
    
        
            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableRent.delegate = self
        self.tableRent.dataSource = self
        
       
        // Do any additional setup after loading the view.
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

extension RentListViewController: UITableViewDataSource, UITableViewDelegate{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Array(ObjectManager.vehicleRentObjects.values).count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rentCell") as! RentCustomCell
            cell.labelID.text = Array(ObjectManager.vehicleRentObjects.values)[indexPath.row].id
            return cell
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        
    }
