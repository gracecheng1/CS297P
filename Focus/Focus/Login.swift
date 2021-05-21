//
//  Login.swift
//  Focus
//
//  Created by Ya Cheng on 5/7/21.
//

import SwiftUI
import Alamofire

var current = current_user(User: "", _id: "", Password: "", Email: "NULL", Total_time: 0, Zoo: animals(jerry: 0, kitty: 0, panda: 0, pikachu:0, snoopy:0, tom:0))

struct Login: View {
    @State var id = ""
    @State var password = ""
    @State private var isLoginValid: Bool = false
    @State private var shouldShowLoginAlert: Bool = false
    var body: some View {
        NavigationView {
            VStack() {
            Text("Welcome Back!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .scaledToFill()
            VStack(alignment: .center, spacing: 20) {
                Image("login")
                    .resizable()
                    .frame(width: 200.0, height: 200.0)

                ColorTextField(image:"login-id",
                        placeholder:"User ID",
                        text: $id
                    )
                HStack(){
                    Image("login-pw")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                    ColorSecureField(placeholder: Text("Password").foregroundColor(Color(0x979797)), text: self.$password)
                        .padding(.all, 20)
                    }.padding(.leading, 30.0).background(Color(0xF5F5F5))
                    .cornerRadius(15)
                }.padding(.horizontal, 35.0)
                Spacer()

            NavigationLink(destination: MainView().navigationBarHidden(true),isActive: self.$isLoginValid) {
                FullwidthButton(text: "Login")
                .onTapGesture {
                    login_now(User: self.id, Password: self.password, completion: {
                        if current.Email != "NULL"{
                            isLoginValid = true
                        }
                        if isLoginValid {
                          self.isLoginValid = true //trigger NavigationLink
                        }
                        else {
                          self.shouldShowLoginAlert = true //trigger Alert
                        }
                    })
                }
           }.navigationBarHidden(true)
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
            
            }.navigationBarHidden(true)
            Spacer()
            
      }.alert(isPresented: $shouldShowLoginAlert) {
        Alert(title: Text("Username/Password incorrect"))}
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

func login_now(User:String, Password: String, completion: @escaping () -> Void)
{
    AF.request("http://192.168.80.241:8081/login", method: .post,encoding: URLEncoding.httpBody, headers: ["User":User, "Password": Password]).responseJSON{
        response in
        switch response.result
        {
        case.success(_):
            guard let json = response.data else {return}
            current = try! JSONDecoder().decode(current_user.self, from: json)
            completion()
        case.failure(let error):
            print("error:",error)
            completion()
        }
        
    }
}
