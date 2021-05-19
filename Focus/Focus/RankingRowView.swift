//
//  RankingRowView.swift
//  Focus
//
//  Created by Shiheng Wang on 5/18/21.
//

import SwiftUI

struct RankingRowView: View {
    var rank: String
    var usrName: String
    var hStr: String
    var mStr: String
    var sStr: String
    var isMe: Bool
    
    var body: some View {
        HStack {
            HStack {
                StarView(isSet: isMe)
                Text(rank)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .frame(width: UIScreen.main.bounds.width / 3, height: 50)
            Spacer()
            Text(usrName)
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: UIScreen.main.bounds.width / 3, height: 50)
            Spacer()
            Text(hStr + ":" + mStr + ":" + sStr)
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: UIScreen.main.bounds.width / 3, height: 50)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .center)
        .background(isMe ? Color(0xFED363).opacity(0.8) : Color.white)
    }
}

struct RankingRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RankingRowView(rank: "1", usrName: "Grace", hStr: "01", mStr: "25", sStr: "00", isMe: false)
            RankingRowView(rank: "2", usrName: "Sebastian", hStr: "00", mStr: "25", sStr: "00", isMe: true)
            RankingRowView(rank: "3", usrName: "Frank", hStr: "00", mStr: "10", sStr: "00", isMe: false)
        }
    }
}
