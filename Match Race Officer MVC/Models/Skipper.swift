//
//  Person.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 07.12.2020.
//


class Skipper: Person {
    var ifRank: Int?
    
    init(ifPersonId: String, familyName: String, givenName: String, gender: PersonGender, rank: Int?) {
        self.ifRank = rank
        super.init(ifPersonId: ifPersonId, familyName: familyName, givenName: givenName, gender: gender)
    }

    init(personId: PersonID, ifPersonId: String, familyName: String, givenName: String, gender: PersonGender, rank: Int?) {
        self.ifRank = rank
        super.init(personId: personId, ifPersonId: ifPersonId, familyName: familyName, givenName: givenName, gender: gender)
    }

    override init(ifPersonId: String, familyName: String, givenName: String, gender: PersonGender) {
        self.ifRank = nil
        super.init(ifPersonId: ifPersonId, familyName: familyName, givenName: givenName, gender: gender)
    }

    override init(personId: PersonID, ifPersonId: String, familyName: String, givenName: String, gender: PersonGender) {
        self.ifRank = nil
        super.init(personId: personId, ifPersonId: ifPersonId, familyName: familyName, givenName: givenName, gender: gender)
    }
    
}

