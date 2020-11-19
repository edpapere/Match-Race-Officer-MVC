//
//  PersonTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 19.11.2020.
//

import UIKit

class PersonTableViewController: UITableViewController {
    
    var persons: [Person] = [
        Person( ifPersonId: "sweak1".uppercased(), familyName: "Kjellberg", givenName: "Anna", gender: .female),
        Person( ifPersonId: "swemk".uppercased(), familyName: "Källström", givenName: "Malin", gender: .female),
        Person( ifPersonId: "swehs2".uppercased(), familyName: "Skarp", givenName: "Helena", gender: .female),
        Person( ifPersonId: "usaat1".uppercased(), familyName:"Tunnicliffe", givenName: "Anna", gender: .female),
        Person( ifPersonId: "usamo13".uppercased(), familyName:"O'Bryan", givenName: "Molly", gender: .female),
        Person( ifPersonId: "usadc11".uppercased(), familyName:"Capozzi", givenName: "Debbie", gender: .female),
        Person( ifPersonId: "fincw2".uppercased(), familyName:"Wahlroos", givenName: "Chita", gender: .female),
        Person( ifPersonId: "finmk5".uppercased(), familyName:"Klemetz", givenName: "Maria", gender: .female),
        Person( ifPersonId: "finlv1".uppercased(), familyName:"Väresmaa", givenName: "Livia", gender: .female),
        Person( ifPersonId: "fracl3".uppercased(), familyName:"Leroy", givenName: "Claire", gender: .female),
        Person( ifPersonId: "fraeb11".uppercased(), familyName:"Bertrand", givenName: "Elodie", gender: .female),
        Person( ifPersonId: "framr3".uppercased(), familyName:"Riou", givenName: "Marie", gender: .female),
        Person( ifPersonId: "ruses1".uppercased(), familyName: "Skudina", givenName: "Ekaterina", gender: .female),
        Person( ifPersonId: "ruses5".uppercased(), familyName: "Syuzeva", givenName: "Elena", gender: .female),
        Person( ifPersonId: "rusng1".uppercased(), familyName: "Gaponovich", givenName: "Natalia", gender: .female ),
        Person( ifPersonId: "usagt8".uppercased(), familyName: "Tulloch", givenName: "Genny", gender: .female)
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
        #if DEBUG
        print(#line,#function,"Number of sections: \(1)")
        #endif
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        #if DEBUG
        print(#line,#function,"Section: \(section)")
        #endif
        if section == 0 {
            #if DEBUG
            print(#line,#function,"Number of persons: \(persons.count)")
            #endif
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
