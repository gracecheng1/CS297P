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
    
    init(time: Int, animal: String) {
        self.time = time
        self.animal = animal
    }
    
    func finished() {
        self.finish.toggle()
    }
}
