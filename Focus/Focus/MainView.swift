//
//  MainView.swift
//  Focus
//
//  Created by Shiheng Wang on 5/20/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CountDown()
                .tabItem { Label("Study", systemImage: "clock") }
            MyZoo()
                .tabItem { Label("Zoo", systemImage: "hare") }
            Rank()
                .tabItem { Label("Scoreboard", systemImage: "list.number") }
            History()
                .tabItem { Label("History", systemImage: "calendar.badge.clock") }
        }
        .accentColor(Color(0xFD716A))
        .animation(.linear)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
