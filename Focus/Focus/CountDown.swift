//
//  SwiftUIView.swift
//  Focus
//
//  Created by Shiheng Wang on 5/7/21.
//
import SwiftUI

struct CountDown: View {
    @State private var hourStr = "0"
    @State private var minStr = "25"
    @State private var secStr = "0"
    @State private var hour: Int = 0
    @State private var min: Int = 0
    @State private var sec: Int = 0
    @State private var started: Bool = false
    @State private var showPopUp: Bool = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            VStack (spacing: 0) {
                HStack {
                    Spacer()
                    Text("Hour")
                        .padding(20)
                        .foregroundColor(Color.white)
                        .font(.system(size: 15))
                        .frame(width: UIScreen.main.bounds.size.width / 3)
                    Spacer()
                    Text("Minute")
                        .padding(20)
                        .foregroundColor(Color.white)
                        .font(.system(size: 15))
                        .frame(width: UIScreen.main.bounds.size.width / 3)
                    Spacer()
                    Text("Second")
                        .padding(20)
                        .foregroundColor(Color.white)
                        .font(.system(size: 15))
                        .frame(width: UIScreen.main.bounds.size.width / 3)
                    Spacer()
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                
                
                
                if (!started) {
                    HStack {
                        TextField("00", text: self.$hourStr)
                            .multilineTextAlignment(.trailing)
                            .padding(20)
                            .frame(width: 80, height: 50, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(65.5)
                        Text(":")
                        TextField("25", text: self.$minStr)
                            .multilineTextAlignment(.center)
                            .padding(20)
                            .frame(width: 80, height: 50, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(65.5)
                        Text(":")
                        TextField("00", text: self.$secStr)
                            .multilineTextAlignment(.leading)
                            .padding(20)
                            .frame(width: 80, height: 50, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(65.5)
                    }
                }
                else {
                    HStack {
                        Group {
                            Spacer()
                            Text(hourStr)
                                .font(.system(size: 25))
                            Spacer()
                            Text(":")
                                .font(.system(size: 25))
                            Spacer()
                            Text(minStr)
                                .font(.system(size: 25))
                        }
                        Group {
                            Spacer()
                            Text(":")
                                .font(.system(size: 25))
                            Spacer()
                            Text(secStr)
                                .font(.system(size: 25))
                            Spacer()
                        }
                    }
                }
                
                Spacer()
                
                Image("jerry")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                if (!started) {
                    Button(action: startCount) {
                        Text("Start")
                            .font(.system(size: 30, weight: .heavy, design:. default))
                            .foregroundColor(.white)
                    }
                    .frame(width: 150, height: 60, alignment: .center)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                              .cornerRadius(65.5)
                }
                else {
                    Button(action: stopCount) {
                        Text("Stop")
                            .font(.system(size: 30, weight: .heavy, design:. default))
                            .foregroundColor(.white)
                    }
                    .frame(width: 150, height: 60, alignment: .center)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(65.5)
                }
                
                Spacer()
            }
            .padding(.vertical, -20)
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
            PopUpWindow(title: "Sure to Exit?", message: "You will lose your progress if you exit now!", button1Text: "Keep up!", button2Text: "Exit", show: $showPopUp)
            
        }
     }
    
    func startCount() {
        started = true
        hour = Int(hourStr)!
        min = Int(minStr)!
    }
    
    func stopCount() {
        started = false
        if hourStr != "0" || minStr != "0" || secStr != "0" {
            showPopUp.toggle()
        }
    }
}
    

struct CountDown_Previews: PreviewProvider {
    static var previews: some View {
        CountDown()
    }
}
