//
//  TimerInputField.swift
//  Focus
//
//  Created by Shiheng Wang on 5/17/21.
//

import SwiftUI

struct TimerInputField: View {
    var placeholder: String
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack {
            if text.isEmpty { Text(placeholder).foregroundColor(Color(0x979797))}
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                .multilineTextAlignment(.center)
        }
        .frame(width: 100, height: 50, alignment: .center)
        .background(Color(0xF5F5F5))
        .cornerRadius(15)
    }
}

struct LeftTimeField: View {
    @Binding var time: String
    var body: some View {
        ZStack {
            Text(time)
                .multilineTextAlignment(.center)
        }
        .frame(width: 100, height: 50, alignment: .center)
        .background(Color(0xF5F5F5))
        .cornerRadius(15)
    }
}

//struct TimerInputField_Previews: PreviewProvider {
//    @State var time = ""
//    
//    static var previews: some View {
//        TimerInputField(placeholder: "00", text: $time)
//    }
//}
