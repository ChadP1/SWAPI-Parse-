//
//  PeopleViewController.swift
//  BB8's Data Bank
//
//  Created by chad parr on 1/19/16.
//  Copyright © 2016 chad parr. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {


    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var eyecolorLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var starshipLbl: UILabel!
    @IBOutlet weak var speciesLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatePlanet()
        
    }
    
    
    func updatePlanet() {
        
        let diceRoll = Int(arc4random_uniform(UInt32(61)))
        let number = String(diceRoll)
        
        let people = "http://swapi.co/api/people/" + number
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: people)!
        
        
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
           
            dispatch_async(dispatch_get_main_queue(), {
                
                do {
                    
                        
                        let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                        
                        if  let name = jsonDictionary["name"] as? String {
                            
                            self.nameLbl.text = name
                            print(name)
                        }
                        if  let genderType = jsonDictionary["gender"] as? String {
                            
                            self.genderLbl.text = genderType
                            print(genderType)                             }
                        if  let height = jsonDictionary["height"] as? String {
                            
                            self.heightLbl.text = height
                            print(height)
                        }
                        if  let eyeColor = jsonDictionary["eye_color"] as? String {
                            
                            self.eyecolorLbl.text = eyeColor
                            print(eyeColor)
                        }
                        if  let species = jsonDictionary["species"] as? NSArray {
                            
                            //self.speciesLbl.text = species
                            print(species)
                        }
                        if  let starship = jsonDictionary["starships"] as? NSArray {
            
                            
                            //self.starshipLbl.text = starship
                            print(starship)
                        }

                    
                } catch {
                    print("These aren't the droids your looking for")
                }
            })
        }).resume()
    }
    
    
    @IBAction func randPlanet(sender: AnyObject) {
        
        updatePlanet()
        
    }
    
    @IBAction func returnToMain(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
   /* func processNewData(data: NSArray) {
        
        
        let people = "http://swapi.co/api/people/1" //+ number
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: people)!
        
        
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            dispatch_async(dispatch_get_main_queue(), {
                
                do {

        
        
        
        
        
        for ship in data {
            
             let shipData = NSURL(string: ship)
            
        }
        
        
    }
    
*/
//
//
//

}


