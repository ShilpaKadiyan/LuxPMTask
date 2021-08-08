//
//  StringExtension.swift
//  LuxPMSampleApp
//
//  Created by Apple on 08/08/21.
//  Copyright © 2021 Apple. All rights reserved.
//
import UIKit
extension String {
    
   var isValidEmail: Bool {
      let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
      let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
      return testEmail.evaluate(with: self)
   }
}
