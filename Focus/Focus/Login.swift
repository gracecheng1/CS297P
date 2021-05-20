//
//  Login.swift
//  Focus
//
//  Created by Ya Cheng on 5/7/21.
//

import SwiftUI
import Alamofire

var current = current_user(User: "", _id: "", Password: "", Email: "NULL")

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
        VStack(alignment: .center, spacing: 20) {
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
        NavigationLink(destination: CountDown()//.navigationBarHidden(true)
                ) {
                    FullwidthButton(text: "Login").navigationBarHidden(true)
                
                }.simultaneousGesture(TapGesture().onEnded{
                    while(current.Email == "NULL")
                    {
                        login_now(User: self.id, Password: self.password)
                        print(current.Email)
                        print("hello")
                        Text("Password is wrong")
                    }
                })
        HStack(){
        Text("Not a member yet?")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundColor(Color(0xB1B1B1))
        
        NavigationLink(destination: Signup().navigationBarHidden(true)) {
         Text("Sign up")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundColor(Color(0x7C7C7C))
            .underline()}
            .navigationBarBackButtonHidden(true)
            
        }
        Spacer()
      }.navigationBarBackButtonHidden(true)
        }.navigationBarBackButtonHidden(true)
    }
    }

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

func login_now(User:String, Password: String) //-> current_user
{
    //var current = current_user(User: "", _id: "", Password: "", Email: "NULL")
    
    AF.request("http://192.168.80.241:8081/login", method: .post,encoding: URLEncoding.httpBody, headers: ["User":User, "Password": Password]).responseJSON{
        response in
        switch response.result
        {
        case.success(_):
            let json = response.data
            current = try! JSONDecoder().decode(current_user.self, from: json!);
            print(current.Email)
        case.failure(let error):
            print(error)
        }
    }
    //return current
    
}
