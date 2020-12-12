//
//  InfoViewController.swift
//  ISMOriginalWork
//
//  Created by Gauri Pala on 10/29/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import Foundation
import UIKit

class InfoViewController:UIViewController{

    @IBOutlet weak var bgview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bgview.layer.cornerRadius = 20
        bgview.layer.masksToBounds = true
        bgview.layer.shadowColor = UIColor.black.cgColor
        bgview.layer.shadowOpacity = 1
        bgview.layer.shadowOffset = .zero
        bgview.layer.shadowRadius = 10

        
       
    }
}
