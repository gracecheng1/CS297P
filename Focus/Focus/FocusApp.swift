//
//  FocusApp.swift
//  Focus
//
//  Created by Shiheng Wang on 4/19/21.
//

import SwiftUI
prefix operator ⋮
prefix func ⋮(hex:UInt32) -> Color {
    return Color(hex)
}

extension Color {
    init(_ hex: UInt32, opacity:Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

let hexColor:(UInt32) -> (Color) = {
    return Color($0)
}

struct FullwidthButton: View {
    let text: String
    
    var body: some View {
        Text(text)
          .font(.headline)
          .fontWeight(.heavy)
          .foregroundColor(.white)
          .padding()
          .frame(width: 230, height: 50)
          .background(LinearGradient(gradient: Gradient(colors: [Color(0xFD716A), Color(0xFED363)]), startPoint: .bottomLeading, endPoint: .topTrailing))
            .cornerRadius(65.5)
    }
}

struct ColorTextField: View {
    var image: String
    var placeholder: String
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        
        HStack(){
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 20)
                    
            ZStack(alignment: .leading) {
                if text.isEmpty { Text(placeholder).foregroundColor(Color(0x979797))}
                TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
            }.padding(.all, 20)
            
        }.padding(.leading, 30.0).background(Color(0xF5F5F5))
        .cornerRadius(15)
    }
}

struct ColorSecureField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            SecureField("", text: $text, onCommit: commit)
        }
    }
}
@main
struct FocusApp: App {
    var body: some Scene {
        WindowGroup {
            Login()
        }
    }
}
