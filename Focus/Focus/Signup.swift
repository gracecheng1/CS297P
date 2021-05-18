//
//  Signup.swift
//  Focus
//
//  Created by Ya Cheng on 5/7/21.
//
import SwiftUI

struct Signup: View {
    // MARK: - Propertiers
    @State private var id = ""
    @State private var tel = ""
    @State private var pw = ""
    @State private var pw2 = ""
   
      
    // MARK: - View
    var body: some View {
      VStack(spacing: 30) {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.heavy)
                HStack(){
                    Spacer()
    
                }
            }
    
                
            ColorTextField(image:"login-id",
                    placeholder: "User ID",
                    text: self.$id
                )
            
            
                
            ColorTextField(image:"signup-email",
                    placeholder: "Email",
                    text: self.$tel
                )
            
            
            
            HStack(){
        Image("login-pw")
            .resizable()
            .scaledToFit()
            .frame(height: 15)
                
                ColorSecureField(
                            placeholder: Text("Password").foregroundColor(Color(0x979797)),
                            text: self.$pw
                        ).padding(.all, 20)
            }.padding(.leading, 30.0).background(Color(0xF5F5F5))
            .cornerRadius(15)
            
            
            HStack(){
        Image("signup-lock")
            .resizable()
            .scaledToFit()
            .frame(height: 15)
                
                ColorSecureField(
                            placeholder: Text("Confirm Password").foregroundColor(Color(0x979797)),
                            text: self.$pw2
                        ).padding(.all, 20)
            }.padding(.leading, 30.0).background(Color(0xF5F5F5))
            .cornerRadius(15)

        }.padding(.horizontal, 35.0)

//        NavigationLink(destination: Signup_Verify()) {
//            FullwidthButton(text: "Next Step")
//       }
            NavigationLink(destination: Signup_Done().navigationBarHidden(true)) {
                FullwidthButton(text: "Next Step").navigationBarHidden(true)
                
           }

        HStack(){
        Text("Already have an account?")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundColor(Color(0xB1B1B1))
        
        NavigationLink(destination: Login().navigationBarHidden(true)) {
         Text("Login")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundColor(Color(0x7C7C7C))
            .underline()
            .navigationBarHidden(true)
            
        }
        }
        
        Spacer()
      }
        
    }
    }

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
