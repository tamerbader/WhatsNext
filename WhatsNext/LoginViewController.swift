//
//  LoginViewController.swift
//  WhatsNext
//
//  Created by MetroStar on 8/8/17.
//  Copyright © 2017 TamerBader. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let TEN_PERCENT_CONSTRAINT_VALUE: CGFloat = 0.1
    let FIVE_PERCENT_CONSTRAINT_VALUE: CGFloat = 0.05
    var amountMovedUpward:Int = 0
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailUnderline: UIView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordUnderline: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var formView: UIView!
    
    
    @IBOutlet weak var fieldsSpacingConstraint: NSLayoutConstraint!
    @IBOutlet weak var signInTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var signUpMessageConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewTopConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        setupDelegates()
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        
        
    }
    
    func setupView() {
        emailField.attributedPlaceholder = NSAttributedString(string: "Email Address", attributes: [NSForegroundColorAttributeName: UIColor.black])
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.black])
        fieldsSpacingConstraint.constant = formView.frame.height * TEN_PERCENT_CONSTRAINT_VALUE
        signInTopConstraint.constant = formView.frame.height * TEN_PERCENT_CONSTRAINT_VALUE
        signUpMessageConstraint.constant = formView.frame.height * FIVE_PERCENT_CONSTRAINT_VALUE
        
        let signUpMessage:NSMutableAttributedString = NSMutableAttributedString(string: "")
        
        let questionAttributedMessage:NSAttributedString = NSAttributedString(string: "DON'T HAVE AN ACCOUNT?", attributes: [NSForegroundColorAttributeName: UIColor.Gray])
        let signUpAttributedMessage:NSAttributedString = NSAttributedString(string: "  SIGN UP", attributes: [NSForegroundColorAttributeName: UIColor.Black])
        signUpMessage.append(questionAttributedMessage)
        signUpMessage.append(signUpAttributedMessage)
        
        signUpLabel.attributedText = signUpMessage
        
        
    }
    
    func setupDelegates() {
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        print("SIGNING IN")
        self.performSegue(withIdentifier: "goToMainPage", sender: nil)
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == emailField) {
            emailUnderline.backgroundColor = UIColor.Black
        } else {
            passwordUnderline.backgroundColor = UIColor.Black
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField == emailField) {
            emailUnderline.backgroundColor = UIColor.OpaqueGray
        } else {
            passwordUnderline.backgroundColor = UIColor.OpaqueGray
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == emailField) {
            emailField.endEditing(true)
            passwordField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
                self.viewTopConstraint.constant = 0
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        return true
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if (!passwordField.isEditing) {
            if let keyboardSize:CGRect = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
                    self.viewTopConstraint.constant -= keyboardSize.height
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }
        }
        
    }
    
}
