//
//  BoatTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 21.11.2020.
//

import UIKit

class BoatTableViewController: UITableViewController {
    
    var boats: [Boat] = [
        Boat( ifBoatId: "", boatName: "Alpha", shortName: "111", sailNumber: "RUS111", isSpare: false),
        Boat( ifBoatId: "", boatName: "Bravo", shortName: "888", sailNumber: "RUS888", isSpare: false),
        Boat(shortName: "I", boatName: "India"),
        Boat(shortName: "F", boatName: "Foxtrot")
        
    ]
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditBoat" {
            let indexPath = tableView.indexPathForSelectedRow!
            let boat = boats[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let addEditBoatTableViewController = navController.topViewController as! AddEditBoatTableViewController
            addEditBoatTableViewController.boat = boat
        }
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            #if DEBUG
            print(#line,#function,"Number of persons: \(boats.count)")
            #endif
            return boats.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "boatReuseIdentifier", for: indexPath)

        // Configure the cell...
        let boat = boats[indexPath.row]
        
        cell.textLabel?.text = "\(boat.shortName)  \(boat.boatName)"
        cell.detailTextLabel?.text = "(\(boat.boatId))  \(boat.sailNumber)"

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
    
    @IBAction func unwindToBoatTableView(_ unwindSegue: UIStoryboardSegue) {
        #if DEBUG
        print(#line,#function,"\(unwindSegue.identifier ?? "<unknown segue>")")
        #endif
        
        let sourceViewController = unwindSegue.source as! AddEditBoatTableViewController
        
        if let boat = sourceViewController.boat {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                boats[selectedIndexPath.row] = boat
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            } else {
                let newIndexPath = IndexPath(row: boats.count, section: 0)
                boats.append(boat)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        
    }
}
