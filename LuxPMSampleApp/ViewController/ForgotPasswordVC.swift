//
//  ForgotPasswordVC.swift
//  LuxPMSampleApp
//
//  Created by Apple on 07/08/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func submitEmailBtnAction(_ sender: Any)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let enterCodeVC = storyBoard.instantiateViewController(withIdentifier: "EnterCodeViewController") as! EnterCodeViewController
        self.navigationController?.pushViewController(enterCodeVC, animated: true)
    }
}

extension ForgotPasswordVC: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        textField.resignFirstResponder()
         return true
    }

}
