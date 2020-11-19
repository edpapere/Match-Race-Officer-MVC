//
//  ViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 19.11.2020.
//

import UIKit

class ViewController: UIViewController {

    var persons: [Person] = [
        Person(ifPersonId: "sweak1".uppercased(), familyName: "Kjellberg", givenName: "Anna", gender: .female),
        Person(ifPersonId: "swemk".uppercased(), familyName: "Källström", givenName: "Malin", gender: .female),
//        <Person FamilyName="Skarp" GivenName="Helena" IFPersonID="swehs2" NOC="SWE" PersonID="swehs2"/>
//        <Person FamilyName="Tunnicliffe" GivenName="Anna" IFPersonID="usaat1" NOC="USA" PersonID="usaat1"/>
//        <Person FamilyName="O'Bryan" GivenName="Molly" IFPersonID="usamo13" NOC="USA" PersonID="usamo13"/>
//        <Person FamilyName="Capozzi" GivenName="Debbie" IFPersonID="usadc11" NOC="USA" PersonID="usadc11"/>
//        <Person FamilyName="Wahlroos" GivenName="Chita" IFPersonID="fincw2" NOC="FIN" PersonID="fincw2"/>
//        <Person FamilyName="Klemetz" GivenName="Maria" IFPersonID="finmk5" NOC="FIN" PersonID="finmk5"/>
//        <Person FamilyName="Väresmaa" GivenName="Livia" IFPersonID="finlv1" NOC="FIN" PersonID="finlv1"/>
//        <Person FamilyName="Leroy" GivenName="Claire" IFPersonID="fracl3" NOC="FRA" PersonID="fracl3"/>
//        <Person FamilyName="Bertrand" GivenName="Elodie" IFPersonID="fraeb11" NOC="FRA" PersonID="fraeb11"/>
//        <Person FamilyName="Riou" GivenName="Marie" IFPersonID="framr3" NOC="FRA" PersonID="framr3"/>
        Person(ifPersonId: "ruses1".uppercased(), familyName: "Skudina", givenName: "Ekaterina", gender: .female),
        Person(ifPersonId: "ruses5".uppercased(), familyName: "Syuzeva", givenName: "Elena", gender: .female)
//        <Person FamilyName="Gaponovich" GivenName="Natalia" IFPersonID="rusng1" NOC="RUS" PersonID="rusng1"/>
//        <Person FamilyName="Tulloch" GivenName="Genny" IFPersonID="usagt8" NOC="USA" PersonID="usagt8"/>
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

