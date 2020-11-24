//
//  EventStageTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 22.11.2020.
//

import UIKit

class EventStageTableViewController: UITableViewController {

    var match = Match(portSideTeam: 1, portSideBoat: 1, stbdSideTeam: 2, stbdSideBoat: 2)
    
    var eventStage = RoundRobin6S6B // Finals // RoundRobin6S6B
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        let nib = UINib(nibName: "FlightTableViewHeaderView", bundle: nil)
//        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "flightTableViewHeaderView")
        
        
        // 03 TableView Content Insets
        // https://www.youtube.com/watch?v=I0hC2nmpAsw
        
        // 04 UIImageView Setup
        // https://www.youtube.com/watch?v=4bNaJcmT2HY
        
        // 05 ScrollView didscroll and resizing image view
        // https://www.youtube.com/watch?v=yBOxtJfHLL4
        
        // Custom TableView Section Headers - Part 25 - Itinerary App (iOS, Xcode 10, Swift 4)
        // https://www.youtube.com/watch?v=_z2etS0mHYw
        
        // Swift: Background gradient for UIView
        // https://stackoverflow.com/questions/50037160/swift-background-gradient-for-uiview
        
        // Swift Gradient in 4 lines of code
        // https://medium.com/better-programming/swift-gradient-in-4-lines-of-code-6f81809da741
        
        // How to Create Advanced Gradients in Swift with CAGradientLayer — iOS Swift Guide
        // https://medium.com/swlh/how-to-create-a-custom-gradient-in-swift-with-cagradientlayer-ios-swift-guide-190941cb3db2
        
        // Nested Sections in UITableView
        // https://sapandiwakar.in/nested-sections-in-uitableview/
        
        // iOS: How to build a Table View with Collapsible Sections
        // https://medium.com/ios-os-x-development/ios-how-to-build-a-table-view-with-collapsible-sections-96badf3387d0
        
        // Dealing with Complex Table Views in iOS and Keeping Your Sanity
        // https://medium.cobeisfresh.com/dealing-with-complex-table-views-in-ios-and-keeping-your-sanity-ff5fee1fbb83
        
        // Expanded TableView Cells
        // https://swiftbook.ru/post/tutorials/expanded-tableview-cells/
        
        // Draw vertical separator on UITableViewCell
        // https://stackoverflow.com/questions/10563989/draw-vertical-separator-on-uitableviewcell/10564866
        
        // Custom Icons (iOS 12 and Earlier)
        // https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/custom-icons/
        
        // App Icon
        // https://developer.apple.com/design/human-interface-guidelines/watchos/visual/app-icon/
        
        // https://www.pngtosvg.com
        // https://github.com/dsward2/macSVG/releases/
        
        // Creating Custom Symbol Images for Your App
        // https://developer.apple.com/documentation/uikit/uiimage/creating_custom_symbol_images_for_your_app
        
        // Swift 3: Twitter - Tweets String Formatting Tips And Tricks with NSAttributedString (Ep 9)
        // https://www.youtube.com/watch?v=slGx90YoX3Q
        
        // Swift: Youtube - Custom Tab Bar / Menu Bar using UICollectionView (Ep 3)
        // https://www.youtube.com/watch?v=rRhJGnSmEKQ
        
        // How to make a Custom UITabBarController with sized icons that aren’t too big in Swift 4.2 & Xcode 10
        // https://www.youtube.com/watch?v=6dctpl_n37I
        
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
       
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension;
        self.tableView.estimatedSectionHeaderHeight = 60;
        
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        tableView.reloadData()
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return eventStage.flights.count
        // return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return eventStage.flights[section].matches.count
        //return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! FlightTableViewCell

        // Configure the cell...
        let match = eventStage.flights[indexPath.section].matches[indexPath.row]
        
        
        /*
        var portWillChange = false
        var stbdWillChange = false
        if indexPath.section < eventStage.flights.count-1 {
            for next in eventStage.flights[indexPath.section+1].matches {
                portWillChange =
                    portWillChange ||
                    ( match.portSideBoat == next.portSideBoat && match.portSideTeam != next.portSideTeam ) ||
                    ( match.portSideBoat == next.stbdSideBoat && match.portSideTeam != next.stbdSideTeam )
                stbdWillChange =
                    stbdWillChange ||
                    ( match.stbdSideBoat == next.portSideBoat && match.stbdSideTeam != next.portSideTeam ) ||
                    ( match.stbdSideBoat == next.stbdSideBoat && match.stbdSideTeam != next.stbdSideTeam )
            }
        }
        
        
        
//        cell.textLabel?.text = "B\(match.portSideBoat):Skip\(match.portSideTeam):\(portWillChange)"
//        cell.detailTextLabel?.text = "B\(match.stbdSideBoat):Skip\(match.stbdSideTeam):\(stbdWillChange)"

        cell.update(with: match, as: indexPath.row, markPort: portWillChange, markStbd: stbdWillChange)

        */
        
        
        var portJustChanged = false
        var stbdJustChanged = false
        
        if indexPath.section > 0 {
            for previous in eventStage.flights[indexPath.section-1].matches {
                portJustChanged =
                    portJustChanged ||
                    ( match.portSideBoat == previous.portSideBoat && match.portSideTeam != previous.portSideTeam ) ||
                    ( match.portSideBoat == previous.stbdSideBoat && match.portSideTeam != previous.stbdSideTeam )
                stbdJustChanged =
                    stbdJustChanged ||
                    ( match.stbdSideBoat == previous.portSideBoat && match.stbdSideTeam != previous.portSideTeam ) ||
                    ( match.stbdSideBoat == previous.stbdSideBoat && match.stbdSideTeam != previous.stbdSideTeam )
            }
        }
        
        cell.update(with: match, as: indexPath.row, markPort: portJustChanged, markStbd: stbdJustChanged)

        //textFieldCell.layer.borderColor = UIColor.orange.cgColor
        //cell.layer.borderColor = UIColor.orange.cgColor
        //cell.layer.borderWidth = 2
        
      
        return cell
    }

    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        25
//    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Flight \(section+1)"
//    }

    
     
    /// Implements custom title for section header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flightTableViewHeaderView") as! FlightTableViewCell
        cell.update(title: "Flight \(section+1)")
        return cell.contentView
    }

//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 60
//    }

    
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

}
