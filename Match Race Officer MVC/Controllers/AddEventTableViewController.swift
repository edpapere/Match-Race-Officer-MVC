//
//  AddEventTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 05.12.2020.
//

import UIKit

class AddEventTableViewController: UITableViewController, SkipperTableViewControllerDelegate, ItemCollectionDelegate {

    
  

    
    // MARK: - IB Outlets

    @IBOutlet weak var eventDetailLabel: UILabel!
    @IBOutlet weak var skippersDetailLabel: UILabel!
    @IBOutlet weak var boatsDetailLabel: UILabel!
    
    
    
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
    
    var boats = ItemCollection<Boat>()
    
  
  
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        
        boats.assign(
            [
                Boat( ifBoatId: "", boatName: "Alpha", shortName: "111", sailNumber: "RUS111", isSpare: false),
                Boat( ifBoatId: "", boatName: "Bravo", shortName: "888", sailNumber: "RUS888", isSpare: false),
                Boat(shortName: "I", boatName: "India"),
                Boat(shortName: "F", boatName: "Foxtrot")
            ]
        )
        boats.delegate = self
        boats.identifier = "BoatsCollection"
        
        
        updateLabels()
      
      
        
    }
    
    func updateLabels() {
        skippersDetailLabel.text = skippers.count > 0 ? "\(skippers.count)" : "no skippers"
        boatsDetailLabel.text = boats.count > 0 ? "\(boats.count)" : "no boats"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 4
        default:
            return 0
        }
    }

//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch (indexPath.section, indexPath.row) {
//        case (beginDatePicketPath.section, beginDatePicketPath.row):
//            return isBeginDatePickerShown ? 162.0 : 0.0
//        case (endDatePicketPath.section, endDatePicketPath.row):
//            return isEndDatePickerShown ? 162.0 : 0.0
//        default:
//            return 50 // 43.5
//        }
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
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

    // MARK: - Collection Delegates
    
    func boatCollectionChanged() {
        updateLabels()
    }
    
    func collectionChanged(_ identifier: String) {
        #if DEBUG
        print(#function,"Colletion changed. Identifier = \(identifier)")
        #endif
        updateLabels()
    }
    
    
    // MARK: - Skipper Table View Delegate
    
    func updateSkipper(at index: Int, with skipper: Skipper) {
        self.skippers[index] = skipper
        updateLabels()
    }
    func appendSkipper(_ skipper: Skipper){
        self.skippers.append(skipper)
        updateLabels()
    }
    @discardableResult func removeSkipper(at index: Int) -> Skipper {
        print(#function, "remove \(index)")
        let skipper = self.skippers.remove(at: index)
        updateLabels()
        return skipper
    }
    func insertSkipper(_ skipper: Skipper, at index: Int) {
        self.skippers.insert(skipper, at: index)
        updateLabels()
    }
    
    func returnSkipper(at index: Int) -> Skipper {
        return skippers[index]
    }
    
    func replaceSkippers(_ skippers: [Skipper]) {
        self.skippers = skippers
        updateLabels()
    }
    
    func countSkippers() -> Int {
        skippers.count
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier {
        case "EditEventInfo":
            break
        case "EditSkipperList":
            let skipperTableViewController = segue.destination as? SkipperTableViewController
         //   skipperTableViewController?.skippers = skippers
            skipperTableViewController?.delegate = self
            break
        case "EditBoatList":
            let boatTableViewController = segue.destination as? BoatTableViewController
            boatTableViewController?.boats = self.boats
            // skipperTableViewController?.delegate = self
            break
        default:
            break
        }
    }
    
    
    
}
