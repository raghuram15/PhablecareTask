//
//  Contac.swift
//  PhableCareTask
//
//  Created by Raghuram on 15/05/20.
//  Copyright © 2020 Raghuram. All rights reserved.
//

import Foundation
import RealmSwift

struct Contac {
    var name : String
    var phoneNum : String
    
     init(object:Contact) {
     
        self.name = object.name
        self.phoneNum = object.phoneNum
    }
}
