//
//  DataModel.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 19.11.2020.
//

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
}

let RoundRobin6S6B = EventStage(
    flights: [
        Flight(
            matches: [
                Match(portSideTeam: 1, portSideBoat: 1, stbdSideTeam: 2, stbdSideBoat: 2),
                Match(portSideTeam: 3, portSideBoat: 3, stbdSideTeam: 4, stbdSideBoat: 4),
                Match(portSideTeam: 5, portSideBoat: 5, stbdSideTeam: 6, stbdSideBoat: 6)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 1, portSideBoat: 1, stbdSideTeam: 4, stbdSideBoat: 4),
                Match(portSideTeam: 6, portSideBoat: 6, stbdSideTeam: 2, stbdSideBoat: 2),
                Match(portSideTeam: 5, portSideBoat: 5, stbdSideTeam: 3, stbdSideBoat: 3)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 6, portSideBoat: 6, stbdSideTeam: 1, stbdSideBoat: 1),
                Match(portSideTeam: 4, portSideBoat: 4, stbdSideTeam: 5, stbdSideBoat: 5),
                Match(portSideTeam: 3, portSideBoat: 3, stbdSideTeam: 2, stbdSideBoat: 2)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 5, portSideBoat: 5, stbdSideTeam: 1, stbdSideBoat: 1),
                Match(portSideTeam: 6, portSideBoat: 6, stbdSideTeam: 3, stbdSideBoat: 3),
                Match(portSideTeam: 2, portSideBoat: 2, stbdSideTeam: 4, stbdSideBoat: 4)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 1, portSideBoat: 1, stbdSideTeam: 3, stbdSideBoat: 3),
                Match(portSideTeam: 4, portSideBoat: 6, stbdSideTeam: 6, stbdSideBoat: 4),
                Match(portSideTeam: 2, portSideBoat: 2, stbdSideTeam: 5, stbdSideBoat: 5)
            ]
        )
    ]
)

let Finals = EventStage(
    flights: [
        Flight(
            matches: [
                Match(portSideTeam: 2, portSideBoat: 2, stbdSideTeam: 1, stbdSideBoat: 1),
                Match(portSideTeam: 4, portSideBoat: 4, stbdSideTeam: 3, stbdSideBoat: 3)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 1, portSideBoat: 1, stbdSideTeam: 2, stbdSideBoat: 2),
                Match(portSideTeam: 3, portSideBoat: 3, stbdSideTeam: 4, stbdSideBoat: 4)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 2, portSideBoat: 1, stbdSideTeam: 1, stbdSideBoat: 2),
                Match(portSideTeam: 4, portSideBoat: 3, stbdSideTeam: 3, stbdSideBoat: 4)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 1, portSideBoat: 2, stbdSideTeam: 2, stbdSideBoat: 1)
            ]
        ),
        Flight(
            matches: [
                Match(portSideTeam: 2, portSideBoat: 2, stbdSideTeam: 1, stbdSideBoat: 1)
            ]
        )
    ]
)
