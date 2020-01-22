//
//  Same_Key_Type_Change.swift
//  JSON Swift Codable
//
//  Created by shiga on 22/01/20.
//  Copyright © 2020 shiga. All rights reserved.
//

import Foundation
import UIKit

let typeJsonData = """
[{
"first_name": "suresh",
"last_name": "shiga",
"age": "25",
"address": "B-Big Apple"
},
{
"first_name": "naveen",
"last_name": "gundu",
"age": 33,
"address" : "Versova-21"
}]

"""


struct MultiTypeKey: Codable {
    let firstName: String
    let lastName: String
    let age: VariacType
    let address: String
    
    static func multiTypeKeyValues() {
        
        let data = Data(typeJsonData.utf8)
        
        let jsonDecoder = JSONDecoder()
        
        do {
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let json = try jsonDecoder.decode([MultiTypeKey].self, from: data)
            print(json)
            
        } catch  {
            print(error)
        }
        
        
    }
}


enum VariacType:Codable {
    func encode(to encoder: Encoder) throws {}
    
    case int(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        if let intValue = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(intValue)
            return
        }
        if let stringValue = try? decoder.singleValueContainer().decode(String.self){
            self = .string(stringValue)
            return
        }
        throw VariacError.missingValue
    }
    
    enum VariacError: Error {
             case missingValue
         }
}

extension VariacType {
    var Value:String {
        switch self {
        case .int(let intvalue):
            return String(intvalue)
        case .string(let stringValue):
            return stringValue
        }
    }
    
}
