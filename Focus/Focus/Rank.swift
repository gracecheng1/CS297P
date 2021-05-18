//
//  Rank.swift
//  Focus
//
//  Created by Ya Cheng on 5/18/21.
//

import SwiftUI

struct Rank: View {
    var body: some View {
        HStack{
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
            }        }
    }
}

struct Rank_Previews: PreviewProvider {
    static var previews: some View {
        Rank()
    }
}
