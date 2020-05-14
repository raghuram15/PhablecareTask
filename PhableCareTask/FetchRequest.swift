//
//  FetchRequest.swift
//  PhableCareTask
//
//  Created by Raghuram on 14/05/20.
//  Copyright © 2020 Raghuram. All rights reserved.
//

import Foundation

import RealmSwift

struct FetchRequest<Model, realmObject: Object> {
    
    let predicate: NSPredicate?
    let sortDescriptors: [SortDescriptor]
    let transformer: (Results<realmObject>) -> Model
}

extension SortDescriptor {
    
    static let name = SortDescriptor(keyPath: "name", ascending: true)
}
