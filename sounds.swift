//
//  SoundViewController.swift
//  BB8's Data Bank
//
//  Created by chad parr on 1/26/16.
//  Copyright © 2016 chad parr. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController {
    
    func playNoise() {
        print(1)
        
        var sfxBB81: AVAudioPlayer!
        var sfxBB2: AVAudioPlayer!
        var sfxBB83: AVAudioPlayer!
        
        do {
            
            try sfxBB81 = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("BB81", ofType: "wav")!))
            try sfxBB2 = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("BB2", ofType: "wav")!))
            try sfxBB83 = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("BB83", ofType: "wav")!))
            
            sfxBB81.prepareToPlay()
            sfxBB2.prepareToPlay()
            sfxBB83.prepareToPlay()
            
            
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        
        let rand = arc4random_uniform(3)
        print(rand)
        if rand == 0 {
            
            sfxBB81.play()
            
        } else if rand == 1 {
            sfxBB2.play()
        } else if rand == 2 {
            sfxBB83.play()
        }

        
        
    }

    
    
    
    
}





