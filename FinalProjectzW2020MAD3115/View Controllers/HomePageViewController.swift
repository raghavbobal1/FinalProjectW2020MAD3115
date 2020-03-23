//
//  ViewController.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Raghav Bobal on 2020-03-17.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}

