//
//  Rank.swift
//  Focus
//
//  Created by Ya Cheng on 5/18/21.
//

import SwiftUI

struct Rank: View {
    @EnvironmentObject var current: current_user
    var rank = [rankModel]()
    
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
                ForEach(0..<rank.count) { cur in
                    if cur < 10 {
                        RankingRowView(rank: String(cur + 1) , usrName: rank[cur].userName, hStr: String(rank[cur].total_time/60), mStr: String(rank[cur].total_time%60), sStr: "00", isMe: rank[cur].userName == current.User)
                    }
                    
                }
            }
            .padding(.leading, -20)
            .frame(width: UIScreen.main.bounds.width)
        }
        .padding(.top, -15)
    }
}

//struct Rank_Previews: PreviewProvider {
//    static var previews: some View {
//        Rank()
//    }
//}
