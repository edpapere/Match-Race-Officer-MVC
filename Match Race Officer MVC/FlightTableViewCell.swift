//
//  FlightTableViewCell.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 23.11.2020.
//

import UIKit

class FlightTableViewCell: UITableViewCell {

    // MARK: - IB Outlets
    
    
    
    @IBOutlet weak var matchNumberLabel: UILabel!
    @IBOutlet weak var portSideBoatLabel: UILabel!
    @IBOutlet weak var portSideTeamLabel: UILabel!
    @IBOutlet weak var stbdSideBoatLabel: UILabel!
    @IBOutlet weak var stbdSideTeamLabel: UILabel!
    
    
    @IBOutlet weak var headerTitleLabel2: UILabel!
    @IBOutlet weak var matchNumberLabel2: UILabel!
    @IBOutlet weak var portSideBoatLabel2: UILabel!
    @IBOutlet weak var portSideTeamLabel2: UILabel!
    @IBOutlet weak var stbdSideBoatLabel2: UILabel!
    @IBOutlet weak var stbdSideTeamLabel2: UILabel!
    // MARK: - Properties
    
    static let grey4light     = UIColor(hue: 0.000, saturation: 0.000, brightness: 0.200, alpha: 0.100)
    static let blue4light     = UIColor(hue: 0.600, saturation: 0.400, brightness: 1.000, alpha: 1.000)
    static let yellow4light   = UIColor(hue: 0.130, saturation: 0.600, brightness: 1.000, alpha: 1.000)
    static let grey4dark      = UIColor(hue: 0.000, saturation: 0.000, brightness: 0.900, alpha: 0.300)
    static let blue4dark      = UIColor(hue: 0.600, saturation: 1.000, brightness: 1.000, alpha: 0.700)
    static let yellow4dark    = UIColor(hue: 0.130, saturation: 1.000, brightness: 1.000, alpha: 0.700)
    
    
    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with match: Match, as number: Int, markPort: Bool, markStbd: Bool) {

        // var greyColor: UIColor = UIColor(hue: 0.000, saturation: 0.000, brightness: 0.900, alpha: 0.900) //lightGray
        // var blueColor: UIColor = UIColor(hue: 0.600, saturation: 0.500, brightness: 0.900, alpha: 1.000) //lightGray
        var greyColor: UIColor = UIColor(hue: 0.000, saturation: 0.000, brightness: 0.200, alpha: 0.100) // .lightGray // .systemGray4
        var blueColor: UIColor = UIColor(hue: 0.600, saturation: 0.400, brightness: 1.000, alpha: 1.000) // .cyan
        var yellColor: UIColor = UIColor(hue: 0.130, saturation: 0.600, brightness: 1.000, alpha: 1.000) // .yellow
        
        // alternative colors from Excel
        // Blue:   RGB(0.600,0.800,1.000) / RGB256(153,204,255) / HSB( 210/360,0.400,1.000) = HSB(0.583,0.400,1.000)
        // Yellow: RGB(0.996,1.000,0.600) / RGB256(254,255,153) / HSB(60.6/360,0.400,1.000) = HSB(0.168,0.400,1.000)
        
        //var yellColor: UIColor = UIColor(hue: 0.10, saturation: 0.50, brightness: 0.90, alpha: 1) //lightGray
        //  var yellColor: UIColor = UIColor(hue: 0.15, saturation: 0.40, brightness: 1.00, alpha: 1) //lightGray
        
        //var yellColor: UIColor = UIColor(hue: 0.15, saturation: 0.40, brightness: 1.00, alpha: 1) //lightGray
        
        
        // var yellColor: UIColor = UIColor(hue: 0.139, saturation: 0.961, brightness: 1.000, alpha: 1.000) // systemYellow @ Dark
        //var yellColor: UIColor = UIColor(hue: 0.130, saturation: 0.600, brightness: 1.000, alpha: 1.000) // systemYellow @ Dark

          //blueColor          = UIColor(hue: 0.139, saturation: 0.961, brightness: 1.000, alpha: 1.000) // systemYellow @ Dark
//        var yellColor: UIColor = UIColor(hue: 0.133, saturation: 1.000, brightness: 1.000, alpha: 1.000) // systemYellow @ Light
        
//        var blueColor: UIColor = .cyan
        
        if #available(iOS 12.0, *) {
            if traitCollection.userInterfaceStyle == .dark {
                greyColor = UIColor(hue: 0.000, saturation: 0.000, brightness: 0.900, alpha: 0.300)
                blueColor = UIColor(hue: 0.600, saturation: 1.000, brightness: 1.000, alpha: 0.700) // .blue
                yellColor = UIColor(hue: 0.130, saturation: 1.000, brightness: 1.000, alpha: 0.700) // .yellow
            }
        }
        


//        if #available(iOS 13.0, *) {
//            //greyColor = .systemGray4
//            blueColor = traitCollection.userInterfaceStyle == .dark ? .systemBlue : .cyan
//            yellColor = .systemYellow
//        }
//

//        #if DEBUG
//        print(#line,#function,"\(blueColor) -- blue")
//        print(#line,#function,"\(yellColor) -- yellow")
//        #endif
        

        matchNumberLabel.text = "\(number+1)"
        portSideBoatLabel.text = "B\(match.portSideBoat)"
        portSideTeamLabel.text = " Skipper \(match.portSideTeam)"
        stbdSideBoatLabel.text = "B\(match.stbdSideBoat)"
        stbdSideTeamLabel.text = " Skipper \(match.stbdSideTeam)"
        portSideBoatLabel.backgroundColor = blueColor
        stbdSideBoatLabel.backgroundColor = yellColor
        portSideTeamLabel.backgroundColor = markPort ? greyColor : nil
        stbdSideTeamLabel.backgroundColor = markStbd ? greyColor : nil
    
    }

    func update(with eventStage: EventStage, indexPath: IndexPath, markBoatChanges: Bool = false) {

        var greyColor = UIColor.m_grey
        var blueColor = UIColor.m_blue
        var yellColor = UIColor.m_yellow
                
        if #available(iOS 12.0, *) {
            if traitCollection.userInterfaceStyle == .dark {
                greyColor = UIColor.m_grey4dark
                blueColor = UIColor.m_blue4dark
                yellColor = UIColor.m_yellow4dark
            }
        }
        
        matchNumberLabel.text = "\(indexPath.row+1)"
        portSideBoatLabel.text = eventStage.boatShortName(indexPath: indexPath, side: .portSide)
        stbdSideBoatLabel.text = eventStage.boatShortName(indexPath: indexPath, side: .stbdSide)
        portSideTeamLabel.text = eventStage.teamName(indexPath: indexPath, side: .portSide)
        stbdSideTeamLabel.text = eventStage.teamName(indexPath: indexPath, side: .stbdSide)
        
        portSideBoatLabel.backgroundColor = blueColor
        stbdSideBoatLabel.backgroundColor = yellColor
        
        if eventStage.markBoatChanges {
            let ( markPort, markStbd ) = eventStage.skipperHasChangedTheBoat(indexPath: indexPath)
            portSideTeamLabel.backgroundColor = markPort ? greyColor : nil
            stbdSideTeamLabel.backgroundColor = markStbd ? greyColor : nil
        } else {
            portSideTeamLabel.backgroundColor = nil
            stbdSideTeamLabel.backgroundColor = nil
        }
    
    }

    
    func update(title: String) {

        var blueColor = FlightTableViewCell.blue4light
        var yellColor = FlightTableViewCell.yellow4light
        
        if #available(iOS 12.0, *) {
            if traitCollection.userInterfaceStyle == .dark {
                blueColor = FlightTableViewCell.blue4dark
                yellColor = FlightTableViewCell.yellow4dark
            }
        }
        
        headerTitleLabel2.text = title
        
        matchNumberLabel2.text = "Match"
        portSideBoatLabel2.text = "Boat"
        portSideTeamLabel2.text = "Blue"
        stbdSideBoatLabel2.text = "Boat"
        stbdSideTeamLabel2.text = "Yellow"
        headerTitleLabel2.backgroundColor = nil
        if #available(iOS 13.0, *) {
            matchNumberLabel2.backgroundColor = .systemBackground
        } else {
            matchNumberLabel2.backgroundColor = .white
        }
        portSideBoatLabel2.backgroundColor = blueColor
        portSideTeamLabel2.backgroundColor = blueColor
        stbdSideBoatLabel2.backgroundColor = yellColor
        stbdSideTeamLabel2.backgroundColor = yellColor
        //self.contentView.backgroundColor = nil
        headerTitleLabel2.superview?.backgroundColor = nil
    
    }

    
}
