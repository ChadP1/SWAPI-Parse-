//
//  SpeciesViewController.swift
//  BB8's Data Bank
//
//  Created by chad parr on 1/25/16.
//  Copyright © 2016 chad parr. All rights reserved.
//

import UIKit

class SpeciesViewController: UIViewController {
    
    
    @IBOutlet weak var speciesLbl: UILabel!
    @IBOutlet weak var classLbl: UILabel!
    @IBOutlet weak var desigLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var lifespanLbl: UILabel!
    @IBOutlet weak var langLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func populateLabels() {
        
        let diceRoll = Int(arc4random_uniform(UInt32(37)))
        let diceRollNum = String(diceRoll)
        
        
        let ships = "http://swapi.co/api/species/" + diceRollNum
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
                            
                            self.speciesLbl.text = name
                            print(name)
                        }
                        if  let classify = json["classification"] as? String {
                            
                            self.classLbl.text = classify
                            print(classify)
                        }
                        if let desig = json["designation"] as? String {
                            
                            self.desigLbl.text = desig
                            print(desig)
                        }
                        if  let height = json["average_height"] as? String {
                            
                            self.heightLbl.text = height
                            print(height)
                        }
                        if  let life = json["average_lifespan"] as? String {
                            
                            self.lifespanLbl.text = life
                            print(life)
                        }
                        if  let lang = json["language"] as? String {
                            
                            self.langLbl.text = lang
                            print(lang)
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
