//
//  StageFormatSelectionViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 03.12.2020.
//

import UIKit

class XStageFormatSelectionViewControllerX: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    

    @IBOutlet weak var filterBarButton: UIBarButtonItem!
    @IBOutlet weak var numSkippersIndicatorTextField: UITextField!
    @IBOutlet weak var numSkippersStepper: UIStepper!
    @IBOutlet weak var numBoatsIndicatorTextField: UITextField!
    @IBOutlet weak var numBoatsStepper: UIStepper!
    @IBOutlet weak var tableView: UITableView!
    
    // var stageFormats: [StageFormat] = []
    var stageFormats = ItemDictionary<String,StageFormat>()
    var numSkippers: Int = 0
    var numBoats: Int = 0
    fileprivate var isFiltered: Bool = true {
        didSet {
            if #available(iOS 13.0, *) {
                filterBarButton.image = UIImage(systemName: isFiltered ? "checkmark.square" : "xmark.square")
                tableView.reloadData()
            } else {
                // Fallback on earlier versions
            }
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
        // return stageFormats.count // section == 0 ? stageFormats.count : 0
        
        return isFiltered ? stageFormats.keys.filter { $0.hasPrefix("9S-6B") } .count : stageFormats.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableFormatCell", for: indexPath)
        
        
        let key = isFiltered ? stageFormats.keys.filter { $0.hasPrefix("9S-6B") } [indexPath.row] : stageFormats.keys[indexPath.row]
        
        let format: StageFormat = stageFormats.access(key) ?? StageFormat(title: "")
        
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
    
    @IBAction func filterButtonPressed(_ sender: UIBarButtonItem) {
        isFiltered = !isFiltered
    }
    
}
