//
//  JSON_Bad_Key_Naming2.swift
//  JSON Swift Codable
//
//  Created by shiga on 22/01/20.
//  Copyright © 2020 shiga. All rights reserved.
//

import Foundation
import UIKit


let json_badKeys2 = """
{
"first_name": "suresh",
"last_name": "shiga",
"age": 28
}
"""

struct PersonBad2: Codable {
    let firstName: String
    let lastName: String
    let age: Int
    
//    enum CodingKeys: String, CodingKey {
//        case firstname = "first_name"
//        case lastname  = "last_name"
//        case age
//    }
    
    static func jsonDecoder2() {
        let jsonData = Data(json_badKeys2.utf8)
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let json = try jsonDecoder.decode(PersonBad2.self, from: jsonData)
            print(json)
        } catch  {
            print(error)

        }
    }
}
