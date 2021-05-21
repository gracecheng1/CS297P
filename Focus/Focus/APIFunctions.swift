//
//  APIFunctions.swift
//  Focus
//
//  Created by Frank chen on 5/18/21.
//

import Foundation
import Alamofire
import SwiftyJSON

struct animals: Decodable{
    var jerry : Int
    var kitty : Int
    var panda: Int
    var pikachu: Int
    var snoopy: Int
    var tom: Int
}

struct current_user: Decodable{
    var User: String
    var _id: String
    var Password: String
    var Email: String
    var Total_time: Int
    var Zoo: animals
    
    //init(json: [String: Any]){
      //  User = json["User"] as? String ?? "-1"
        //_id = json["_id"] as? String ?? "-1"
        //Password = json["Password"] as? String ?? "-1"
        //Email = json["Email"] as? String ?? "-1"
        //Total_time = json["Total_time"] as? Int ?? 0
        //zoo = json["zoo"] as? JSON ?? []
    //}
}

class APIFunctions{
    
    static let functions = APIFunctions()
    
    func addUser(User: String, Password: String, Email: String){
        
        AF.request("http://192.168.80.241:8081/create", method: .post, encoding: URLEncoding.httpBody, headers: ["User": User, "Password": Password, "Email": Email]).responseJSON{
            response in
            print(response)
        }
        
    }
    
    func updateUser(total_time: String, id:String, zoo:String)
    {
        AF.request("http://192.168.80.241:8081/update", method: .post,encoding: URLEncoding.httpBody, headers: ["total_time": total_time, "id":id, "zoo": zoo]).responseJSON{
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
