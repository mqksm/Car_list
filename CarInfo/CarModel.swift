 //
//  CarModel.swift
//  CarInfo
//
//  Created by Maks on 13/10/2019.
//  Copyright © 2019 Maks. All rights reserved.
//

import RealmSwift

 class Car: Object {
    
    @objc dynamic var brand: String = ""
    @objc dynamic var year: String = ""
    @objc dynamic var model: String = ""
    @objc dynamic var body: String = ""
    @objc dynamic var color: String = ""

    convenience init(brand: String, year: String, model: String, body: String, color: String){
        self.init()
        self.brand = brand
        self.year = year
        self.model = model
        self.body = body
        self.color = color
    }
 }
