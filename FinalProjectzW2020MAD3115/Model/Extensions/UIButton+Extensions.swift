//
//  UIButton+Extensions.swift
//  FinalProjectzW2020MAD3115
//
//  Created by Prakash on 2020-03-27.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

extension UIButton{
    
    func makeFloating() {
        self.backgroundColor = .red
        self.layer.cornerRadius = self.frame.height/2
        self.layer.shadowOpacity = 0.25
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    
}
