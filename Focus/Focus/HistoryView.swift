//
//  HistoryView.swift
//  Focus
//
//  Created by Shiheng Wang on 5/18/21.
//

import SwiftUI

struct HistoryView: View {
    @State private var date = Date()
    @State private var focusTime = "No study at this date!"
    
    var body: some View {
        VStack {
            Text("History")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [Color(0xFD716A), Color(0xFED363)]), startPoint: .bottomLeading, endPoint: .topTrailing))
            Spacer()
            DatePicker("Start Date",
                       selection: $date,
                       displayedComponents: [.date])
                .datePickerStyle(GraphicalDatePickerStyle())
            Spacer()
            Text(focusTime)
            Spacer()
        }
        .padding(.top, -15)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
