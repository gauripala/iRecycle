//
//  PopUpInfo6ViewController.swift
//  ISMOriginalWork
//
//  Created by Gauri Pala on 12/6/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import Foundation
import UIKit

class PopUpInfo6ViewController: UIViewController{

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 20
    }
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    
    
    
}
