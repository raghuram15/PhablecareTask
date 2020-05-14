//
//  Contact.swift
//  PhableCareTask
//
//  Created by Raghuram on 13/05/20.
//  Copyright © 2020 Raghuram. All rights reserved.
//

import Foundation
import RealmSwift

class Contact: Object {
    
    @objc dynamic var name : String = ""
    @objc dynamic var phoneNum : String = ""
}
