//
//  Login.swift
//  Focus
//
//  Created by Ya Cheng on 5/7/21.
//

import SwiftUI
struct Login: View {
    @State var id = ""
    @State var password = ""
    //@ObservedObject var sessionSession = SessionStore()
      
    var body: some View {
        NavigationView {
            
      VStack() {
 
        Text("Welcome Back!")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .scaledToFill()
            //.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            //.padding(.bottom, 100.0)
        VStack(alignment: .center, spacing: 10) {
            Image("login")
                .resizable()
                .frame(width: 200.0, height: 200.0)
                //.aspectRatio(contentMode: .fit)
 
            ColorTextField(image:"login-id",
                    placeholder:"User ID",
                    text: $id
                )
            
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
            
            NavigationLink(destination: Forget1()) {
            Text("Forgot Password?")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(Color(0x7C7C7C))
                .underline()
                .padding(.trailing, 15.0)
                .navigationBarHidden(true)
            }


        }.padding(.horizontal, 35.0)
        Spacer()
//        
//        Button(action: {
//            sessionSession.signIn(email: email, password: password)
//                }) {FullwidthButton(text: "Login")
//                }
        NavigationLink(destination: CountDown()) {
            FullwidthButton(text: "Login")
       }
        HStack(){
        Text("Not a member yet?")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundColor(Color(0xB1B1B1))
        
        NavigationLink(destination: Signup()) {
         Text("Sign up")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundColor(Color(0x7C7C7C))
            .underline()}
            .navigationBarHidden(true)
            
        }
        Spacer()
      }
        }
    }
    }

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
