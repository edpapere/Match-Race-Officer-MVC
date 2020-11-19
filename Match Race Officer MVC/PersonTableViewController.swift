//
//  PersonTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 19.11.2020.
//

import UIKit

class PersonTableViewController: UITableViewController {
    
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        print(#line,#function,"Number of sections: \(1)")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#line,#function,"Section: \(section)")
        if section == 0 {
//            #if DEBUG
            print(#line,#function,persons.count)
//            #endif
            return persons.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)

        let person = persons[indexPath.row]
        cell.textLabel?.text = "\(person.familyName) \(person.givenName)"
        cell.detailTextLabel?.text = "\(person.ifPersonId) \(person.gender)"
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
