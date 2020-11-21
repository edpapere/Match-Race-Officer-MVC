//
//  Boat.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 21.11.2020.
//

import Foundation

class Boat {
    fileprivate static var nextId: BoatID = 1
    
    var boatId: BoatID
    var ifBoatId: String
    var boatName: String
    var sailNumber: String
    
    init(ifBoatId: String, boatName: String, sailNumber: String) {
        
        self.boatId = Boat.nextId
        Boat.nextId += 1
        
        self.ifBoatId = ifBoatId
        self.boatName = boatName
        self.sailNumber = sailNumber
        
    }

    init(boatId: BoatID, ifBoatId: String, boatName: String, sailNumber: String) {
        
        self.boatId = boatId
        if boatId >= Boat.nextId {
            Boat.nextId = boatId + 1
        }
        
        self.ifBoatId = ifBoatId
        self.boatName = boatName
        self.sailNumber = sailNumber
        
    }
}
