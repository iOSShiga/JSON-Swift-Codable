//
//  DifficultResponse.swift
//  JSON Swift Codable
//
//  Created by shiga on 18/02/20.
//  Copyright © 2020 shiga. All rights reserved.
//

import Foundation

let quotesResponseJson = """

{
      "2020-01-17 10:55:00": {
            "1. open": "138.1700",
            "2. high": "138.2800",
            "3. low": "137.9700",
            "4. close": "138.0295",
            "5. volume": "135435"
      },
      "2020-01-17 10:50:00": {
            "1. open": "138.2650",
            "2. high": "138.2700",
            "3. low": "138.1300",
            "4. close": "138.1710",
            "5. volume": "79366"
      }
}

"""


struct Quote : Codable {
    var time: String
    var open: String
    var high: String
    var low: String
    var close: String
    var volume: String
    
}

struct QuotesResponse : Decodable {
    //This is our daynamic key structure
    struct QuotesKey : CodingKey {
        var stringValue: String
        init(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int? { return nil }
        init?(intValue: Int) { return nil }
        //we know what is "inside" this key (container)
        static let open = QuotesKey(stringValue: "1. open")
        static let high = QuotesKey(stringValue: "2. high")
        static let low = QuotesKey(stringValue: "3. low")
        static let close = QuotesKey(stringValue: "4. close")
        static let volume = QuotesKey(stringValue: "5. volume")
    }
    
    //This is what we want to have after decoding
    let quotes : [Quote]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: QuotesKey.self)
        var decodedQuotes: [Quote] = []
        //for each of the (nested) inner containers we build a Quote structure with the container key as the time property of the Quote
        //"allKeys here are the date keys
        for key in container.allKeys {
            let nested = try container.nestedContainer(keyedBy: QuotesKey.self, forKey: key)
            let open = try nested.decode(String.self, forKey: .open)
            let high = try nested.decode(String.self, forKey: .high)
            let low = try nested.decode(String.self, forKey: .low)
            let close = try nested.decode(String.self, forKey: .close)
            let volume = try nested.decode(String.self, forKey: .volume)
            //We build the a Quote structure one every iteration
            decodedQuotes.append(Quote(time: key.stringValue,
                                       open: open,
                                       high: high,
                                       low: low,
                                       close: close,
                                       volume: volume))
        }
        self.quotes = decodedQuotes
    }
}
