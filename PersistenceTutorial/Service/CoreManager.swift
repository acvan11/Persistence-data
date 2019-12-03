//
//  CoreManager.swift
//  PersistenceTutorial
//
//  Created by Sky on 9/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

//handle core data
// has just create PT model file

import CoreData

final class CoreManager {
    static let shared = CoreManager()
    private init() {}
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        var container = NSPersistentContainer(name: "PT")
        container.loadPersistentStores(completionHandler: { {storDescript, err} in
            if let error = err {
                fatalError(error.localizedDescription)
            }
        })
        return container
    }()
    
    //MARK: Save
    func save(_ fact: Fact) {
        let entity = NSEntityDescription.entity(forEntityName: "CoreFact", in: context)
        let core = CoreFact(entity: entity, insertInto: context)
        
        //KVC - Key Value cODING - access object property by String
        core.setValue(fact.id, forKey: "id")
        core.setValue(fact.information, forKey: "info")
        core.setValue(fact.upvotes, forKey: "upvotes")
        
        print("Saved Fact To Core: \(fact.id)")
        
        saveContext()
    }
    
    //MARK: Load
    func load() -> [Fact] {
        let fetchRequest = NSFetchRequest<CoreFact>(entityName: "CoreFact")
        var facts = [Fact]()
        
        do {
            let coreFacts = try context.fetch(fetchRequest)
            
        }
    }
    
    
    //MARK: DELETE
    func delete(_ fact: Fact) {
        let FetchRequest = NSFetchRequest<CoreFact>(entityName: "CoreFact")
        let predicate = NSPredicate(formate: "id==%@", fact.id)
        FetchRequest.predicate = predicate
        
        
        var factResult: [CoreFact]()
        do {
            factResult = try context.fetch(FetchRequest)
            guard let core = factResult.first else {
                return
            }
                context.delete(core)
                print("Deleted Fact From Core: \(fact.id)")
            
        } catch {
            print("Couldn't Fetch Fact: \(error.localizedDescription)")
        }
     
        saveContext()
    }
    
    //MARK: hELPERs
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

