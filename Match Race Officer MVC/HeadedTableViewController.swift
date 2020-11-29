//
//  HeadedTableViewController.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 29.11.2020.
//
// ------------------------------------------------------------------------
// Based on TableView Stretchy Header by Mitchell Hudson
// https://www.youtube.com/playlist?list=PLoN_ejT35AEjgjfIAd0BZbuDbjY68daAy
//
// 03 TableView Content Insets
// https://www.youtube.com/watch?v=I0hC2nmpAsw
//
// 04 UIImageView Setup
// https://www.youtube.com/watch?v=4bNaJcmT2HY
//
// 05 ScrollView didscroll and resizing image view
// https://www.youtube.com/watch?v=yBOxtJfHLL4

import UIKit

class HeadedTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: MatchTableHeaderView!

/*
    var headerView2 = MatchTableHeaderView()
*/
    
    // MARK: - Properties
    
    var array = RoundRobin6S6B // Finals // RoundRobin6S6B
    
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //headerView.isHeader = true
        headerView.setTextOfColumns(match: "Match", portBoat: "Boat", portTeam: "Blue", stbdBoat: "Boat", stbdTeam: "Yellow")
        headerView.headerTitleLabel2.text = "Header"
        
      
//        headerView.setNeedsLayout()
//        headerView.layoutIfNeeded()

//        let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        
        let rect = headerView.stbdTeam.superview!.frame
        for con in headerView.constraints {
            if con.identifier == "headerHeight" {
                con.constant = rect.maxY
                print(#line,con.constant)
            }
        }
        
     //   headerView.bounds = CGRect(x: 0, y: 0, width: self.accessibilityFrame.width, height: height)
        
        //headerView.stbdSideTeamLabel2.font
        // Do any additional setup after loading the view.

/*
        view.addSubview(headerView2)
        
        
        var rect2 = tableView.frame
        print(#line,#function,rect2)
        rect2.size.height = 100 //height2
        print(#line,#function,rect2)
        headerView2.frame = rect2
        headerView2.setTextOfColumns(match: "Match", portBoat: "Boat", portTeam: "Blue", stbdBoat: "Boat", stbdTeam: "Yellow")
        var height2 = headerView2.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        print(#line,#function, height2)
        height2 = 75
        rect2.size.height = height2
        headerView2.frame = rect2
        headerView2.headerTitleLabel2.text = "Header"
        
        tableView.contentInset = UIEdgeInsets(top: height2, left: 0, bottom: 20, right: 0)
*/
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return array.flights.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Flight \(section+1)"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.flights[section].matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        cell.textLabel?.text = "Match \(indexPath.row+1)"
        cell.detailTextLabel?.text = nil
        
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
