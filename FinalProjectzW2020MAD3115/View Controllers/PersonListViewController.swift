//
//  PersonListViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-26.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit


class PersonCustomCell: UITableViewCell{
    
    @IBOutlet weak var labelName: UILabel!
    
}

class PersonListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

extension PersonListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ObjectManager.customerObjects.values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell") as! PersonCustomCell
        cell.labelName.text = Array(ObjectManager.customerObjects.values)[indexPath.row].firstName
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
}
