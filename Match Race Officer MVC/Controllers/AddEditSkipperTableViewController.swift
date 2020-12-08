//
//  AddEditPersonTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 20.11.2020.
//

import UIKit

class AddEditSkipperTableViewController: UITableViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var rootViewItem: UINavigationItem!
    @IBOutlet weak var ifSailorIdTextField: UITextField!
    @IBOutlet weak var familyNameTextField: UITextField!
    @IBOutlet weak var givenNameTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var ifRankTextField: UITextField!
    
    // MARK: - Properties
    
    var skipper: Skipper? = nil
    
    // MARK: - Methods
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(AddEditSkipperTableViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        genderSegmentedControl.selectedSegmentIndex = -1
        
        if let s = self.skipper {
            ifSailorIdTextField.text = s.ifPersonId
            familyNameTextField.text = s.familyName
            givenNameTextField.text = s.givenName
            genderSegmentedControl.selectedSegmentIndex = s.gender == .male ? 0 : 1
            ifRankTextField.text = s.ifRank != nil ? "\(s.ifRank!)" : ""
            rootViewItem.title = "Edit Person"
        } else {
            rootViewItem.title = "Add Person"
        }
        
        ifSailorIdTextField.constraints[0].constant = genderSegmentedControl.bounds.width
        
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
        let gender = genderSegmentedControl.selectedSegmentIndex
        var rank: Int?
        if let r = ifRankTextField.text {
            if let r2 = Int(r) {
                rank = r2
            }
        }
        
        let changedInEditMode =
            self.skipper != nil ? ifSailorID != skipper!.ifPersonId || familyName != skipper!.familyName || givenName != skipper!.givenName || gender != ( skipper!.gender == .male ? 0 : 1 ) || skipper!.ifRank != rank : true
        
        saveButton.isEnabled = changedInEditMode && //!ifSailorID.isEmpty &&
            !familyName.isEmpty && !givenName.isEmpty && gender != -1
        
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let ifSailorID = ifSailorIdTextField.text ?? ""
        let familyName = familyNameTextField.text ?? ""
        let givenName = givenNameTextField.text ?? ""
        let gender: PersonGender = genderSegmentedControl.selectedSegmentIndex == 0 ? .male : .female
        var rank: Int?
        if let r = ifRankTextField.text {
            if let r2 = Int(r) {
                rank = r2
            }
        }
        
        if skipper == nil {
            skipper = Skipper(ifPersonId: ifSailorID.uppercased(), familyName: familyName, givenName: givenName, gender: gender, rank: rank)
        } else {
            skipper!.ifPersonId = ifSailorID.uppercased()
            skipper!.familyName = familyName
            skipper!.givenName = givenName
            skipper!.gender = gender
            skipper!.ifRank = rank
        }
        
    }
    
    // MARK: - IB Actions
    
    @IBAction func dataChanged(_ sender: Any) {
        if sender is UITextField {
            if (sender as! UITextField ) == ifSailorIdTextField {
                ifSailorIdTextField.text = ifSailorIdTextField.text!.uppercased()
            }
        }
        updateSaveButtonState()
    }
    
    @IBAction func tappedOutsideTextField(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}
