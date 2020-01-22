//
//  Absence_Key_Value.swift
//  JSON Swift Codable
//
//  Created by shiga on 22/01/20.
//  Copyright © 2020 shiga. All rights reserved.
//

import Foundation
import UIKit

let absenceJsonData = """
[{
"first_name": "suresh",
"last_name": "shiga",
"age": 25,
"address": null
},
{
"first_name": "naveen",
"last_name": "gundu",
"age": 33,
}]

"""

struct AbsenceKeys: Codable {
    let firstName: String
    let lastName: String
    let age: Int
    let addreess: String?
    
    
    static func absenceJson() {
        
        let data = Data(absenceJsonData.utf8)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let json = try decoder.decode([AbsenceKeys].self, from: data)
            print(json)
            
        } catch  {
            print(error)
        }
        
    }
}
