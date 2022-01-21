//
//  APICaller.swift
//  InnovaCurrencyConverterMVVM
//
//  Created by Appcent on 21.01.2022.
//

import Foundation

class APICaller {

    static let shared = APICaller()

    public func getAPI(success: @escaping (Currency?)->Void) {
        guard let url = URL(string: "http://data.fixer.io/api/latest?access_key=4a990ae1cc0ef5a920e4c7e9eeb1123c" ) else { return }

        let task = URLSession.shared.dataTask(with: url) { (Data, _, error) in
            if let error = error { success(nil) }
            else if let data = Data {
                do {
                    let result = try JSONDecoder().decode(Currency.self, from: data)
                     success(result)
                     print(result)
                 }
                 catch {
                     success(nil)
                 }
             }
         }
         task.resume()
     }

 }


