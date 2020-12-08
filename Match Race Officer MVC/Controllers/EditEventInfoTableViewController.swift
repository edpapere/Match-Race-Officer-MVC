//
//  AddEventTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 05.12.2020.
//

import UIKit

class EditEventInfoTableViewController: UITableViewController {

    @IBOutlet weak var beginDateLabel: UILabel!
    @IBOutlet weak var beginDatePicker: UIDatePicker!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    
    let beginDatePicketPath = IndexPath(row:1, section: 1)
    let endDatePicketPath = IndexPath(row:3, section: 1)
    
    var isBeginDatePickerShown = false {
        didSet {
            beginDatePicker.isHidden = !isBeginDatePickerShown
        }
    }
    
    var isEndDatePickerShown = false {
        didSet {
            endDatePicker.isHidden = !isEndDatePickerShown
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        updateDateViews()
        
    }
    
    func updateDateViews() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        beginDateLabel.text = dateFormatter.string(from: beginDatePicker.date)
        endDateLabel.text = dateFormatter.string(from: endDatePicker.date)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 1 ? 4 : 2
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (beginDatePicketPath.section, beginDatePicketPath.row):
            return isBeginDatePickerShown ? 162.0 : 0.0
        case (endDatePicketPath.section, endDatePicketPath.row):
            return isEndDatePickerShown ? 162.0 : 0.0
        default:
            return 50 // 43.5
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row+1) {
        
        case (beginDatePicketPath.section, beginDatePicketPath.row):
            if isBeginDatePickerShown {
                isBeginDatePickerShown = false
            } else if isEndDatePickerShown {
                isEndDatePickerShown = false
                isBeginDatePickerShown = true
            } else {
                isBeginDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            break
            
        case (endDatePicketPath.section, endDatePicketPath.row):
            if isEndDatePickerShown {
                isEndDatePickerShown = false
            } else if isBeginDatePickerShown {
                isBeginDatePickerShown = false
                isEndDatePickerShown = true
            } else {
                isEndDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            break
            
        default:
            break
        }
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        #if DEBUG
        print(beginDateLabel.text!)
        print(endDateLabel.text!)
        #endif
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        updateDateViews()
    }
}
