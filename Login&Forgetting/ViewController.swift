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
    
    // MARK: - Outlets
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var forgotLogin: UIButton!
    @IBOutlet var forgotPassword: UIButton!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameField.delegate = self
        self.passwordField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        hideKeyboardFromTap()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AuthViewController
        
        if usernameField.text == authUsername  && passwordField.text == authPassword {
            destination.navigationItem.title = "Welcome!"
            destination.textAuth = "Hello \(authUsername)! \n" + "Your password is \(authPassword)"
        } else if usernameField.text!.isEmpty == true || passwordField.text!.isEmpty == true {
            showAlert(message: "Please, enter data")
        } else if usernameField.text != authUsername || passwordField.text != authPassword {
            showAlert(message: "Please, check the entered data")
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
    
    @objc func keyboardWillShow(notification: NSNotification) {
        var translation:CGFloat = 0
        
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft || UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                if usernameField.isEditing {
                    translation = CGFloat(-keyboardSize.height / 4.2)
                } else if passwordField.isEditing {
                    translation = CGFloat(-keyboardSize.height / 4.2)
                }
            }
        }
        
        UIView.animate(withDuration: 0.2) {
            self.view.transform = CGAffineTransform(translationX: 0, y: translation)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.2) {
            self.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }
    
    private func hideKeyboardFromTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
