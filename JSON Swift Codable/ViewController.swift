//
//  ViewController.swift
//  JSON Swift Codable
//
//  Created by shiga on 22/01/20.
//  Copyright © 2020 shiga. All rights reserved.
//https://medium.com/flawless-app-stories/complete-guide-to-codable-decodable-b1ff696da24f

import UIKit

// Normal Json Coding


let jsonString = """
{
"user": {
"first_name": "Dave",
"second_name": "Roberts"
},

"friends": [{
"id": "AA0123",
"first_name": "Jenny",
"second_name": "Williams"
},
{
"id": "B1235",
"first_name": "Jerry",
"second_name": "Mobley"
}]
}
"""

//Universal method

struct EasyUM:Decodable {
    var user: User
    var friends: [Friends]
}
struct Friends: Decodable {
    var id: String
    var first_name: String
    var second_name: String
}
struct User: Decodable {
    var first_name: String
    var second_name: String
}

// NestedStruct

struct NestedStructs: Decodable {
    var user: UserNested
    var friends: [FriendsNested]

    struct FriendsNested: Decodable {
        var id: String
        var first_name: String
        var second_name: String
    }
    
    struct UserNested: Decodable {
        var first_name: String
        var second_name: String
    }
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        // Json Normal Keys
        
    //   Person.jsondecoder()
        
        
        // Json Bad Key Naming
        
  //      PersonBad.jsonDecoder()
        
        // Json Bad Key Naming 2
        
   //     PersonBad2.jsonDecoder2()
        
        // Json Date Key Naming
        
   //     JsonDate.jsonDate()
        
        // Json Absence Key Value
        
       // AbsenceKeys.absenceJson()
        
        // Json one Key with defferent type values
        
       // MultiTypeKey.multiTypeKeyValues()
        
        //callQuoteResponse()

        PhotoFedd.jsonDecoder()
        
    }

    
    func callQuoteResponse() {
        let data = Data(quotesResponseJson.utf8)
        let decoder = JSONDecoder()
        do {
        let decodedResponse = try decoder.decode(QuotesResponse.self, from: data)
            print(decodedResponse)
        } catch  {
            
        }
        
        
    }
    
}




