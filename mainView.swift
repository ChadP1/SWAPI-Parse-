//
//  mainView.swift
//  BB8's Data Bank
//
//  Created by chad parr on 1/25/16.
//  Copyright © 2016 chad parr. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class mainViewController: UIViewController {
    
  //  var sfxBB81: AVAudioPlayer!
  //  var sfxBB2: AVAudioPlayer!
  //  var sfxBB83: AVAudioPlayer!
    
    var soundSFX: SoundViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playNoise()
        
        
      /*  do {
           
            try sfxBB81 = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("BB81", ofType: "wav")!))
            try sfxBB2 = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("BB2", ofType: "wav")!))
            try sfxBB83 = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("BB83", ofType: "wav")!))
            
            sfxBB81.prepareToPlay()
            sfxBB2.prepareToPlay()
            sfxBB83.prepareToPlay()
            
            
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        */
        
       
    }
    
    
    @IBAction func noiseOnButton(sender: AnyObject) {
        
        
       playNoise()
      // soundSFX.playNoise()
        
    }
    
    
    func playNoise() {
        
        print(1)
        var sfxBB81: AVAudioPlayer!
        var sfxBB2: AVAudioPlayer!
        var sfxBB83: AVAudioPlayer!
        
        do {
         print(2)
            try sfxBB81 = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("BB81", ofType: "wav")!))
            try sfxBB2 = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("BB2", ofType: "wav")!))
            try sfxBB83 = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("BB83", ofType: "wav")!))
            
            sfxBB81.prepareToPlay()
            sfxBB2.prepareToPlay()
            sfxBB83.prepareToPlay()
            
            
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        print(5)
        
        let rand = arc4random_uniform(3)
        print(rand)
        if rand == 0 {
            
            sfxBB81.play()
        print(6)
        } else if rand == 1 {
            sfxBB2.play()
        } else if rand == 2 {
            sfxBB83.play()
        }
        
        
        
    }

    
    
    
    
}