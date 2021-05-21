//
//  MainView.swift
//  Focus
//
//  Created by Shiheng Wang on 5/20/21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var current: current_user
    
    var body: some View {
        VStack{
        TabView {
            CountDown().environmentObject(current).navigationBarHidden(true)
                .tabItem { Label("Study", systemImage: "clock") }
            MyZoo().environmentObject(current).navigationBarHidden(true)
                .tabItem { Label("Zoo", systemImage: "hare")}
            Rank().environmentObject(current).navigationBarHidden(true)
                .tabItem { Label("Scoreboard", systemImage: "list.number") }
            History().environmentObject(current).navigationBarHidden(true)
                .tabItem { Label("History", systemImage: "calendar.badge.clock") }
        }
        .accentColor(Color(0xFD716A))
        .animation(.linear)
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    @State static var current = current_user(User: "", _id: "", Password: "", Email: "NULL", Total_time: 0, Zoo: animals(jerry: 0, kitty: 0, panda: 0, pikachu:0, snoopy:0, tom:0))
//    
//    static var previews: some View {
//        MainView(current: $current)
//    }
//}
