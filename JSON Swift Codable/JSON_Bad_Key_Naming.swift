//
//  JSON_Bad_Key_Naming.swift
//  JSON Swift Codable
//
//  Created by shiga on 22/01/20.
//  Copyright © 2020 shiga. All rights reserved.
//

import Foundation
import UIKit

let json_badKeys = """
{
"first_name": "suresh",
"last_name": "shiga",
"age": 28
}
"""

struct PersonBad: Codable {
    let firstname: String
    let lastname: String
    let age: Int
    
    enum CodingKeys: String, CodingKey {
        case firstname = "first_name"
        case lastname  = "last_name"
        case age
    }
    
    static func jsonDecoder() {
        let jsonData = Data(json_badKeys.utf8)
        do {
            let json = try JSONDecoder().decode(PersonBad.self, from: jsonData)
            print(json)
        } catch  {
            print(error)

        }
    }
}
