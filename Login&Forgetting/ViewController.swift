//
//  ViewController.swift
//  Login&Forgetting
//
//  Created by Ruslan Safin on 23/04/2019.
//  Copyright © 2019 Ruslan Safin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Vars
    let authUsername = "Denis"
    let authPassword = "552201"
    var buttonHasBeenPressed = false
    
    // MARK: - Outlets
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var forgotLogin: UIButton!
    @IBOutlet var forgotPassword: UIButton!
    
    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameField.delegate = self
        self.passwordField.delegate = self
        
        setupViewResizerOnKeyboardShown()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AuthViewController
        
        if segue.identifier == "loginButton" {
            if usernameField.text == authUsername && passwordField.text == authPassword {
                destination.navigationItem.title = "Welcome!"
                destination.textAuth = "Hello \(authUsername)! \n" + "Your password is \(authPassword)"
            } else if usernameField.text!.isEmpty == true || passwordField.text!.isEmpty == true {
                showAlert(message: "Please, enter data")
            } else if usernameField.text != authUsername || passwordField.text != authPassword {
                showAlert(message: "Please, check the entered data")
            }
        }
        
        if segue.identifier == "forgotLogin" {
            destination.navigationItem.title = "Forgot login?"
            destination.textAuth = "Remember, your login is '\(authUsername)'"
        }
        
        if segue.identifier == "forgotPass" {
            destination.navigationItem.title = "Forgot password?"
            destination.textAuth = "Remember, your password is '\(authPassword)'"
        }
    }
    
    // MARK: - Private Methods
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .destructive)
        
        alert.addAction(okayAction)
        
        present(alert, animated: true)
    }
}

// MARK: Work with the keyboard
extension ViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension UIViewController {
    
    @objc func keyboardWillResize(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let window = view.window?.frame {
            
            let height: CGFloat
            
            if notification.name == UIResponder.keyboardWillShowNotification {
                height = window.origin.y + window.height - keyboardSize.height
            } else {
                let viewHeight = view.frame.height
                height = viewHeight + keyboardSize.height
            }
            
            view.frame = CGRect(
                x: view.frame.origin.x,
                y: view.frame.origin.y,
                width: view.frame.width,
                height: height
            )
        }
    }
    
    func setupViewResizerOnKeyboardShown() {
        
        let names: [NSNotification.Name] = [
            UIResponder.keyboardWillShowNotification,
            UIResponder.keyboardWillHideNotification
        ]
        
        for name in names {
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(keyboardWillResize),
                name: name,
                object: nil
            )
        }
    }
}
