//
//  VehicleViewController.swift
//  BB8's Data Bank
//
//  Created by chad parr on 1/21/16.
//  Copyright © 2016 chad parr. All rights reserved.
//

import UIKit

class VehicleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func returnToMain(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
}
