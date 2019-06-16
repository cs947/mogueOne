//
//  BoredApi.swift
//  Affix
//
//  Created by Kenny Kim on 6/15/19.
//  Copyright © 2019 Fujia Ren. All rights reserved.
//

import Foundation
import Alamofire

static class BoredApi{
    func call(parameters:Parameters){
        //Parameters are like: let parameters: Parameters = ["test": "123"]
        Alamofire.request(
            URL(string: "http://www.boredapi.com/api/activity")!,
            parameters: parameters,
            encoding: URLEncoding(destination: .queryString)
            )
            .validate()
            .response { (response) in
                print("Request: \(String(describing: response.request) )")
                print("Response: \(response.response)")
                print("Error: \(response.error)")
                
                if let data = response.data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                    } catch {
                        print("Error: ", error)
                    }
                }
        }
    }
}
