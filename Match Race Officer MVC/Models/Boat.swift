//
//  Boat.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 21.11.2020.
//

import Foundation

class Boat: Equatable {
    fileprivate static var nextId: BoatID = 1
    
    var boatId: BoatID
    var ifBoatId: String
    var boatName: String
    var shortName: String
    var sailNumber: String
    var isSpare: Bool
    
    init(ifBoatId: String, boatName: String, shortName: String, sailNumber: String, isSpare: Bool) {
        
        self.boatId = Boat.nextId
        Boat.nextId += 1
        
        self.ifBoatId = ifBoatId
        self.boatName = boatName
        self.shortName = shortName
        self.sailNumber = sailNumber
        self.isSpare = isSpare
        
    }
 
    init(shortName: String, boatName: String) {
        
        self.boatId = Boat.nextId
        Boat.nextId += 1
        
        self.ifBoatId = ""
        self.boatName = boatName
        self.shortName = shortName
        self.sailNumber = ""
        self.isSpare = false
        
    }

    init(ifBoatId: String, boatName: String, sailNumber: String) {
        
        self.boatId = Boat.nextId
        Boat.nextId += 1
        
        self.ifBoatId = ifBoatId
        self.boatName = boatName
        self.shortName = ""
        self.sailNumber = sailNumber
        self.isSpare = false
        
    }

    init(boatId: BoatID, ifBoatId: String, boatName: String, sailNumber: String) {
        
        self.boatId = boatId
        if boatId >= Boat.nextId {
            Boat.nextId = boatId + 1
        }
        
        self.ifBoatId = ifBoatId
        self.boatName = boatName
        self.shortName = ""
        self.isSpare = false
        self.sailNumber = sailNumber
        
    }
    
    func isEqualTo(ifBoatId: String, boatName: String, shortName: String, sailNumber: String, isSpare: Bool) -> Bool {
        let isEqual =
            self.ifBoatId == ifBoatId &&
            self.boatName == boatName &&
            self.shortName == shortName &&
            self.sailNumber == sailNumber &&
            self.isSpare == isSpare
        return isEqual
    }
    
    static func isProperlyDefined(ifBoatId: String, boatName: String, shortName: String, sailNumber: String, isSpare: Bool) -> Bool {
        let isDefined =
//            !boatName.isEmpty &&
            !shortName.isEmpty
        return isDefined
    }
    
    // Equatable
    static func == (lhs: Boat, rhs: Boat) -> Bool {
        let isEqual =
            lhs.ifBoatId.isEqual(rhs.ifBoatId) &&
            lhs.boatName.isEqual(rhs.boatName) &&
            lhs.shortName.isEqual(rhs.shortName) &&
            lhs.sailNumber.isEqual(rhs.sailNumber) &&
            lhs.isSpare == rhs.isSpare
        return isEqual
    }
    
}
