//
//  JSON_Normal.swift
//  JSON Swift Codable
//
//  Created by shiga on 22/01/20.
//  Copyright © 2020 shiga. All rights reserved.
//

import Foundation
import UIKit


// Normal Json Decoding

let json = """
{
"firstname": "suresh",
"lastname" : "shiga",
"age": 25
}
"""

struct Person: Decodable {
    let firstname: String
    let lastname: String
    let age: Int
    
    static func jsondecoder() {
        let data = Data(json.utf8)
        do {
            let jsonData = try JSONDecoder().decode(Person.self, from: data)
            print(jsonData)
        } catch  {
            print(error)

        }
        
    }
}


extension Person: CustomStringConvertible {
    var description: String {
        return "firstname: \(self.firstname) lastname: \(self.lastname), age: \(self.age)"
    }
}
