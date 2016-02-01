//
//  ThemeTracker.swift
//  BB8's Data Bank
//
//  Created by chad parr on 2/1/16.
//  Copyright © 2016 chad parr. All rights reserved.
//

import Foundation

class Theme {
    
    private var _num = 0
   
    var num: Int {
        return _num
    }
    
    func increment(){
        +num++
    }
    
    func checkBool(currentNum: Int) ->Bool{
         if self._num % 2 == 0 {
         return true 
        }
    }
    
}