//
//  Fact.swift
//  PersistenceTutorial
//
//  Created by Sky on 9/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

struct FactResponse: Decodable {
    let all: [Fact]
}

class Fact: Decodable {
    let id: String
    let text: String
    let type: String
    let upvotes: Int
    
    
    //MARK: CodingkEY - allow custom naming conventions for decoding JSON keys
    // the variable must exactly the same in json file. If we want to change, we could
    // do in this way
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case information = "text"
        case type
        case upvotes
    }
    
    init(from core: CoreFact) {
        self.id = core.id!
        self.information = core.info!
        self.type = "cat"
        self.upvotes = int(core.upvotes)
    }
}

// search youtube to know what is hashable in swift
extension Fact: Hashable {
    static func == (lhs: Fact, rhs: Fact ) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout ){
        
    }
}
