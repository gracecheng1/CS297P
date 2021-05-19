//
//  Rank.swift
//  Focus
//
//  Created by Ya Cheng on 5/18/21.
//

import SwiftUI

struct Rank: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Rank")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer()
                Text("Name")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer()
                Text("Total")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: [Color(0xFD716A), Color(0xFED363)]), startPoint: .bottomLeading, endPoint: .topTrailing))
            List {
                RankingRowView(rank: "1", usrName: "Grace", hStr: "01", mStr: "25", sStr: "00", isMe: false)
                RankingRowView(rank: "2", usrName: "Sebastian", hStr: "00", mStr: "25", sStr: "00", isMe: false)
                RankingRowView(rank: "3", usrName: "Frank", hStr: "00", mStr: "10", sStr: "00", isMe: true)
            }
            .padding(.leading, -20)
            .frame(width: UIScreen.main.bounds.width)
            HStack {
                Spacer()
                NavigationLink(destination: CountDown().navigationBarHidden(true)) {
                    EmptyTab(current:"Study")
                }
                Spacer()
                NavigationLink(destination: MyZoo().navigationBarHidden(true)) {
                    EmptyTab(current:"MyZoo")
                }
                Spacer()
                CurrentTab(current:"Rank")
                
                Spacer()
                NavigationLink(destination: History().navigationBarHidden(true)) {
                EmptyTab(current:"History")
                }
            }
        }
        .padding(.top, -15)
    }
}

struct Rank_Previews: PreviewProvider {
    static var previews: some View {
        Rank()
    }
}
