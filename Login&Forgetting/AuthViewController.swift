//
//  AuthViewController.swift
//  Login&Forgetting
//
//  Created by Ruslan Safin on 23/04/2019.
//  Copyright © 2019 Ruslan Safin. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    // MARK: - Vars
    var textAuth = ""
    
    // MARK: - Outlets
    @IBOutlet var authText: UILabel!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authText.text = textAuth
        authText.numberOfLines = 0
    }
}
