//
//  FactAPI.swift
//  PersistenceTutorial
//
//  Created by Sky on 9/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

struct FactAPI {
    
    // stored property
    let base = "https://cat-fact.herokuapp.com/"
    let facts = "/facts"
    let users = "users"
    
    //computed property
    var getUrl: URL ? {
    return URL(string: base + facts)
    }
}
