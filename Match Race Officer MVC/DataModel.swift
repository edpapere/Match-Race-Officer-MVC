//
//  DataModel.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 19.11.2020.
//

// import Foundation


typealias PersonID = Int

enum PersonGender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
}

enum portStarboard: String, CaseIterable {
    case port = "Port"
    case starboard = "Starboard"
}




typealias MatchID = Int
typealias TeamID = Int
typealias BoatID = Int
typealias IFBoatID = String
typealias NOC = String
typealias EventGender = String

typealias CrewPosition = String

struct Boat {
    var boatId: BoatID
    var ifBoatId: IFBoatID?
    var boatName: String?
    var sailNumber: String
}

struct Crew {
    var personId: PersonID?
    var position:  CrewPosition
}

struct Team {
    var teamId: TeamID
    var boatId: BoatID?
    var noc: NOC?
    var teamName: String?
    var gender: EventGender?
    var crew: [Crew]
}

struct Match {
    var matchId: MatchID
    var starboardTeam: TeamID
    var portTeam: TeamID
}
