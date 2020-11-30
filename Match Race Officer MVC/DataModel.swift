//
//  DataModel.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 19.11.2020.
//

import UIKit

typealias PersonID = Int
typealias BoatID = Int

enum PersonGender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
}

enum portStarboard: String, CaseIterable {
    case port = "Port"
    case starboard = "Starboard"
}

enum MatchSide { case portSide, stbdSide }



typealias MatchID = Int
typealias TeamID = Int
typealias IFBoatID = String
typealias NOC = String
typealias EventGender = String

typealias CrewPosition = String

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
    var portSideTeam: TeamID
    var portSideBoat: BoatID
    var stbdSideTeam: TeamID
    var stbdSideBoat: BoatID
}

struct Flight {
    var matches: [Match]
}

struct EventStage {
    var flights: [Flight]
    var teams: [Team?]
    var boats: [Boat?]
    var markBoatChanges: Bool = false
    var name: String = ""
    func match(flight: Int, match: Int) -> Match? {
        return flight < flights.count && match < flights[flight].matches.count ? flights[flight].matches[match] : nil
    }

    func boat(index: Int) -> Boat? {
        return (boats.count > index && index >= 0) ? boats[index] : nil
    }
    func portSideBoatIndex(flight: Int, match: Int) -> Int {
        return self.match(flight: flight, match: match)?.portSideBoat ?? -1
    }
    func stbdSideBoatIndex(flight: Int, match: Int) -> Int {
        return self.match(flight: flight, match: match)?.stbdSideBoat ?? -1
    }
//    func portSideBoat(flight: Int, match: Int) -> Boat? {
//        return boat(index: portSideBoatIndex(flight: flight, match: match))
//    }
//    func stbdSideBoat(flight: Int, match: Int) -> Boat? {
//        return boat(index: stbdSideBoatIndex(flight: flight, match: match))
//    }
    func boatShortName(boatIndex: Int) -> String {
        if boatIndex < 0 {
            return ""
        }
        if let boat = (boatIndex < boats.count) ? boats[boatIndex] : nil {
            return boat.shortName
        } else {
            return "B\(boatIndex+1)"
        }
    }
    func team(index: Int) -> Team? {
        return (teams.count > index && index >= 0) ? teams[index] : nil
    }
    func teamIndex(flight: Int, match: Int, side: MatchSide) -> Int {
        if let m = self.match(flight: flight, match: match) {
            return side == .portSide ? m.portSideTeam : m.stbdSideTeam
        }
        return -1
    }
    func teamName(flight: Int, match: Int, side: MatchSide) -> String {
        let teamIndex = self.teamIndex(flight: flight, match: match, side: side)
        if teamIndex < 0 {
            return ""
        }
        let team = (teamIndex < teams.count) ? teams[teamIndex] : nil
        
        return team?.teamName ?? "Skipper \(teamIndex+1)"
        
    }
    
    
    func match(indexPath path: IndexPath) -> Match? {
        return match(flight: path.section, match: path.row)
    }
    func boatIndex(indexPath path: IndexPath, side: MatchSide) -> Int {
        if let m = self.match(indexPath: path) {
            return side == .portSide ? m.portSideBoat : m.stbdSideBoat
        }
        return -1
    }
    func teamIndex(indexPath path: IndexPath, side: MatchSide) -> Int {
        if let m = self.match(indexPath: path) {
            return side == .portSide ? m.portSideTeam : m.stbdSideTeam
        }
        return -1
    }
    func boatShortName(indexPath path: IndexPath, side: MatchSide) -> String {
        let boatIndex = self.boatIndex(indexPath: path,side: side)
        if boatIndex < 0 {
            return ""
        }
        let boat = (boatIndex < boats.count) ? boats[boatIndex] : nil
        return boat?.shortName ?? "B\(boatIndex+1)"
    }
    func teamName(indexPath path: IndexPath, side: MatchSide) -> String {
        let teamIndex = self.teamIndex(indexPath: path, side: side)
        if teamIndex < 0 {
            return ""
        }
        let team = (teamIndex < teams.count) ? teams[teamIndex] : nil
        return team?.teamName ?? "Skipper \(teamIndex+1)"
    }
    
    func teamNames(indexPath path: IndexPath) -> (String,String) {
        return (self.teamName(indexPath: path, side: .portSide),self.teamName(indexPath: path, side: .stbdSide))
    }
    
    func skipperHasChangedTheBoat(in match: Match, after flight: Flight) -> (Bool,Bool) {
    
        var portJustChanged = false
        var stbdJustChanged = false
    
        
        for previous in flight.matches {
            portJustChanged =
                portJustChanged ||
                ( match.portSideBoat == previous.portSideBoat && match.portSideTeam != previous.portSideTeam ) ||
                ( match.portSideBoat == previous.stbdSideBoat && match.portSideTeam != previous.stbdSideTeam )
            stbdJustChanged =
                stbdJustChanged ||
                ( match.stbdSideBoat == previous.portSideBoat && match.stbdSideTeam != previous.portSideTeam ) ||
                ( match.stbdSideBoat == previous.stbdSideBoat && match.stbdSideTeam != previous.stbdSideTeam )
        }
        return (portJustChanged,stbdJustChanged)
    }
    
    func skipperHasChangedTheBoat(indexPath path: IndexPath) -> (Bool,Bool) {
        if path.section > 0 {
            let match = self.flights[path.section].matches[path.row]
            let flight = self.flights[path.section-1]
            return skipperHasChangedTheBoat(in: match, after: flight)
        }
        return (false,false)
    }
}

let RoundRobin6S6B = EventStage(
    flights: [
        Flight(
            matches: [
                Match(portSideTeam: 1, portSideBoat: 0, stbdSideTeam: 2, stbdSideBoat: 1),
                Match(portSideTeam: 3, portSideBoat: 2, stbdSideTeam: 4, stbdSideBoat: 3),
                Match(portSideTeam: 5, portSideBoat: 4, stbdSideTeam: 6, stbdSideBoat: 5)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 1, portSideBoat: 0, stbdSideTeam: 4, stbdSideBoat: 3),
                Match(portSideTeam: 6, portSideBoat: 5, stbdSideTeam: 2, stbdSideBoat: 1),
                Match(portSideTeam: 5, portSideBoat: 4, stbdSideTeam: 3, stbdSideBoat: 2)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 6, portSideBoat: 5, stbdSideTeam: 1, stbdSideBoat: 0),
                Match(portSideTeam: 4, portSideBoat: 3, stbdSideTeam: 5, stbdSideBoat: 4),
                Match(portSideTeam: 3, portSideBoat: 2, stbdSideTeam: 2, stbdSideBoat: 1)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 5, portSideBoat: 4, stbdSideTeam: 1, stbdSideBoat: 0),
                Match(portSideTeam: 6, portSideBoat: 5, stbdSideTeam: 3, stbdSideBoat: 2),
                Match(portSideTeam: 2, portSideBoat: 1, stbdSideTeam: 4, stbdSideBoat: 3)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 1, portSideBoat: 0, stbdSideTeam: 3, stbdSideBoat: 2),
                Match(portSideTeam: 4, portSideBoat: 5, stbdSideTeam: 6, stbdSideBoat: 3),
                Match(portSideTeam: 2, portSideBoat: 1, stbdSideTeam: 5, stbdSideBoat: 4)
            ]
        )
    ],
    teams: [],
    boats: [
        Boat(shortName: "A", boatName: "Alpha"),
        Boat(shortName: "B", boatName: "Bravo"),
        Boat(shortName: "C", boatName: "Charlie"),
        Boat(shortName: "D", boatName: "Delta"),
        Boat(shortName: "E", boatName: "Echo"),
        Boat(shortName: "F", boatName: "Foxtrot")
    ]
)

let Finals = EventStage(
    flights: [
        Flight( // Flight 1
            matches: [
                Match(portSideTeam: 3, portSideBoat: 3, stbdSideTeam: 2, stbdSideBoat: 2),
                Match(portSideTeam: 1, portSideBoat: 1, stbdSideTeam: 0, stbdSideBoat: 0)
            ]
        ),
        Flight( // Flight 2 - Change boat and color
            matches: [
                Match(portSideTeam: 2, portSideBoat: 3, stbdSideTeam: 3, stbdSideBoat: 2),
                Match(portSideTeam: 0, portSideBoat: 1, stbdSideTeam: 1, stbdSideBoat: 0)
            ]
        ),
        Flight( // Flight 3 - Change color
            matches: [
                Match(portSideTeam: 3, portSideBoat: 2, stbdSideTeam: 2, stbdSideBoat: 3),
                Match(portSideTeam: 1, portSideBoat: 0, stbdSideTeam: 0, stbdSideBoat: 1)
            ]
        ),
        Flight( // Flight 4 - Change boat and color
            matches: [
                Match(portSideTeam: 0, portSideBoat: 0, stbdSideTeam: 1, stbdSideBoat: 1)
            ]
        ),
        Flight( // Flight 5 - Change color
            matches: [
                Match(portSideTeam: 1, portSideBoat: 1, stbdSideTeam: 0, stbdSideBoat: 0)
            ]
        )
    ],
    teams: [
        nil,
        Team(teamId: 1, boatId: nil, noc: nil, teamName: "Shapovalov", gender: nil, crew: []),
        nil,
        nil
    ],
    boats: [
        Boat(shortName: "A", boatName: "Alpha"),
        Boat(shortName: "B", boatName: "Bravo"),
        Boat(shortName: "C", boatName: "Charlie"),
        Boat(shortName: "D", boatName: "Delta")
    ],
    markBoatChanges: false,
    name: "Finals"
)

// Finals from: [9 S-6 B-1 RR]
let Finals3Fx2M = EventStage(
    flights: [
        Flight(
            matches: [
                Match(portSideTeam: 3, portSideBoat: 3, stbdSideTeam: 2, stbdSideBoat: 2),
                Match(portSideTeam: 1, portSideBoat: 1, stbdSideTeam: 0, stbdSideBoat: 0)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 2, portSideBoat: 2, stbdSideTeam: 3, stbdSideBoat: 3),
                Match(portSideTeam: 0, portSideBoat: 0, stbdSideTeam: 1, stbdSideBoat: 1)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 3, portSideBoat: 3, stbdSideTeam: 2, stbdSideBoat: 2),
                Match(portSideTeam: 1, portSideBoat: 1, stbdSideTeam: 0, stbdSideBoat: 0)
            ]
        )
    ],
    teams: [],
    boats: [
        Boat(shortName: "A", boatName: "Alpha"),
        Boat(shortName: "B", boatName: "Bravo"),
        Boat(shortName: "C", boatName: "Charlie"),
        Boat(shortName: "D", boatName: "Delta")
    ]
)
