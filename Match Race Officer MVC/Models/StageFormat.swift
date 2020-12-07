//
//  StageFormatModel.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 07.12.2020.
//

//import Foundation
//import UIKit

class StageFormat {
    var title: String = ""
    var desription: String = ""
    var numSkippers: Int = 0
    var numBoats: Int = 0
    var flights: [Flight] = []
    
    init(title t: String, description d: String, numSkippers ns: Int, numBoats nb: Int, flights f: [Flight]) {
        self.title = t
        self.desription = d
        self.numSkippers = ns
        self.numBoats = nb
        self.flights = f
    }
    init(title t: String) {
        self.title = t
        self.desription = ""
        self.numSkippers = 0
        self.numBoats = 0
        self.flights = []
    }
    init(title t: String, description d: String) {
        self.title = t
        self.desription = d
        self.numSkippers = 0
        self.numBoats = 0
        self.flights = []
    }

    
}


