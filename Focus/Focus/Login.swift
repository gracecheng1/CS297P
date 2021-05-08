//
//  Login.swift
//  Focus
//
//  Created by Ya Cheng on 5/7/21.
//

import SwiftUI

struct Login: View {
    @State var email = ""
    @State var password = ""
    
      
    var body: some View {
      VStack() {
 
        Text("Welcome Back!")
            .font(.largeTitle)
            .fontWeight(.heavy)
            
        
        VStack(alignment: .center, spacing: 15) {
            
            Image("login")
                .resizable()
                .aspectRatio(contentMode: .fit)

            HStack(){
        Image("login-id")
            .resizable()
            .scaledToFit()
            .frame(height: 20)

        ColorTextField(
                    placeholder: Text("User ID").foregroundColor(Color(0x979797)),
                    text: self.$email
                ).padding(.all, 20)
            }.padding(.leading, 30.0).background(Color(0xF5F5F5))
            .cornerRadius(15)
            
            
            HStack(){
        Image("login-pw")
            .resizable()
            .scaledToFit()
            .frame(height: 20)

                ColorSecureField(
                            placeholder: Text("Password").foregroundColor(Color(0x979797)),
                            text: self.$password
                        ).padding(.all, 20)
            }.padding(.leading, 30.0).background(Color(0xF5F5F5))
            .cornerRadius(15)
            
            Text("Forgot Password?")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(Color(0xB1B1B1))
                .padding(.trailing, 15.0)

        }.padding(.horizontal, 35.0)
        Spacer()
        
        Button(action: {}) {
          Text("Login")
            .font(.headline)
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .padding()
            .frame(width: 230, height: 50)
            .background(LinearGradient(gradient: Gradient(colors: [Color(0xFD716A), Color(0xFED363)]), startPoint: .bottomLeading, endPoint: .topTrailing))

            .cornerRadius(65.5)
        }

        HStack(){
        Text("Not a member yet?")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundColor(Color(0xB1B1B1))
        
//        NavigationLink(destination: Signup()) {
         Text("Sign up")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundColor(Color(0x7C7C7C))
            .underline()
            
        //}
        }
        Spacer()
      }
        
    }
}
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
