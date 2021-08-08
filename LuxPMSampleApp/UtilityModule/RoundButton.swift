//
//  RoundButton.swift
//  LuxPMSampleApp
//
//  Created by Apple on 08/08/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
   @IBInspectable var cornerRadius: CGFloat = 15 {
          didSet {
              refreshCorners(value: cornerRadius)
          }
      }

}
