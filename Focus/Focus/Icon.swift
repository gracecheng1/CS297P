//
//  Icon.swift
//  Focus
//
//  Created by Shiheng Wang on 5/10/21.
//

import SwiftUI

struct Icon: View {
    var body: some View {
        Image("F_Icon")
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
            .background(Color.black)
            .cornerRadius(30.0)
    }
}

struct Icon_Previews: PreviewProvider {
    static var previews: some View {
        Icon()
    }
}
