//
//  APIFunctions.swift
//  Focus
//
//  Created by Frank chen on 5/18/21.
//

import Foundation
import Alamofire
import SwiftyJSON

struct history_data: Decodable{
    var date: String
    var time: Int
}

struct animals: Decodable{
    var jerry : Int
    var kitty : Int
    var panda: Int
    var pikachu: Int
    var snoopy: Int
    var tom: Int
}

class current_user: Decodable, ObservableObject{
    var User: String = ""
    var _id: String = ""
    var Password: String = ""
    var Email: String = ""
    var Total_time: Int = 0
    var History: Dictionary<String, Int> = [:]
    @Published var Zoo: animals = animals(jerry: 0, kitty: 0, panda: 0, pikachu:0, snoopy:0, tom:0)
    
    enum  CodingKeys: CodingKey {
        case User, _id, Password, Email, Total_time, History, Zoo
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        User = try container.decode(String.self, forKey: .User)
        _id = try container.decode(String.self, forKey: ._id)
        Password = try container.decode(String.self, forKey: .Password)
        Email = try container.decode(String.self, forKey: .Email)
        Total_time = try container.decode(Int.self, forKey: .Total_time)
        History = try container.decode(Dictionary<String, Int>.self, forKey: .History)
        Zoo = try container.decode(animals.self, forKey: .Zoo)
    }
    
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
    
    func updateUser(total_time: String, id:String, zoo:String, history: String)
    {
        AF.request("http://192.168.80.241:8081/update", method: .post,encoding: URLEncoding.httpBody, headers: ["total_time": total_time, "id":id, "zoo": zoo, "history": history]).responseJSON{
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
