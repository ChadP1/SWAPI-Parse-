//
//  OrangeButton.swift
//  BB8's Data Bank
//
//  Created by chad parr on 1/27/16.
//  Copyright © 2016 chad parr. All rights reserved.
//

import UIKit

class OrangeButton: UIButton {
    
    var theme = Theme()
    
    
   override func awakeFromNib() {
        blueOrOrange()
    }

    
    func blueOrOrange() {
        
         if theme.num % 2 == 0 {
            
            orange()
          
         } else {
        
        blue()
       
        }
    }
    
    
    func orange(){
        self.layer.cornerRadius = 10.0//orange
        backgroundColor = UIColor(red: 245.0/255, green: 137.0/255, blue: 65.0/255, alpha: 1)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
    }
    
    func blue(){
        
        self.layer.cornerRadius = 10.0//blue
        backgroundColor = UIColor(red: 37.0/255, green: 72.0/255, blue: 185.0/255, alpha: 1)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
    }
    
}
