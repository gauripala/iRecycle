//
//  PopUpInfoViewController.swift
//  ISMOriginalWork
//
//  Created by Gauri Pala on 11/26/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import Foundation
import UIKit

class PopUpInfoViewController: UIViewController{

    
    @IBOutlet weak var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 20
    }
    //back button
    @IBAction func back(_ sender: Any) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    
    
    
}
