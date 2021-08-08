//
//  EnterPasswordViewController.swift
//  LuxPMSampleApp
//
//  Created by Apple on 08/08/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class EnterPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func setNewPasswordBtnAction(_ sender: Any)
    {
    }
}

//MARK: EXTENSION
extension EnterPasswordViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        textField.resignFirstResponder()
         return true
    }
}

