//
//  MyZoo.swift
//  Focus
//
//  Created by Ya Cheng on 5/18/21.
//

import SwiftUI

struct MyZoo: View {
    var body: some View {
        VStack {
            Text("MyZoo")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [Color(0xFD716A), Color(0xFED363)]), startPoint: .bottomLeading, endPoint: .topTrailing))
            
            List {
                MyZooRowView(animal: "jerry", num: 0)
                MyZooRowView(animal: "kitty", num: 0)
                MyZooRowView(animal: "panda", num: 0)
                MyZooRowView(animal: "pikachu", num: 0)
                MyZooRowView(animal: "snoopy", num: 0)
                MyZooRowView(animal: "tom", num: 0)
            }
            
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
        .padding(.top, -15)
    }
}

struct MyZoo_Previews: PreviewProvider {
    static var previews: some View {
        MyZoo()
    }
}
