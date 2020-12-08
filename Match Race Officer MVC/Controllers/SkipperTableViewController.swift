//
//  PersonTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 19.11.2020.
//

import UIKit

//protocol SkipperTableViewControllerDelegate {
//    func updateSkipper(at: Int, with: Skipper)
//    func appendSkipper(_: Skipper)
//    @discardableResult func removeSkipper(at: Int) -> Skipper
//    func insertSkipper(_: Skipper, at: Int)
//    func returnSkipper(at index: Int) -> Skipper
//    func replaceSkippers(_: [Skipper])
//    func countSkippers() -> Int
//}

class SkipperTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    //var delegate: SkipperTableViewControllerDelegate?
    
    //var skippers: [Skipper] = []
    var skippers = ItemCollection<Skipper>()
  
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
            print(#line,#function,"Number of Skippers: \(skippers.count)")
            #endif
            return skippers.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)

        // let skipper = skippers[indexPath.row]
        let skipper = skippers.access(at: indexPath.row)
        
        let personName = NSMutableAttributedString(string: "\(skipper.gender == .female ? "👩🏼" : "👦🏻") \(skipper.givenName)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: UIFont.labelFontSize)])
        personName.append(NSAttributedString(string: " \(skipper.familyName)",attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)]))
        cell.textLabel?.attributedText = personName
        
        cell.detailTextLabel?.text = "(\(skipper.personId)) \(skipper.ifPersonId) [\(skipper.ifRank != nil ? "\(skipper.ifRank!)" : "x")]"
        // Configure the cell...

        cell.showsReorderControl = true
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let person = skippers[indexPath.row]
//        #if DEBUG
//        print(#line,#function,"\(person.familyName) \(person.givenName) \(indexPath)")
//        #endif
    }
    /*
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let person = persons[indexPath.row]
        #if DEBUG
        print(#line,#function,"\(person.familyName) \(person.givenName) \(indexPath)")
        #endif
    }
    */
    


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
            print(#function, "remove \(indexPath.row)")
            skippers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
  

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedSkipper = skippers.remove(at: sourceIndexPath.row)
        skippers.insert(movedSkipper, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        #if DEBUG
//        print(#line,#function,"\(segue.identifier)")
//        #endif
        if segue.identifier == "EditSkipper" {
            let indexPath = tableView.indexPathForSelectedRow!
            //let skipper = skippers[indexPath.row]
            let skipper = skippers.access(at: indexPath.row)
            let navController = segue.destination as! UINavigationController
            let addEditSkipperTableViewController = navController.topViewController as! AddEditSkipperTableViewController
            addEditSkipperTableViewController.skipper = skipper
        }
    }
    
    
    // MARK: - IB Actions
    
    @IBAction func shuffleButtonTapped(_ sender: UIBarButtonItem) {
//        skippers.shuffle()
//        delegate?.replaceSkippers(skippers)
//        tableView.reloadData()
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
                //skippers[selectedIndexPath.row] = skipper
                skippers.update(at: selectedIndexPath.row, with: skipper)
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
