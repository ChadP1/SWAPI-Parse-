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
    @IBOutlet weak var starshipLbl: UILabel!
    @IBOutlet weak var speciesLbl: UILabel!
    @IBOutlet weak var hLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
  
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         updatePeople()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }
    
    
    func updatePeople() {
        
        let diceRoll = Int(arc4random_uniform(UInt32(61)))
        let number = String(diceRoll)
        
        let people = "http://swapi.co/api/people/1" + number
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: people)!
        
        
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                   self.updatePeople()
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
                        if  let bYear = jsonDictionary["birth_year"] as? String {
                            
                            self.speciesLbl.text = bYear
                            
                        }
                        if  let mass = jsonDictionary["mass"] as? String {
            
                            self.starshipLbl.text = mass
                        }
                    if  let hair = jsonDictionary["hair_color"] as? String {
                        
                        self.hLbl.text = hair
                    }


                    
                } catch {
                    print("These aren't the droids your looking for")
                }
            })
        }).resume()
    }
    
    
    @IBAction func randPlanet(sender: AnyObject) {
        
        updatePeople()
        
    }
    
    @IBAction func returnToMain(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
  func processNewData(location: NSArray) {
    var newUrl: AnyObject?
    
    for i in location {
        
         newUrl = i
        
    }
    
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: newUrl as! String)!
        print(url)
        print("1")
    
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
             print("2")
           
            dispatch_async(dispatch_get_main_queue(), {
                
                do {
                    print("3")
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary

                         print("4")
                    if let nameP = jsonDictionary["name"] as? String {
                      
                         self.speciesLbl.text = nameP
                         self.starshipLbl.text = nameP
                        
                    }
                    
                    
                    
                    
                    
                   } catch {
                    print("He's no good to me dead")
                }
            })
            
         })
    //}
    
}

//
//
//

}






















