//
//  ViewController.swift
//  Login&Forgetting
//
//  Created by Руслан Сафин on 23/04/2019.
//  Copyright © 2019 Ruslan Safin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let authUsername = "Ruslan"
    
    let authPassword = "123456"
    
    enum UserAction {
        case onlyLogin, onlyPassword, wrongLogin, wrongPassword, forgotLogin, forgotPass, allGood
    }
    
/*    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func userActions(username: String, password: String, sender: UIButton) {
        
        switch UserAction.self {
        case .onlyLogin: print(1)
            
        case .onlyPassword: print(1)
            
        case .wrongLogin: print(1)
            
        case .wrongPassword: print(1)
            
        case .forgotLogin: print(1)
            
        case .forgotPass: print(1)
            
        case .allGood:
            if username == authUsername && password == authPassword {
                print(1)
            }
        }
    } */
    
    // Задаем скрытие клавиатуры при тапе по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    
}

