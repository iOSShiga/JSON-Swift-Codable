//
//  JSON_Dates_Key.swift
//  JSON Swift Codable
//
//  Created by shiga on 22/01/20.
//  Copyright © 2020 shiga. All rights reserved.
//

import Foundation

let jsonDateData = """
{
"title": "India",
"date": "2019-10-21T09:15:00Z"
}
"""

struct JsonDate: Codable {
    let title: String
    let date: Date
    
    
    static func jsonDate() {
        
        let jsonData = Data(jsonDateData.utf8)
        
        let decoder = JSONDecoder()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        do {
            let json = try decoder.decode(JsonDate.self, from: jsonData)
            print(json)
        } catch  {
            print(error)

        }
        
    }
    
}
