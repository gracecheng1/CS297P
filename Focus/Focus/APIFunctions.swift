//
//  APIFunctions.swift
//  Focus
//
//  Created by Frank chen on 5/18/21.
//

import Foundation
import Alamofire

struct current_user: Decodable{
    var User: String
    var _id: String
    var Password: String
    var Email: String
}

class APIFunctions{
    
    static let functions = APIFunctions()
    
    func addUser(User: String, Password: String, Email: String){
        
        AF.request("http://192.168.80.241:8081/create", method: .post, encoding: URLEncoding.httpBody, headers: ["User": User, "Password": Password, "Email": Email]).responseJSON{
            response in
            print(response)
        }
        
    }
    
    func login(User:String, Password: String)
    {
        AF.request("http://192.168.80.241:8081/login", method: .post,encoding: URLEncoding.httpBody, headers: ["User":User, "Password": Password]).responseJSON{
            response in
            switch response.result
            {
            case.success(_):
                let json = response.data
                let current : current_user = try! JSONDecoder().decode(current_user.self, from: json!);
                let data = String(data: response.data!, encoding: .utf8)

            case.failure(let error):
                print(error)
            }
        }
        
    }
    
    func updateUser(User:String, Password: String, id:String)
    {
        AF.request("http://192.168.80.241:8081/update", method: .post,encoding: URLEncoding.httpBody, headers: ["User":User, "Password": Password, "id":id]).responseJSON{
            response in
            print(response)
        }
    }
    
    func deleteUser(id:String){
        AF.request("http://192.168.80.241:8081/delete", method:.post, encoding: URLEncoding.httpBody, headers:["id":id]).responseJSON{
            response in
            print(response)
        }
    }
    
    
}
