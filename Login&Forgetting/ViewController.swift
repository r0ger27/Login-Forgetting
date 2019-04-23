//
//  ViewController.swift
//  Login&Forgetting
//
//  Created by Руслан Сафин on 23/04/2019.
//  Copyright © 2019 Ruslan Safin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    enum UserAction {
        case onlyLogin, onlyPassword, wrongLogin, wrongPassword, forgotLogin, forgotPass, allGood
    }
    
    let username = "Ruslan"
    let password = "123456"

}

