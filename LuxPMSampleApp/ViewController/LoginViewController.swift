//
//  LoginViewController.swift
//  LuxPMSampleApp
//
//  Created by Apple on 06/08/21.
//  Copyright © 2021 Apple. All rights reserved.
//
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTxtFld: UITextField!
    @IBOutlet weak var pwdTxtFld: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var validateEmailLbl: UILabel!
    @IBOutlet weak var validatePwdLbl: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Button Action
    @IBAction func forgetPasswordBtnAction(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let forgotVC = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        self.navigationController?.pushViewController(forgotVC, animated: true)
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        
        if(validateUser())
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let tabBarController = storyBoard.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
            UIApplication.shared.windows.first?.rootViewController = tabBarController
                UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
        else{
            updateErrorMessage()
        }
    }
}

//MARK: EXTENSION

extension LoginViewController: UITextFieldDelegate {

    
    //MARK: TEXTFIELD DELEGATE
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        switch textField {
        case userNameTxtFld:
            pwdTxtFld.becomeFirstResponder()
        case pwdTxtFld:
            pwdTxtFld.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }

         return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == pwdTxtFld){
            validatePwdLbl.isHidden = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case userNameTxtFld:
            if let boolValue = (userNameTxtFld.text?.isValidEmail){
                if(boolValue == true){
                    validateEmailLbl.isHidden = true
                    pwdTxtFld.becomeFirstResponder()
                }
                else
                {
                    validateEmailLbl.isHidden = false
                    validateEmailLbl.text = "Invalid Email !"
                    userNameTxtFld.becomeFirstResponder()
                }
            }
        case pwdTxtFld:
            pwdTxtFld.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        updateLoginButton()
    }
    
        
    //MARK: UTILITY METHOD
    
    //Retrieving Validating User
    func validateUser() -> Bool
    {
      //  print("\(userName())")
      //  print("\(password())")

        if((userNameTxtFld.text == Utility.userName()) && (pwdTxtFld.text == Utility.password()))
        {
            return true
        }
        
        return false
    }
    
    func updateLoginButton()
    {
        if let isValid = userNameTxtFld.text?.isValidEmail, isValid, (pwdTxtFld.text?.count ?? 0) >= 1
        {
                loginButton.isEnabled = true
        }
        else{
            loginButton.isEnabled = false
        }
    }
    
    func updateErrorMessage()
    {
        if let isValid = userNameTxtFld.text?.isValidEmail, isValid,(userNameTxtFld.text != Utility.userName()){
            validateEmailLbl.text = "This User is not registered"
            validateEmailLbl.isHidden = false
            validatePwdLbl.isHidden = true
        }
        else if(((pwdTxtFld.text?.count ?? 0) >= 1) && pwdTxtFld.text != Utility.password()){
            validatePwdLbl.text = "Incorrect password"
            validatePwdLbl.isHidden = false
            validateEmailLbl.isHidden = true
        }
    }

}
