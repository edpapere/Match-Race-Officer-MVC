//
//  AddEditBoatTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 22.11.2020.
//

import UIKit

class AddEditBoatTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet weak var rootViewItem: UINavigationItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var shortNameTextField: UITextField!
    @IBOutlet weak var boatNameTextField: UITextField!
    @IBOutlet weak var isSpareBoatSwitch: UISwitch!
    @IBOutlet weak var sailNumberTextField: UITextField!
    @IBOutlet weak var ifBoatIdTextField: UITextField!
    
    // MARK: - Properties
    var boat: Boat? = nil
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let boat = boat {
            //shortNameTextField.text = boat.sailNumber
            ifBoatIdTextField.text = boat.ifBoatId
            boatNameTextField.text = boat.boatName
            shortNameTextField.text = boat.shortName
            sailNumberTextField.text = boat.sailNumber
            isSpareBoatSwitch.isOn = boat.isSpare
            rootViewItem.title = "Edit Boat"
        } else {
            rootViewItem.title = "Add Boat"
        }
        
        updateSaveButtonState()
        
    }

    func updateSaveButtonState() {
        
        let ifBoatID = ifBoatIdTextField.text ?? ""
        let boatName = boatNameTextField.text ?? ""
        let shortName = shortNameTextField.text ?? ""
        let sailNumber = sailNumberTextField.text ?? ""
        let isSpare = isSpareBoatSwitch.isOn
        
        let changedInEditMode =
        //    boat != nil ? ifBoatID != boat!.ifBoatId || boatName != boat!.boatName || sailNumber != boat!.sailNumber : true
            boat == nil ? true : !boat!.isEqualTo(ifBoatId: ifBoatID, boatName: boatName, shortName: shortName, sailNumber: sailNumber, isSpare: isSpare)
    
        //saveButton.isEnabled = changedInEditMode && !ifBoatID.isEmpty && !boatName.isEmpty && !sailNumber.isEmpty
        saveButton.isEnabled = changedInEditMode && Boat.isProperlyDefined(ifBoatId: ifBoatID, boatName: boatName, shortName: shortName, sailNumber: sailNumber, isSpare: isSpare)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let ifBoatID = ifBoatIdTextField.text ?? ""
        let boatName = boatNameTextField.text ?? ""
        let shortName = shortNameTextField.text ?? ""
        let sailNumber = sailNumberTextField.text ?? ""
        let isSpare = isSpareBoatSwitch.isOn

        if boat == nil {
            boat = Boat(ifBoatId: ifBoatID, boatName: boatName, shortName: shortName, sailNumber: sailNumber, isSpare: isSpare)
        } else {
            boat!.ifBoatId = ifBoatID
            boat!.boatName = boatName
            boat!.shortName = shortName
            boat!.sailNumber = sailNumber
            boat!.isSpare = isSpare
        }
        
    }
    
    // MARK: - Table view data source

    @IBAction func dataChanged(_ sender: Any) {
        updateSaveButtonState()
    }
}
