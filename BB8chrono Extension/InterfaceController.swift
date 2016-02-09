//
//  InterfaceController.swift
//  BB8chrono Extension
//
//  Created by chad parr on 2/8/16.
//  Copyright © 2016 chad parr. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var nameLbl: WKInterfaceLabel!
    @IBOutlet var genderLbl: WKInterfaceLabel!
    @IBOutlet var speciesLbl: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
       nameLbl.setText("Han Solo")
       genderLbl.setText("Male")
       speciesLbl.setText("Human")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
