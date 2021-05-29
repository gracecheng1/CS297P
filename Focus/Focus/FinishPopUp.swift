//
//  FinishPopUp.swift
//  Focus
//
//  Created by Shiheng Wang on 5/28/21.
//

import SwiftUI

struct FinishPopUp: View {
    @Binding var show: Bool

    var body: some View {
        ZStack {
            if show {
                // PopUp background color
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)

                // PopUp Window
                VStack(alignment: .center, spacing: 0) {
                    Text("Congratulation!")
                        .frame(maxWidth: .infinity)
                        .frame(height: 45, alignment: .center)
                        .font(Font.system(size: 23, weight: .semibold))
                        .foregroundColor(Color.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))

                    Text("You have finished this round! Take a break!")
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: 16, weight: .semibold))
                        .padding(EdgeInsets(top: 20, leading: 25, bottom: 20, trailing: 25))
                        .foregroundColor(Color.black)

                    HStack {
                        Button(action: {
                            // Dismiss the PopUp
                            withAnimation(.linear(duration: 0.3)) {
                                show = false
                            }
                        }, label: {
                            Text("Okey Dokey!")
                                .frame(width: 108, height: 40, alignment: .center)
                                .foregroundColor(Color.white)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                                .font(Font.system(size: 15, weight: .semibold))
                        })
                        .buttonStyle(PlainButtonStyle())
                        .cornerRadius(65.5)
                    }
                }
                .frame(maxWidth: 300)
                .background(Color.white)
                .cornerRadius(20.0)
            }
        }
    }
}

//struct FinishPopUp_Previews: PreviewProvider {
//    static var previews: some View {
//        FinishPopUp()
//    }
//}
