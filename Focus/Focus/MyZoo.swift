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
                MyZooRowView(animal: "jerry", num: current.Zoo.jerry)
                MyZooRowView(animal: "kitty", num: current.Zoo.kitty)
                MyZooRowView(animal: "panda", num: current.Zoo.panda)
                MyZooRowView(animal: "pikachu", num: current.Zoo.pikachu)
                MyZooRowView(animal: "snoopy", num: current.Zoo.snoopy)
                MyZooRowView(animal: "tom", num: current.Zoo.tom)
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
