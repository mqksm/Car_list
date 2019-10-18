//
//  StorageManager.swift
//  CarInfo
//
//  Created by Maks on 15/10/2019.
//  Copyright © 2019 Maks. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager{
    
    static func saveObject(_ car: Car) {
        try! realm.write {
            realm.add(car)
        }
    }
    
    static func deleteObject(_ car: Car) {
        try! realm.write {
            realm.delete(car)
        }
    }
    
//    static func
}
