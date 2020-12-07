//
//  Person.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 19.11.2020.
//

// import Foundation

class Person {
    fileprivate static var nextId: PersonID = 1
    var personId: PersonID
    var ifPersonId: String
    var familyName: String
    var givenName: String
    var gender: PersonGender
    
    init(ifPersonId: String, familyName: String, givenName: String, gender: PersonGender) {
        
        self.personId = Person.nextId
        Person.nextId += 1
        
        self.ifPersonId = ifPersonId
        self.familyName = familyName
        self.givenName = givenName
        self.gender = gender
    }

    init(personId: PersonID, ifPersonId: String, familyName: String, givenName: String, gender: PersonGender) {
        
        self.personId = personId
        if personId >= Person.nextId {
            Person.nextId = personId + 1
        }
        
        self.ifPersonId = ifPersonId
        self.familyName = familyName
        self.givenName = givenName
        self.gender = gender
    }
}
