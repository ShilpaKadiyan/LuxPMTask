//
//  Utility.swift
//  LuxPMSampleApp
//
//  Created by Apple on 08/08/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation

class Utility{
    
    //Retrieving User Information
     class func userName()-> String
    {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "Username") as? String ?? ""
    }

    class func password()-> String
    {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "Password") as? String ?? ""
    }

    class func saveUserInformation()
    {
        let defaults = UserDefaults.standard
        defaults.setValue("test@luxpmsoft.com", forKey: "Username")
        defaults.setValue("test1234!", forKey: "Password")
    }

}
