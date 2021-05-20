//
//  Login.swift
//  Focus
//
//  Created by Ya Cheng on 5/7/21.
//

import SwiftUI
import Alamofire



struct Login: View {
    @State var id = ""
    @State var password = ""
    @State var current = current_user(User: "", _id: "", Password: "", Email: "NULL")
    
    @State private var isLoginValid: Bool = false
    @State private var shouldShowLoginAlert: Bool = false
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
            
//            NavigationLink(destination: Forget1()) {
//            Text("Forgot Password?")
//                .font(.footnote)
//                .fontWeight(.medium)
//                .foregroundColor(Color(0x7C7C7C))
//                .underline()
//                .padding(.trailing, 15.0)
//                .navigationBarHidden(true)
//            }


        }.padding(.horizontal, 35.0)
        Spacer()
//
//        Button(action: {
//            sessionSession.signIn(email: email, password: password)
//                }) {FullwidthButton(text: "Login")
//                }
//        NavigationLink(destination: CountDown()//.navigationBarHidden(true)
//                ) {
//                    FullwidthButton(text: "Login").navigationBarHidden(true)
//
//                }.simultaneousGesture(TapGesture().onEnded{
//                    while(current.Email == "NULL")
//                    {
//                        login_now(User: self.id, Password: self.password)
//                        print(current.Email)
//                        print("hello")
//                        Text("Password is wrong")
//                    }
//                })
        NavigationLink(destination: MainView()//.navigationBarHidden(true),
                       ,isActive: self.$isLoginValid) {
                /*
                 Here we put the content view of `NavigationLink`.
                 It could be any `View` even `Button` but in this
                 example we use a `Text` with `onTapGesture`.
                 */
                FullwidthButton(text: "Login").navigationBarHidden(true)
                    .onTapGesture {
                    //determine login validity
                    print(1)
               
                        AF.request("http://192.168.80.241:8081/login", method: .post,encoding: URLEncoding.httpBody, headers: ["User":self.id, "Password": self.password]).responseJSON{
                            response in
                            switch response.result
                            {
                           
                            case.success(_):
                                print(2)
                                let json = response.data
                                print(3)
                                current = try! JSONDecoder().decode(current_user.self, from: json!);
                                print("====",current.Email)
                            case.failure(let error):
                                print(4)
                                print("erro:",error)
                            }
                        }
                        
                    //login_now(User: self.id, Password: self.password)
                        print(5)
                        print(current.Email)
                        print(6)
                    if (current.Email != "NULL"){
                        isLoginValid = true
                        
                    }
                        
 
                    //trigger logic
                    if isLoginValid {
                      self.isLoginValid = true //trigger NavigationLink
                    }
                    else {
                      self.shouldShowLoginAlert = true //trigger Alert
                    }
                }.navigationBarHidden(true)
        }
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
            
      }.alert(isPresented: $shouldShowLoginAlert) {
        Alert(title: Text("Email/Password incorrect"))
      }
        }.navigationBarBackButtonHidden(true)
    }
    }

//struct Login_Previews: PreviewProvider {
//    static var previews: some View {
//        Login()
//    }
//}

//func login_now(User:String, Password: String) //-> current_user
//{
//    //var current = current_user(User: "", _id: "", Password: "", Email: "NULL")
//    print(2)
//    AF.request("http://192.168.80.241:8081/login", method: .post,encoding: URLEncoding.httpBody, headers: ["User":User, "Password": Password]).responseJSON{
//        response in
//        switch response.result
//        {
//        case.success(_):
//
//            let json = response.data
//            current = try! JSONDecoder().decode(current_user.self, from: json!);
//            print("====",current.Email)
//        case.failure(let error):
//            print("erro:",error)
//        }
//    }
//    print(3)
//    //return current
//
//}
