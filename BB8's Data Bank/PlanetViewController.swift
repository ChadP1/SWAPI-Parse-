//
//  ViewController.swift
//  BB8's Data Bank
//
//  Created by chad parr on 1/15/16.
//  Copyright © 2016 chad parr. All rights reserved.
//

import UIKit
import GameplayKit

class PlanetViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rotationPeriod: UILabel!
    @IBOutlet weak var orbitalPeriod: UILabel!
    @IBOutlet weak var climate: UILabel!
    @IBOutlet weak var gravity: UILabel!
    @IBOutlet weak var terrain: UILabel!
    @IBOutlet weak var population: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    override func viewWillAppear(animated: Bool) {
        updatePlanet()
    }
    
 
    func updatePlanet() {
        
        
        let diceRoll = Int(arc4random_uniform(UInt32(61)))
        let planetNumber = String(diceRoll)
  
        
       
        let planet = "http://swapi.co/api/planets/" + planetNumber
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: planet)!
        
      
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    self.updatePlanet()
                    print("Not a 200 response")
                    return
            }
            
            
            dispatch_async(dispatch_get_main_queue(), {

            do {
                
                
                if let info = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                    
                    print(info)
                    
                    
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    
                    if  let planets = jsonDictionary["name"] as? String {
                        
                        self.name.text = planets
                        print(planets)
                    }
                    if  let rotation = jsonDictionary["rotation_period"] as? String {
                        
                        self.rotationPeriod.text = rotation
                        print(rotation)
                    }
                    if  let orbital = jsonDictionary["orbital_period"] as? String {
                        
                        self.orbitalPeriod.text = orbital
                        print(orbital)
                    }
                    if  let climate = jsonDictionary["climate"] as? String {
                        
                        self.climate.text = climate
                        print(climate)
                    }
                    if  let gravity = jsonDictionary["gravity"] as? String {
                        
                        self.gravity.text = gravity
                        print(gravity)
                    }
                    if  let surface = jsonDictionary["terrain"] as? String {
                        
                        self.terrain.text = surface
                        print(surface)
                    }
                    if  let population = jsonDictionary["population"] as? String {
                        
                        self.population.text = population
                        print(population)
                    }
                    if  let residents = jsonDictionary["residents"] as? String {
                        print(residents)
                    }

                   
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
    
    

    
//
//End of ViewController Class
//
}

