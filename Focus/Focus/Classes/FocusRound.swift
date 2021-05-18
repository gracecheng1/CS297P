//
//  FocusRound.swift
//  Focus
//
//  Created by Shiheng Wang on 5/10/21.
//

import Foundation

class FocusRound {
    var time: Int
    var animal: String
    var finish: Bool = false
    
    init() {
        self.time = 0
        self.animal = ""
    }
    
    func setTime(time: Int) {
        self.time = time
    }
    
    func setAnimal(animal: String) {
        self.animal = animal
    }
    
    func finished() {
        self.finish.toggle()
    }
    
    func reset() {
        self.time = 0
        self.animal = ""
        self.finish = false
    }
}
