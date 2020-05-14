//
//  Database.swift
//  PhableCareTask
//
//  Created by Raghuram on 14/05/20.
//  Copyright © 2020 Raghuram. All rights reserved.
//

import Foundation
import RealmSwift

class Database {
    
    private let realm: Realm
    
    init(realm: Realm = try! Realm()) {
        self.realm = realm
    }
    
    func fetch<Model, RealmObject: Object>(with predicate: NSPredicate?, sortDescriptors: [SortDescriptor], transformer: (Results<RealmObject>) -> Model) -> Model {
        var results = realm.objects(RealmObject.self)

        if let predicate = predicate {
            results = results.filter(predicate)
        }

        if sortDescriptors.count > 0 {
            results = results.sorted(by: sortDescriptors)
        }

        return transformer(results)
    }
}
