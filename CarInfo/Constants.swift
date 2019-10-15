//
//  Constants.swift
//  CarInfo
//
//  Created by Maks on 14/10/2019.
//  Copyright © 2019 Maks. All rights reserved.
//

import Foundation

enum BodyType: String, CaseIterable {
    case sedan = "Sedan"
    case coupe = "Coupe"
    case hatchback = "Hatchback"
    case minivan = "Minivan"
    case truck = "Truck"
    case stationWagon = "Station Wagon"
    case convertible = "Convertible"
    
    static var cases: [String] {
        return BodyType.allCases.map {$0.rawValue}
    }
}


