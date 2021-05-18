//
//  BottomTab.swift
//  Focus
//
//  Created by Ya Cheng on 5/17/21.
//

import SwiftUI

struct CurrentTab: View {
    var current:String
    var body: some View {
            //Spacer()
            Text(current)
                .font(.headline)
                .fontWeight(.heavy)
                .frame(width: 90, height: 50, alignment: .center)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color(0xFD716A), Color(0xFED363)]), startPoint: .bottomLeading, endPoint: .topTrailing))
                  .cornerRadius(65.5)
    }
}

struct EmptyTab: View {
    var current:String
    var body: some View {
            //Spacer()
            Text(current)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .frame(width: 100, height: 50, alignment: .center)
                .background(Color(0xF5F5F5))
                  .cornerRadius(65.5)
    }
}

struct BottomTab_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            Spacer()
            CurrentTab(current:"History")
            Spacer()
            EmptyTab(current:"History")
            Spacer()
            EmptyTab(current:"History")
            Spacer()
            EmptyTab(current:"History")
        }
    }
}
