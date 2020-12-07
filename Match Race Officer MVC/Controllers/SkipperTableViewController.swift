//
//  PersonTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 19.11.2020.
//

import UIKit

class SkipperTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var skippers: [Skipper] = [
        Skipper( ifPersonId: "sweak1".uppercased(), familyName: "Kjellberg", givenName: "Anna", gender: .female),
        Skipper( ifPersonId: "swemk".uppercased(), familyName: "Källström", givenName: "Malin", gender: .female),
        Skipper( ifPersonId: "swehs2".uppercased(), familyName: "Skarp", givenName: "Helena", gender: .female),
        Skipper( ifPersonId: "usaat1".uppercased(), familyName:"Tunnicliffe", givenName: "Anna", gender: .female),
        Skipper( ifPersonId: "usamo13".uppercased(), familyName:"O'Bryan", givenName: "Molly", gender: .female),
        Skipper( ifPersonId: "usadc11".uppercased(), familyName:"Capozzi", givenName: "Debbie", gender: .female),
        Skipper( ifPersonId: "fincw2".uppercased(), familyName:"Wahlroos", givenName: "Chita", gender: .female),
        Skipper( ifPersonId: "finmk5".uppercased(), familyName:"Klemetz", givenName: "Maria", gender: .female),
        Skipper( ifPersonId: "finlv1".uppercased(), familyName:"Väresmaa", givenName: "Livia", gender: .female),
        Skipper( ifPersonId: "fracl3".uppercased(), familyName:"Leroy", givenName: "Claire", gender: .female),
        Skipper( ifPersonId: "fraeb11".uppercased(), familyName:"Bertrand", givenName: "Elodie", gender: .female),
        Skipper( ifPersonId: "framr3".uppercased(), familyName:"Riou", givenName: "Marie", gender: .female),
        Skipper( ifPersonId: "ruses1".uppercased(), familyName: "Skudina", givenName: "Ekaterina", gender: .female),
        Skipper( ifPersonId: "ruses5".uppercased(), familyName: "Syuzeva", givenName: "Elena", gender: .female),
        Skipper( ifPersonId: "rusng1".uppercased(), familyName: "Gaponovich", givenName: "Natalia", gender: .female ),
        Skipper( ifPersonId: "usagt8".uppercased(), familyName: "Tulloch", givenName: "Genny", gender: .female)
    ]
  
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        navigationItem.rightBarButtonItems?.insert(editButtonItem, at: 0)
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
            print(#line,#function,"Number of persons: \(skippers.count)")
            #endif
            return skippers.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)

        let skipper = skippers[indexPath.row]
        
        let personName = NSMutableAttributedString(string: "\(skipper.gender == .female ? "👩🏼" : "👦🏻") \(skipper.givenName)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: UIFont.labelFontSize)])
        personName.append(NSAttributedString(string: " \(skipper.familyName)",attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)]))
        cell.textLabel?.attributedText = personName
        
        cell.detailTextLabel?.text = "(\(skipper.personId)) \(skipper.ifPersonId) [\(skipper.ifRank != nil ? "\(skipper.ifRank!)" : "x")]"
        // Configure the cell...

        cell.showsReorderControl = true
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = skippers[indexPath.row]
        #if DEBUG
        print(#line,#function,"\(person.familyName) \(person.givenName) \(indexPath)")
        #endif
    }
    /*
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let person = persons[indexPath.row]
        #if DEBUG
        print(#line,#function,"\(person.familyName) \(person.givenName) \(indexPath)")
        #endif
    }
    */
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedPerson = skippers.remove(at: sourceIndexPath.row)
        skippers.insert(movedPerson, at: destinationIndexPath.row)
        tableView.reloadData()
    }

    /*
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            skippers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
  

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

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        #if DEBUG
        print(#line,#function,"\(segue.identifier)")
        #endif
        if segue.identifier == "EditSkipper" {
            let indexPath = tableView.indexPathForSelectedRow!
            let skipper = skippers[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let addEditSkipperTableViewController = navController.topViewController as! AddEditSkipperTableViewController
            addEditSkipperTableViewController.skipper = skipper
        }
    }
    
    
    // MARK: - IB Actions
    
    @IBAction func shuffleButtonTapped(_ sender: UIBarButtonItem) {
//        tableView.setEditing(!tableView.isEditing, animated: true)
        skippers.shuffle()
        tableView.reloadData()
    }
    
    @IBAction func unwindToPersonTableView(_ unwindSegue: UIStoryboardSegue) {
        
        #if DEBUG
        print(#line,#function,"\(unwindSegue.identifier ?? "<unknown segue>")")
        #endif
        
        guard unwindSegue.identifier == "saveUnwind" else {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
            return
        }
        
        let sourceViewController = unwindSegue.source as! AddEditSkipperTableViewController
        
        if let skipper = sourceViewController.skipper {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                skippers[selectedIndexPath.row] = skipper
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            } else {
                let newIndexPath = IndexPath(row: skippers.count, section: 0)
                skippers.append(skipper)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        
    }
  
    
}
