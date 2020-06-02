//
//  ViewController.swift
//  JSON Swift Codable
//
//  Created by shiga on 22/01/20.
//  Copyright © 2020 shiga. All rights reserved.
//https://medium.com/flawless-app-stories/complete-guide-to-codable-decodable-b1ff696da24f

import UIKit

// Normal Json Coding



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




