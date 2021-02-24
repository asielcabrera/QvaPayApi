//
//  File.swift
//  
//
//  Created by Asiel Cabrera on 1/14/21.
//

import Foundation

public struct InfoData: Codable {
    
    
       public let userID: Int
       public let name: String
       public let url: String
       public let desc: String
       public let callback: String
       public let logo: String
       public let uuid: String
       public let secret: String
       public let active: Int
       public let enabled: Int

       enum CodingKeys: String, CodingKey {
           case userID = "user_id"
           case name = "name"
           case url = "url"
           case desc = "desc"
           case callback = "callback"
           case logo = "logo"
           case uuid = "uuid"
           case secret = "secret"
           case active = "active"
           case enabled = "enabled"
       }

       public init(userID: Int, name: String, url: String, desc: String, callback: String, logo: String, uuid: String, secret: String, active: Int, enabled: Int) {
           self.userID = userID
           self.name = name
           self.url = url
           self.desc = desc
           self.callback = callback
           self.logo = logo
           self.uuid = uuid
           self.secret = secret
           self.active = active
           self.enabled = enabled
       }
}
