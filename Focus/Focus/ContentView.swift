//
//  ContentView.swift
//  Focus
//
//  Created by Shiheng Wang on 4/19/21.
//
import SwiftUI

struct ContentView: View {
    @State private var showPopUp: Bool = true
    
    var body: some View {
        PopUpWindow(title: "Sure to Exit?", message: "You will lose your progress if you exit now!", button1Text: "Keep up!", button2Text: "Exit", show: $showPopUp)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
