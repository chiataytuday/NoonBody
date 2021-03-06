//
//  User_Class.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/25.
//

import Foundation
import SwiftUI

//In global environment we need to store the users document.doc
//to be the value of a new property in the user structure
//-> this will be later used to create colletions and paths
class user : NSObject, Identifiable, NSCoding {
    var id = UUID()
    var establishedID: String
    var username: String
    var password: String
    var name: String
    var email: String
    var publishedNoonBodys:[String] = []
    var publishedDiets:[String] = []
    
    init(username:String, password:String, name:String, email:String, publishedNoonBodys: [String], publishedDiets: [String], _ establishedID:String?){
        self.username = username
        self.password = password
        self.name = name
        self.email = email
        self.publishedNoonBodys = publishedNoonBodys
        self.publishedDiets = publishedDiets
        
        if let establishedID = establishedID{    //not nil
            self.establishedID = establishedID
        }else{
            self.establishedID = id.uuidString
        }
    }
    
    required init(coder aDecoder: NSCoder){
        id = aDecoder.decodeObject(forKey: "id") as? UUID ?? UUID()
        establishedID = aDecoder.decodeObject(forKey: "establishedID") as? String ?? ""
        username = aDecoder.decodeObject(forKey: "username") as? String ?? ""
        password = aDecoder.decodeObject(forKey: "password") as? String ?? ""
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        email = aDecoder.decodeObject(forKey: "email") as? String ?? ""
        publishedNoonBodys = aDecoder.decodeObject(forKey: "publishedNoonBodys") as? [String] ?? []
        publishedDiets = aDecoder.decodeObject(forKey: "publishedDiets") as? [String] ?? []
        
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(establishedID, forKey: "establishedID")
        aCoder.encode(username, forKey: "username")
        aCoder.encode(password, forKey: "password")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(publishedNoonBodys, forKey: "publishedNoonBodys")
        aCoder.encode(publishedDiets, forKey: "publishedDiets")
    }
}

class GlobalEnvironment: ObservableObject{
    
    @Published var currentUser: user = user.init(username: "", password: "", name: "", email: "", publishedNoonBodys: [], publishedDiets: [], nil)
}
