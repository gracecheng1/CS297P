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
    @State private var showChooseAnimal: Bool = false
    @State private var curRound = FocusRound()
    @State private var animal = "jerry"

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
                        .font(.title)
                    Spacer()
                    Text("Minute")
                        .padding(20)
                        .foregroundColor(Color.white)
                        .font(.system(size: 15))
                        .frame(width: UIScreen.main.bounds.size.width / 3)
                        .font(.title)
                    Spacer()
                    Text("Second")
                        .padding(20)
                        .foregroundColor(Color.white)
                        .font(.system(size: 15))
                        .frame(width: UIScreen.main.bounds.size.width / 3)
                        .font(.title)
                    Spacer()
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(0xFD716A), Color(0xFED363)]), startPoint: .bottomLeading, endPoint: .topTrailing))
                
                
                
                if (!started) {
                    HStack {
                        Group {
                            Spacer()
                            TimerInputField(placeholder: "00", text: $hourStr)
                            Spacer()
                            Text(":")
                        }
                        Spacer()
                        TimerInputField(placeholder: "00", text: $minStr)
                        Spacer()
                        Text(":")
                        Spacer()
                        TimerInputField(placeholder: "00", text: $secStr)
                        Spacer()
                    }
                }
                else {
                    HStack {
                        Group {
                            Spacer()
                            LeftTimeField(time: $hourStr)
                                .font(.system(size: 25))
                            Spacer()
                            Text(":")
                                .font(.system(size: 25))
                            Spacer()
                            LeftTimeField(time: $minStr)
                                .font(.system(size: 25))
                        }
                        Group {
                            Spacer()
                            Text(":")
                                .font(.system(size: 25))
                            Spacer()
                            LeftTimeField(time: $secStr)
                                .font(.system(size: 25))
                            Spacer()
                        }
                    }
                }
                
                Spacer()
                
                if (!started) {
                    Button(action: toggleChooseAnimal) {
                        Image(animal)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                else {
                    Image(animal)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                Spacer()
                
                if (!started) {
                    Button(action: startCount) {
                        FullwidthButton(text: "Start")
                    }
                }
                else {
                    Button(action: stopCount) {
                        FullwidthButton(text: "Stop")
                    }
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
                    started = false
                    curRound.finished()
                    // Update database here
                    
                    // reset object for next round
                    curRound.reset()
                }
                hourStr = String(hour)
                minStr = String(min)
                secStr = String(sec)
            }
            ChooseAnimalView(show: $showChooseAnimal, animal: $animal)
            PopUpWindow(title: "Sure to Exit?", message: "You will lose your progress if you exit now!", button1Text: "Keep up!", button2Text: "Exit", show: $showPopUp)
            
        }
     }
    
    func startCount() {
        started = true
        hour = Int(hourStr)!
        min = Int(minStr)!
        sec = Int(secStr)!
        curRound.setTime(time: min + hour * 60)
        curRound.setAnimal(animal: animal)
    }
    
    func stopCount() {
        started = false
        if hourStr != "0" || minStr != "0" || secStr != "0" {
            showPopUp.toggle()
        }
    }
    
    func toggleChooseAnimal() {
        showChooseAnimal = true
    }
}
    

struct CountDown_Previews: PreviewProvider {
    static var previews: some View {
        CountDown()
    }
}
