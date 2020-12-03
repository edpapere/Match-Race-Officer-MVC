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
        "4S-4B *Finals* (2 & 3 points)",
        "4S-4B *Semi Finals* (3 points)",
        "4S-4B *Sail Offs* (1 point)",
        "*6S-6B-1RR* One Round Robin",
        "*6S-6B-1RR* 2nd Round Robin",
        "*8S-8B-1RR* One Round Robin",
        "*8S-8B-1RR* 2nd Round Robin",
        "*9S-4B-1RR* One Round Robin",
        "*9S-4B-1RR* 2nd Round Robin",
        "*9S-6B-1RR* One Round Robin",
        "*9S-6B-1RR* 2nd Round Robin",
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
        "20"
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
        
        
        let title = stageFormats[indexPath.row]
        
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
