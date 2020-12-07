//
//  MatchTableHeaderView.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 29.11.2020.
//

import UIKit

class MatchTableHeaderView: UIView {

    
    // MARK: - IB Outlets
    
    @IBOutlet weak var matchNum: UILabel!
    @IBOutlet weak var portBoat: UILabel!
    @IBOutlet weak var portTeam: UILabel!
    @IBOutlet weak var stbdBoat: UILabel!
    @IBOutlet weak var stbdTeam: UILabel!
    
    
    // MARK: - Properties
    
    var isHeader: Bool = false
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        let bundle = Bundle.init(for: MatchTableHeaderView.self)
        if let viewsToAdd = bundle.loadNibNamed("MatchTableHeaderView", owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
//            contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        }
        
    }
    
    func setTextOfColumns(match: String, portBoat: String, portTeam: String, stbdBoat: String, stbdTeam: String) {
        self.matchNum.text = match
        self.portBoat.text = portBoat
        self.portTeam.text = portTeam
        self.stbdBoat.text = stbdBoat
        self.stbdTeam.text = stbdTeam
        
        //if isHeader {
            self.portTeam.textAlignment = .center
            self.stbdTeam.textAlignment = .center
        //}
        
        updateLabelBackgrounds()
    }
    
    func updateLabelBackgrounds() {
        
        //        if #available(iOS 11.0, *) {
        //            self.portTeam.backgroundColor = UIColor(named: "matchBlueColor")
        //        } else {
        //            // Fallback on earlier versions
        //        }
        
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
        
        self.portBoat.backgroundColor = blueColor
        self.stbdBoat.backgroundColor = yellColor
        
        //if isHeader {
            self.matchNum.backgroundColor = greyColor
            self.portTeam.backgroundColor = blueColor
            self.stbdTeam.backgroundColor = yellColor
        //}
        

    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateLabelBackgrounds()
    }
    
    

    
    
}
