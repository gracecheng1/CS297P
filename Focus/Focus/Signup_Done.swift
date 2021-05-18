//
//  Signup_Done.swift
//  Focus
//
//  Created by Ya Cheng on 5/10/21.
//

import SwiftUI

struct Signup_Done: View {
    var body: some View {
      VStack() {
        VStack(spacing: 40) {
            VStack(alignment: .leading) {
            Text("Congrats!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                HStack(){
                    Spacer()
                }
            }

            Image("signup-done")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("Your acoount was successfully created!")
                .font(.system(size: 12))
                .fontWeight(.semibold)
                .foregroundColor(Color(0x606060))
            
            NavigationLink(destination: Login().navigationBarHidden(true)) {
                FullwidthButton(text: "Login Now").navigationBarHidden(true)
           }

        }
        .padding(.horizontal, 35.0)

        Spacer()
      }
        
    }
    
}

struct Signup_Done_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Signup_Done()
          
        }
    }
}
