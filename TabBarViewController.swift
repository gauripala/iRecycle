//
//  TabBarViewController.swift
//  ISMOriginalWork
//
//  Created by Gauri Pala on 12/7/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    @IBInspectable var defaultIndex: Int = 1

        override func viewDidLoad() {
            super.viewDidLoad()
            selectedIndex = defaultIndex
        }
}
