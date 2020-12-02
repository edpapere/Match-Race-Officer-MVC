//
//  StageFormatSelectionViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 03.12.2020.
//

import UIKit

class StageFormatSelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    

    @IBOutlet weak var numSkippersIndicatorTextField: UITextField!
    @IBOutlet weak var numSkippersStepper: UIStepper!
    @IBOutlet weak var numBoatsIndicatorTextField: UITextField!
    @IBOutlet weak var numBoatsStepper: UIStepper!
    @IBOutlet weak var tableView: UITableView!
    
    var stageFormats = [
        "0",
        "01",
        "02",
        "03",
        "04",
        "05",
        "06",
        "07",
        "08",
        "09",
        "10",
        "11",
        "12",
        "13",
        "14",
        "15",
        "16",
        "17",
        "18",
        "19",
        "20",
        "4S-4B Finals (2 & 3 points)",
        "4S-4B Semi Finals (3 points)",
        "4S-4B Sail Offs (1 point)",
        "6S-6B-1RR One Round-Robin"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stageFormats.count // section == 0 ? stageFormats.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableFormatCell", for: indexPath)
        cell.textLabel!.text = stageFormats[indexPath.row]
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
