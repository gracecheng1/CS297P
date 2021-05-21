//  ExitAlertPopUp.swift
//  Focus
//
//  Created by Shiheng Wang on 5/7/21.
//

import SwiftUI

struct PopUpWindow: View {
    var title: String
    var message: String
    var button1Text: String
    var button2Text: String?
    @Binding var show: Bool
    @Binding var button1Tapped: Bool
    @Binding var button2Tapped: Bool
    var b2Action: ()->()

    var body: some View {
        ZStack {
            if show {
                // PopUp background color
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)

                // PopUp Window
                VStack(alignment: .center, spacing: 0) {
                    Text(title)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45, alignment: .center)
                        .font(Font.system(size: 23, weight: .semibold))
                        .foregroundColor(Color.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))

                    Text(message)
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: 16, weight: .semibold))
                        .padding(EdgeInsets(top: 20, leading: 25, bottom: 20, trailing: 25))
                        .foregroundColor(Color.black)

                    HStack {
                        Button(action: {
                            // Dismiss the PopUp
                            withAnimation(.linear(duration: 0.3)) {
                                button1Tapped = false
                                show = false
                            }
                        }, label: {
                            Text(button1Text)
                                .frame(width: 108, height: 40, alignment: .center)
                                .foregroundColor(Color.white)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                                .font(Font.system(size: 23, weight: .semibold))
                        })
                        .buttonStyle(PlainButtonStyle())
                        .cornerRadius(65.5)
                        
                        
                        if button2Text != nil {
                            Button(action: {
                                // Dismiss the PopUp
                                withAnimation(.linear(duration: 0.3)) {
                                    button2Tapped = false
                                    b2Action()
                                    show = false
                                }
                            }, label: {
                                Text(button2Text!)
                                    .frame(width: 108, height: 40, alignment: .center)
                                    .foregroundColor(Color.white)
                                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                                    .font(Font.system(size: 23, weight: .semibold))
                            })
                            .buttonStyle(PlainButtonStyle())
                            .cornerRadius(65.5)
                        }
                    }
                }
                .frame(maxWidth: 300)
                .background(Color.white)
                .cornerRadius(20.0)
            }
        }
    }
}
