//
//  AddEventTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 05.12.2020.
//

import UIKit

class AddEventTableViewController: UITableViewController, ItemArrayDelegate, ItemDictionaryDelegate, SailingEventInfoDelegate {

  

    
    // MARK: - IB Outlets

    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventDetailLabel: UILabel!
    @IBOutlet weak var skippersDetailLabel: UILabel!
    @IBOutlet weak var boatsDetailLabel: UILabel!
    
    
    
    // MARK: - Properties
    
    
//    var skippers: [Skipper] = [
//        Skipper( ifPersonId: "sweak1".uppercased(), familyName: "Kjellberg", givenName: "Anna", gender: .female),
//        Skipper( ifPersonId: "swemk".uppercased(), familyName: "Källström", givenName: "Malin", gender: .female),
//        Skipper( ifPersonId: "swehs2".uppercased(), familyName: "Skarp", givenName: "Helena", gender: .female),
//        Skipper( ifPersonId: "usaat1".uppercased(), familyName:"Tunnicliffe", givenName: "Anna", gender: .female),
//        Skipper( ifPersonId: "usamo13".uppercased(), familyName:"O'Bryan", givenName: "Molly", gender: .female),
//        Skipper( ifPersonId: "usadc11".uppercased(), familyName:"Capozzi", givenName: "Debbie", gender: .female),
//        Skipper( ifPersonId: "fincw2".uppercased(), familyName:"Wahlroos", givenName: "Chita", gender: .female),
//        Skipper( ifPersonId: "finmk5".uppercased(), familyName:"Klemetz", givenName: "Maria", gender: .female),
//        Skipper( ifPersonId: "finlv1".uppercased(), familyName:"Väresmaa", givenName: "Livia", gender: .female),
//        Skipper( ifPersonId: "fracl3".uppercased(), familyName:"Leroy", givenName: "Claire", gender: .female),
//        Skipper( ifPersonId: "fraeb11".uppercased(), familyName:"Bertrand", givenName: "Elodie", gender: .female),
//        Skipper( ifPersonId: "framr3".uppercased(), familyName:"Riou", givenName: "Marie", gender: .female),
//        Skipper( ifPersonId: "ruses1".uppercased(), familyName: "Skudina", givenName: "Ekaterina", gender: .female),
//        Skipper( ifPersonId: "ruses5".uppercased(), familyName: "Syuzeva", givenName: "Elena", gender: .female),
//        Skipper( ifPersonId: "rusng1".uppercased(), familyName: "Gaponovich", givenName: "Natalia", gender: .female ),
//        Skipper( ifPersonId: "usagt8".uppercased(), familyName: "Tulloch", givenName: "Genny", gender: .female)
//    ]
    
    var eventInfo = SailingEventInfo()
    var skippers = ItemArray<Skipper>()
    var boats = ItemArray<Boat>()
    var stageFormats = ItemDictionary<StageFormat>()
    
    let eventInfoCellPath = IndexPath(row: 0, section: 0)
    
  
  
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        eventInfo.title = "Sailing Academy Summer Cup"
        eventInfo.subtitle = "Moscow region"
        eventInfo.beginDate = Date()
        eventInfo.endDate = Date()
        eventInfo.delegate = self
        
        skippers.assign(
            [
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
        )
        skippers.identifier = "SkipperCollection"
        skippers.delegate = self
        
        boats.assign(
            [
                Boat( ifBoatId: "", boatName: "Alpha", shortName: "111", sailNumber: "RUS111", isSpare: false),
                Boat( ifBoatId: "", boatName: "Bravo", shortName: "888", sailNumber: "RUS888", isSpare: false),
                Boat(shortName: "I", boatName: "India"),
                Boat(shortName: "F", boatName: "Foxtrot")
            ]
        )
        boats.identifier = "BoatCollection"
        boats.delegate = self
        
        
        
        
        //    func assign(_ items: [StageFormat]) {
        //        let saveDelegate = self.delegate
        //        delegate = nil
        //        super.removeAll()
        //        for format in items {
        //            self.append(format)
        //            // append(key: format.uniqueCode, value: format)
        //        }
        //        self.delegate = saveDelegate
        //        delegate?.collectionChanged(identifier)
        //    }
 
        // stageFormats.removeAll()
        stageFormats.assign(
            [
                "FINALS":
                    StageFormat(
                        title: "4S-4B *Finals* (2 & 3 points)",
                        description: "Petit Final 2pts., Grand Final 3pts.",
                        numSkippers: 4,
                        numBoats: 4,
                        flights: []
                    ),
                "SEMI FINALS":
                    StageFormat(
                        title: "4S-4B *Semi Finals* (3 points)",
                        description: "",
                        numSkippers: 4,
                        numBoats: 4,
                        flights: []
                    ),
                "SAIL OFFS":
                    StageFormat(
                        title: "4S-4B *Sail Offs* (1 point)",
                        description: "",
                        numSkippers: 4,
                        numBoats: 4,
                        flights: []
                    ),
                "":
                    StageFormat(
                        title: "*6S-6B-1RR* One Round Robin",
                        description: "Single or 1st RR",
                        numSkippers: 6,
                        numBoats: 6,
                        flights: []
                    ),
                "":
                    StageFormat(
                        title: "*6S-6B-1RR* 2nd Round Robin",
                        description: "2nd RR: swapped sides",
                        numSkippers: 6,
                        numBoats: 6,
                        flights: []
                    ),
                "8S-8B-1RR":
                    StageFormat(title: "*8S-8B-1RR* One Round Robin"),
                "8S-8B-1RR.2":
                    StageFormat(title: "*8S-8B-1RR* 2nd Round Robin"),
                "9S-4B-1RR":
                    StageFormat(title: "*9S-4B-1RR* One Round Robin"),
                "9S-4B-1RR.2":
                    StageFormat(title: "*9S-4B-1RR* 2nd Round Robin"),
                "9S-6B-1RR":
                    StageFormat(title: "*9S-6B-1RR* One Round Robin"),
                "9S-6B-1RR.2":
                    StageFormat(title: "*9S-6B-1RR* 2nd Round Robin")
            ]
        )
  /*      ,
        

        StageFormat(title: "*01*"),
        StageFormat(title: "*02*"),
        StageFormat(title: "*03*"),
        StageFormat(title: "*04*"),
        StageFormat(title: "*05*"),
        StageFormat(title: "*06*"),
        StageFormat(title: "*07*"),
        StageFormat(title: "*08*"),
        StageFormat(title: "*09*"),
        StageFormat(title: "*10*"),
        StageFormat(title: "*11*"),
        StageFormat(title: "*12*"),
        StageFormat(title: "*13*"),
        StageFormat(title: "*14*"),
        StageFormat(title: "*15*"),
        StageFormat(title: "*16*"),
        StageFormat(title: "*17*"),
        StageFormat(title: "*18*"),
        StageFormat(title: "*19*")])
        
        */
        
        stageFormats.identifier = "StageFormatCollection"
        stageFormats.delegate = self
        
        updateLabels()
      
      
        
    }
    
    func updateLabels() {
        self.updateEventInfoUI()
        
        skippersDetailLabel.text = skippers.count > 0 ? "\(skippers.count)" : "no skippers"
        boatsDetailLabel.text = boats.count > 0 ? "\(boats.count)" : "no boats"
    }
    
    func updateEventInfoUI() {
        eventTitleLabel.text = eventInfo.title
        eventDetailLabel.text = eventInfo.subtitle + ", " + eventInfo.eventDatesDDMMYY()
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

    // MARK: - Data Model Delegates
    
//    func boatCollectionChanged() {
//        updateLabels()
//    }
//
    func collectionChanged(_ identifier: String) {
        #if DEBUG
        print(#function,"Colletion changed. Identifier = \(identifier)")
        #endif
        updateLabels()
    }
    
    func sailingEventInfoChanged() {
        #if DEBUG
        print(#function,"Event info changed.")
        #endif
        self.updateEventInfoUI()
        //tableView.reloadRows(at: [eventInfoCellPath], with: .none)
    }
    
    func dictionaryChanged(_ identifier: String) {
        self.updateLabels()
    }
    
    
  
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier {
        case "EditEventInfo":
            let tvc = segue.destination as? EditEventInfoTableViewController
            tvc?.eventInfo = self.eventInfo
            break
        case "EditSkipperList":
            let skipperTableViewController = segue.destination as? SkipperTableViewController
            skipperTableViewController?.skippers = self.skippers
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
    
    
    // MARK: - IB Actions
    
    @IBAction func unwindToAddEventTableViewController(_ unwindSegue: UIStoryboardSegue) {
        
        #if DEBUG
        print(#line,#function,"\(unwindSegue.identifier ?? "<unknown segue>")")
        #endif
        
    }
  
    
}
