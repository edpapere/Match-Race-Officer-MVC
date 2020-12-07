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
        StageFormat(
            title: "4S-4B *Finals* (2 & 3 points)",
            description: "Petit Final 2pts., Grand Final 3pts.",
            numSkippers: 4,
            numBoats: 4,
            flights: []
        ),
        StageFormat(
            title: "4S-4B *Semi Finals* (3 points)",
            description: "",
            numSkippers: 4,
            numBoats: 4,
            flights: []
        ),
        StageFormat(
            title: "4S-4B *Sail Offs* (1 point)",
            description: "",
            numSkippers: 4,
            numBoats: 4,
            flights: []
        ),
        StageFormat(
            title: "*6S-6B-1RR* One Round Robin",
            description: "Single or 1st RR",
            numSkippers: 6,
            numBoats: 6,
            flights: []
        ),
        StageFormat(
            title: "*6S-6B-1RR* 2nd Round Robin",
            description: "2nd RR: swapped sides",
            numSkippers: 6,
            numBoats: 6,
            flights: []
        ),
        StageFormat(title: "*8S-8B-1RR* One Round Robin"),
        StageFormat(title: "*8S-8B-1RR* 2nd Round Robin"),
        StageFormat(title: "*9S-4B-1RR* One Round Robin"),
        StageFormat(title: "*9S-4B-1RR* 2nd Round Robin"),
        StageFormat(title: "*9S-6B-1RR* One Round Robin"),
        StageFormat(title: "*9S-6B-1RR* 2nd Round Robin"),
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
        StageFormat(title: "*19*")
    ]
    
    var numSkippers: Int = 0 {
        didSet {
            numSkippersIndicatorTextField.text = "\(numSkippers)"
            numSkippersStepper.value = Double(numSkippers)
        }
    }
    
    var numBoats: Int = 0 {
        didSet {
            numBoatsIndicatorTextField.text = "\(numBoats)"
            numBoatsStepper.value = Double(numBoats)
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        numSkippers = 6
        numBoats = 6
        
    }
    
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//        tableView.reloadData()
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        #if DEBUG
        print("Section: \(section)")
        #endif
        return stageFormats.count // section == 0 ? stageFormats.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableFormatCell", for: indexPath)
        
        let format = stageFormats[indexPath.row]
        
        #if DEBUG
        print("Format description: \(format.desription)")
        #endif
        cell.detailTextLabel?.text = format.desription
        
        let title = format.title
        
        if let textLabel = cell.textLabel {
            
            if let pos1 = title.range(of: "*") {
                if let pos2 = title[pos1.upperBound...].range(of: "*") {
                    let pre = String(title[..<pos1.lowerBound])
                    let sub = String(title[pos1.upperBound..<pos2.lowerBound])
                    let suf = String(title.suffix(from: pos2.upperBound))
                    let sFont = UIFont.systemFont(ofSize: textLabel.font.pointSize)
                    let bFont = UIFont.boldSystemFont(ofSize: textLabel.font.pointSize)
                    
                    let attributed =
                        NSMutableAttributedString(string: pre, attributes: [ NSAttributedString.Key.font: sFont ] )
                    attributed.append(
                        NSAttributedString(string: sub, attributes: [ NSAttributedString.Key.font: bFont ])
                    )
                    attributed.append(
                        NSAttributedString(string: suf, attributes: [ NSAttributedString.Key.font: sFont ])
                    )
                    textLabel.attributedText = attributed
                    return cell
                }
            }
            textLabel.text = title
        }
        
       
        
//        let principalText = stageFormats[indexPath.row]
//
//        if let textLabel = cell.textLabel {
//            if #available(iOS 13.0, *) {
//                textLabel.attributedText =
//                    principalText.htmlAttributedString(size: textLabel.font.pointSize, color: .label)
//            } else {
//                textLabel.attributedText =
//                principalText.htmlAttributedString(size: textLabel.font.pointSize, color: textLabel.textColor)
//            }
//        }
      
 
//        cell.textLabel!.text = stageFormats[indexPath.row]
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


    @IBAction func numSkippersStepperChanged(_ sender: UIStepper) {
        numSkippers = Int(sender.value)
    }
    
    @IBAction func numBoatsStepperChanged(_ sender: UIStepper) {
        numBoats = Int(sender.value)
    }
    
}
