//
//  AddEditPersonTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 20.11.2020.
//

import UIKit

class AddEditPersonTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var ifSailorIdTextField: UITextField!
    @IBOutlet weak var familyNameTextField: UITextField!
    @IBOutlet weak var givenNameTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
    // MARK: - Properties
    var person: Person? = nil
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let person = person {
            ifSailorIdTextField.text = person.ifPersonId
            familyNameTextField.text = person.familyName
            givenNameTextField.text = person.givenName
            genderTextField.text = person.gender.rawValue
        }
        
        updateSaveButtonState()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func updateSaveButtonState() {
        let ifSailorID = ifSailorIdTextField.text ?? ""
        let familyName = familyNameTextField.text ?? ""
        let givenName = givenNameTextField.text ?? ""
        let gender = genderTextField.text ?? ""
        
        let changedInEditMode =
            person != nil ? ifSailorID != person!.ifPersonId || familyName != person!.familyName || givenName != person!.givenName || gender != person!.gender.rawValue : true
        
        saveButton.isEnabled = changedInEditMode && !ifSailorID.isEmpty && !familyName.isEmpty && !givenName.isEmpty && !gender.isEmpty
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let ifSailorID = ifSailorIdTextField.text ?? ""
        let familyName = familyNameTextField.text ?? ""
        let givenName = givenNameTextField.text ?? ""
        let gender = genderTextField.text ?? ""
        
        if person == nil {
            person = Person(ifPersonId: ifSailorID, familyName: familyName, givenName: givenName, gender: PersonGender(rawValue: gender) ?? .male)
        } else {
            person!.ifPersonId = ifSailorID
            person!.familyName = familyName
            person!.givenName = givenName
            person!.gender = PersonGender(rawValue: gender) ?? .male
        }
        
    }
    // MARK: - Table view data source

  


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

    @IBAction func textFieldChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }

}
