//
//  VehicleViewController.swift
//  BB8's Data Bank
//
//  Created by chad parr on 1/21/16.
//  Copyright © 2016 chad parr. All rights reserved.
//

import UIKit

class WookieViewController: UIViewController {
    
    

    @IBOutlet weak var teoLbl: UILabel!
    @IBOutlet weak var one: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        populateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func populateLabels() {
        
        let diceRoll = Int(arc4random_uniform(UInt32(37)))
        let diceRollNum = String(diceRoll)
        
        
        let wookie = "https://swapi.co/api/planets/" + diceRollNum + "/?format=wookiee"
        let session = NSURLSession.sharedSession()
        print(wookie)
        let url = NSURL(string: wookie)!
        
        
        
        
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
                        
                        if  let first = json["whrascwo"] as? String {
                            
                            self.one.text = first
                            print(first)
                        }
                        if  let two = json["rcooaoraaoahoowh_akworcahoowa"] as? String {
                            
                            self.teoLbl.text = two
                            print(two)
                        }
            
                        
                        
                    }
                    
                } catch {
                    print("Let the wookie win")
                }
                
            })
            
            
        }).resume()
        
    }
    
    @IBAction func newWookieButton(sender: AnyObject) {
        
        populateLabels()
        
    }
    
    @IBAction func returnToMain(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
}
