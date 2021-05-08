//
//  SwiftUIView.swift
//  Focus
//
//  Created by Shiheng Wang on 5/7/21.
//

import SwiftUI

struct CountDown: View {
    @State private var hourStr = ""
    @State private var minStr = ""
    @State private var secStr = ""
    @State private var hour: Int = 0
    @State private var min: Int = 0
    @State private var sec: Int = 0
    @State private var started: Bool = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                Text("Hour")
                Text("Minute")
                Text("Second")
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: 100,
                   alignment: .topLeading)
            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            if (!started) {
                HStack {
                    TextField("hour", text: self.$hourStr)
                        .multilineTextAlignment(.trailing)
                        .padding(20)
                        .frame(width: 80, height: 50, alignment: .center)
                        .background(Color.gray)
                        .cornerRadius(65.5)
                    Text(":")
                    TextField("min", text: self.$minStr)
                        .multilineTextAlignment(.center)
                        .padding(20)
                        .frame(width: 80, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.gray)
                        .cornerRadius(65.5)
                    Text(":")
                    TextField("sec", text: self.$secStr)
                        .multilineTextAlignment(.leading)
                        .padding(20)
                        .frame(width: 80, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.gray)
                        .cornerRadius(65.5)
                }
            }
            else {
                Text(hourStr + ":" + minStr + ":" + secStr)
                    .padding(20)
                    .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            if (!started) {
                Button(action: startCount) {
                    Text("Start")
                        .foregroundColor(.white)
                }
                .frame(width: 100, height: 40, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                          .cornerRadius(65.5)
            }
            else {
                Button(action: stopCount) {
                    Text("Stop")
                        .foregroundColor(.white)
                }
                .frame(width: 100, height: 40, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                          .cornerRadius(65.5)
            }
        }
        .padding(.vertical, -200)
        .onReceive(timer) { time in
            if (!started) {return}
            if self.sec > 0 {
                self.sec -= 1
            }
            else if self.min > 0 {
                self.sec = 59
                self.min -= 1
            }
            else if self.hour > 0 {
                self.sec = 59
                self.min = 59
                self.hour -= 1
            }
            else {
                // Count is done
                self.sec = 0
                self.min = 0
                self.hour = 0
            }
            hourStr = String(hour)
            minStr = String(min)
            secStr = String(sec)
        }
     }
    
    func startCount() {
        started = true
        hour = Int(hourStr)!
        min = Int(minStr)!
    }
    
    func stopCount() {
        started = false
    }
}

struct CountDown_Previews: PreviewProvider {
    static var previews: some View {
        CountDown()
    }
}
