//
//  MyZoo.swift
//  Focus
//
//  Created by Ya Cheng on 5/18/21.
//

import SwiftUI

struct MyZoo: View {
    var body: some View {
        HStack{
            Spacer()
            NavigationLink(destination: CountDown().navigationBarHidden(true)) {
                EmptyTab(current:"Study")
            }
            Spacer()
                CurrentTab(current:"MyZoo")
            
            Spacer()
            NavigationLink(destination: Rank().navigationBarHidden(true)) {
            EmptyTab(current:"Rank")
            }
            Spacer()
            NavigationLink(destination: History().navigationBarHidden(true)) {
            EmptyTab(current:"History")
            }
        }
    }
}

struct MyZoo_Previews: PreviewProvider {
    static var previews: some View {
        MyZoo()
    }
}
