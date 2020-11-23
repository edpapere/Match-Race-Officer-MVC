//
//  EventStageTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 22.11.2020.
//

import UIKit

class EventStageTableViewController: UITableViewController {

    var match = Match(portSideTeam: 1, portSideBoat: 1, stbdSideTeam: 2, stbdSideBoat: 2)
    
    var eventStage = Finals // RoundRobin6S6B
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return eventStage.flights.count
        // return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return eventStage.flights[section].matches.count
        //return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! FlightTableViewCell

        // Configure the cell...
        let match = eventStage.flights[indexPath.section].matches[indexPath.row]
        
        
        /*
        var portWillChange = false
        var stbdWillChange = false
        if indexPath.section < eventStage.flights.count-1 {
            for next in eventStage.flights[indexPath.section+1].matches {
                portWillChange =
                    portWillChange ||
                    ( match.portSideBoat == next.portSideBoat && match.portSideTeam != next.portSideTeam ) ||
                    ( match.portSideBoat == next.stbdSideBoat && match.portSideTeam != next.stbdSideTeam )
                stbdWillChange =
                    stbdWillChange ||
                    ( match.stbdSideBoat == next.portSideBoat && match.stbdSideTeam != next.portSideTeam ) ||
                    ( match.stbdSideBoat == next.stbdSideBoat && match.stbdSideTeam != next.stbdSideTeam )
            }
        }
        
        
        
//        cell.textLabel?.text = "B\(match.portSideBoat):Skip\(match.portSideTeam):\(portWillChange)"
//        cell.detailTextLabel?.text = "B\(match.stbdSideBoat):Skip\(match.stbdSideTeam):\(stbdWillChange)"

        cell.update(with: match, as: indexPath.row, markPort: portWillChange, markStbd: stbdWillChange)

        */
        
        
        var portJustChanged = false
        var stbdJustChanged = false
        
        if indexPath.section > 0 {
            for previous in eventStage.flights[indexPath.section-1].matches {
                portJustChanged =
                    ( match.portSideBoat == previous.portSideBoat && match.portSideTeam != previous.portSideTeam ) ||
                    ( match.portSideBoat == previous.stbdSideBoat && match.portSideTeam != previous.stbdSideTeam )
                stbdJustChanged =
                    ( match.stbdSideBoat == previous.portSideBoat && match.stbdSideTeam != previous.portSideTeam ) ||
                    ( match.stbdSideBoat == previous.stbdSideBoat && match.stbdSideTeam != previous.stbdSideTeam )
            }
        }
        
        cell.update(with: match, as: indexPath.row, markPort: portJustChanged, markStbd: stbdJustChanged)

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Flight \(section+1)"
        
        // If you want to return a custom header view with something more than just some text, you should use viewForHeaderInSection instead, like this:
        /*
        override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let vw = UIView()
            vw.backgroundColor = UIColor.red

            return vw
        }
        */
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
