//
//  History.swift
//  Focus
//
//  Created by Ya Cheng on 5/18/21.
//

import SwiftUI

struct History: View {
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
            NavigationLink(destination: Rank().navigationBarHidden(true)) {
            EmptyTab(current:"Rank")
            }
            Spacer()
            CurrentTab(current:"History")
        }
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
