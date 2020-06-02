//
//  Custom_Key.swift
//  JSON Swift Codable
//
//  Created by shiga on 02/06/20.
//  Copyright © 2020 shiga. All rights reserved.
//

import Foundation

let customJson =
"""
{"links":[{"youtube_feedKey" : "16869828","youtube_feedUrl" : "there is no url"},{"youtube_feedKey" : "16869828","youtube_feedUrl" : "there is no url"}]}
""".data(using: .utf8)


struct StringCodingKey: CodingKey {
    
    var stringValue: String
    var intValue: Int? {
        return nil
    }
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init?(intValue: Int) {
        return nil
    }
}


struct Links:Decodable {
    let links: [PhotoFedd]
}

struct PhotoFedd: Codable {
    let feedKey: String
    let feedUrl: String
    
  static  func jsonDecoder() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .custom({(keyArray) -> CodingKey in
            
            let key = keyArray.last!.stringValue.components(separatedBy: "_").last!
            
            return StringCodingKey(stringValue: key)!
        })
        
        let links = try!    decoder.decode(Links.self, from: customJson!)
        print(links)
        
    }
}
