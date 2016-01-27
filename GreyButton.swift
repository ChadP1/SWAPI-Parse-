//
//  GreyButton.swift
//  BB8's Data Bank
//
//  Created by chad parr on 1/27/16.
//  Copyright © 2016 chad parr. All rights reserved.
//

import UIKit

class GreyButton: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        backgroundColor = UIColor(red: 135.0/255, green: 135.0/255, blue: 135.0/255, alpha: 1)
        
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }

}
