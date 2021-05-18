//
//  ChooseAnimalView.swift
//  Focus
//
//  Created by Shiheng Wang on 5/17/21.
//

import SwiftUI

struct ChooseAnimalView: View {
    @Binding var show: Bool
    @Binding var animal: String
    
    var body: some View {
        if show {
            // Background color
            Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)
            
            // Animals
            VStack {
                HStack {
                    Button(action: setJerry) {
                        Image("jerry")
                    }
                    Button(action: setKitty) {
                        Image("kitty")
                    }
                }
                HStack {
                    Button(action: setPanda) {
                        Image("panda")
                    }
                    Button(action: setPikachu) {
                        Image("pikachu")
                    }
                }
                HStack {
                    Button(action: setSnoopy) {
                        Image("snoopy")
                    }
                    Button(action: setTom) {
                        Image("tom")
                    }
                }
            }
            .background(Color(0xFFFFFF))
            .cornerRadius(15.0)
        }
    }
    
    func setJerry() {
        animal = "jerry"
        show = false
    }
    
    func setKitty() {
        animal = "kitty"
        show = false
    }
    
    func setPanda() {
        animal = "panda"
        show = false
    }
    
    func setPikachu() {
        animal = "pikachu"
        show = false
    }
    
    func setSnoopy() {
        animal = "snoopy"
        show = false
    }
    
    func setTom() {
        animal = "tom"
        show = false
    }
}

//struct ChooseAnimalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChooseAnimalView()
//    }
//}
