//
//  MainView.swift
//  Focus
//
//  Created by Shiheng Wang on 5/20/21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var current: current_user
    @EnvironmentObject var rank: rankList
    @State private var selectedTab = 0

    var body: some View {
        let selection = Binding<Int> (
            get: { self.selectedTab },
            set: { self.selectedTab = $0
                print("Pressed tab: \($0)")
                if $0 == 2 {
                    for index in 0..<rank.ranks.count
                    {
                        if rank.ranks[index].userName == current.User
                        {
                            print(current.Total_time)
                            rank.ranks[index].total_time = current.Total_time
                            print(rank.ranks[index].total_time)
                        }
                    }
                    rank.mySort()
                }
            }
        )
        VStack{
            return TabView(selection: selection) {
                CountDown()
                    .environmentObject(current)
                    .environmentObject(rank)
                    .navigationBarHidden(true)
                    .tabItem { Label("Study", systemImage: "clock") }
                    .tag(0)
                MyZoo()
                    .environmentObject(current)
                    .navigationBarHidden(true)
                    .tabItem { Label("Zoo", systemImage: "hare")}
                    .tag(1)
                Rank()
                    .environmentObject(current)
                    .environmentObject(rank)
                    .navigationBarHidden(true)
                    .tabItem { Label("Scoreboard", systemImage: "list.number") }
                    .tag(2)
                History().environmentObject(current).navigationBarHidden(true)
                    .tabItem { Label("History", systemImage: "calendar.badge.clock") }
                    .tag(3)
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
