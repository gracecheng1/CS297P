//
//  MyZooRowView.swift
//  Focus
//
//  Created by Shiheng Wang on 5/18/21.
//

import SwiftUI

struct MyZooRowView: View {
    var animal: String
    var num: Int
    
    var body: some View {
        HStack {
            Image(animal)
                .resizable()
                .frame(width: 70, height: 70)
            Text(" x " + String(num))
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
        }
    }
}

struct MyZooRowView_Previews: PreviewProvider {
    static var previews: some View {
        MyZooRowView(animal: "jerry", num: 1)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
