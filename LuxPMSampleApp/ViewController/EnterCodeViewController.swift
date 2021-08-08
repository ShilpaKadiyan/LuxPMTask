//
//  EnterCodeViewController.swift
//  LuxPMSampleApp
//
//  Created by Apple on 08/08/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import OTPFieldView

class EnterCodeViewController: UIViewController {
    
    @IBOutlet var otpTextFieldView: OTPFieldView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupOtpView() 
    }

    @IBAction func verifyBtnAction(_ sender: Any)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let enterPasswordVC = storyBoard.instantiateViewController(withIdentifier: "EnterPasswordViewController") as! EnterPasswordViewController
        self.navigationController?.pushViewController(enterPasswordVC, animated: true)
    }
   
}

//MARK: EXTENSION
extension EnterCodeViewController: OTPFieldViewDelegate
{
    //MARK: OTPFieldViewDelegate
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        return false
    }

    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }

    func enteredOTP(otp otpString: String) {
        print("OTPString: \(otpString)")
    }
    
   //MARK: SETUP OtpView
   func setupOtpView(){
       self.otpTextFieldView.fieldsCount = 5
       self.otpTextFieldView.fieldBorderWidth = 2
       self.otpTextFieldView.defaultBorderColor = UIColor.black
       self.otpTextFieldView.filledBorderColor = UIColor.green
       self.otpTextFieldView.cursorColor = UIColor.red
       self.otpTextFieldView.displayType = .underlinedBottom
       self.otpTextFieldView.fieldSize = 40
       self.otpTextFieldView.separatorSpace = 8
       self.otpTextFieldView.shouldAllowIntermediateEditing = false
       self.otpTextFieldView.delegate = self
       self.otpTextFieldView.initializeUI()
   }
}

