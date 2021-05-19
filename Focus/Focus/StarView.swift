//
//  StarView.swift
//  Focus
//
//  Created by Shiheng Wang on 5/18/21.
//

import SwiftUI

struct StarView: View {
    var isSet: Bool
    
    var body: some View {
        Image(systemName: isSet ? "star.fill" : "star")
            .foregroundColor(isSet ? Color(0xFD716A) : Color.white)
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView(isSet: true)
    }
}
