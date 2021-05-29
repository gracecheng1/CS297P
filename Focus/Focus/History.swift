//
//  History.swift
//  Focus
//
//  Created by Ya Cheng on 5/18/21.
//

import SwiftUI

struct History: View {
    @State private var date = Date()
    @State private var focusTime = "You haven't study on this date!"
    let formatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
    @EnvironmentObject var current: current_user
    
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
                .accentColor(Color(0xFD9767))
            Spacer()
            if current.History[formatter.string(from: date)] != nil && current.History[formatter.string(from: date)] != 0 {
                Text("You have studied " + String(current.History[formatter.string(from: date)]!) + " minutes on this day")
            }
            else {
                Text(focusTime)
            }
            Spacer()
        }
        .padding(.top, -15)
    }
}

//struct History_Previews: PreviewProvider {
//    static var previews: some View {
//        History()
//    }
//}
