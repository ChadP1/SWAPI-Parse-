//
//  ShipsViewController.swift
//  BB8's Data Bank
//
//  Created by chad parr on 1/20/16.
//  Copyright © 2016 chad parr. All rights reserved.
//

import UIKit

class ShipsViewController: UIViewController {
    
    
    @IBOutlet weak var naneLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manuLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var classLbl: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        populateLabels()
    }

    func populateLabels() {
        
      let diceRoll = Int(arc4random_uniform(UInt32(37)))
      let diceRollNum = String(diceRoll)
        
        
      let ships = "http://swapi.co/api/starships/" + diceRollNum
      let session = NSURLSession.sharedSession()
        print(ships)
      let url = NSURL(string: ships)!
        
        
        
        
        session.dataTaskWithURL(url, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    self.populateLabels()
                    print("NOt a 200 response")
                    return
            }
        
            dispatch_async(dispatch_get_main_queue(), {
                
                do {
                    
                    if let info = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                        // Print what we got from the call
                        print(info)

                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    
                    if  let name = json["name"] as? String {
                            
                            self.naneLbl.text = name
                            print(name)
                        }
                    if  let model = json["model"] as? String {
                            
                            self.modelLbl.text = model
                            print(model)
                        }
                    if let manufact = json["manufacturer"] as? String {
                        
                        self.manuLbl.text = manufact
                        print(manufact)
                    }
                    if  let cost = json["cost_in_credits"] as? String {
                        
                        self.costLbl.text = cost
                        print(cost)
                    }
                    if  let crew = json["crew"] as? String {
                        
                        self.crewLbl.text = crew
                        print(crew)
                    }
                    if  let passengers = json["passengers"] as? String {
                        
                        self.passengersLbl.text = passengers
                        print(passengers)
                    }
                    if  let classofship = json["starship_class"] as? String {
                        
                        self.classLbl.text = classofship
                        print(classofship)
                    }



                    
                    
                    }
                    
                } catch {
                    print("You want to go home and rethink your life")
                }
            
            })
            
        
    }).resume()
        
    }
    
    @IBAction func newShipButton(sender: AnyObject) {
        
        populateLabels()
        
    }
    
    
    @IBAction func returnToMain(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    

}
