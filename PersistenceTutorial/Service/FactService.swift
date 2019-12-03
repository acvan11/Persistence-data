//
//  FactService.swift
//  PersistenceTutorial
//
//  Created by Sky on 9/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

let factService = FactService.shared
typealias FactHandler = ([Fact]) -> Void // a nickname for any type

final class FactService {
    
    static let shared = FactService()
    private init() {}
    
    // lazy - late init - only intialized once it is called
    lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10 // time out for request - 10 seconds
        return URLSession(configuration: config)
    }
    
    
    func getFacts(completion: @escaping FactHandler) {
        guard let url = FactAPI().getUrl else {
            completion([])
            return
        }
    
        session.dataTask(with: url) { (dat, _, err) in
            
            if let error = err {
                completion()
                print("Bad Data Task: \(error.localizedDescription)")
                return // exit scope
            }
            
            if let data = dat {
                do {
                let facts = try JSONDecoder().decode(FactResponse.self, from: data)// Decodable - does mapping for us
                completion(factResonse.all)
            } catch {
                completion([])
                print("Couldn't Decode Fact: \((error.localizedDescription))")
                return
            }
        }
        }.resume()
    }
}
