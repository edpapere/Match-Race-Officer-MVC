//
//  EventInfo.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 09.12.2020.
//

import Foundation

protocol SailingEventInfoDelegate {
    func sailingEventInfoChanged()
}

class SailingEventInfo {
    var delegate: SailingEventInfoDelegate?
    var title = "" {
        didSet { if title != oldValue { delegate?.sailingEventInfoChanged() } }
    }
    var subtitle = ""{
        didSet { if subtitle != oldValue { delegate?.sailingEventInfoChanged() } }
    }
    var location = "" {
        didSet { if location != oldValue { delegate?.sailingEventInfoChanged() } }
    }
    //var oa = ""
    var beginDate = Date() {
        didSet { if beginDate != oldValue { delegate?.sailingEventInfoChanged() } }
    }
    var endDate = Date() {
        didSet { if endDate != oldValue { delegate?.sailingEventInfoChanged() } }
    }
    
    func eventDatesDDMMYY() -> String {
        let calendar = Calendar.current
        let by = calendar.component(.year, from: self.beginDate)
        let ey = calendar.component(.year, from: self.endDate)
        let bm = calendar.component(.month, from: self.beginDate)
        let em = calendar.component(.month, from: self.endDate)
        let bd = calendar.component(.day, from: self.beginDate)
        let ed = calendar.component(.day, from: self.endDate)
        
        if by == ey {
            if bm == em {
                if bd == ed {
                    return String(format: "%02d.%02d.%02d", ed, em, ey%1000)
                } else {
                    return String(format: "%02d-%02d.%02d.%02d", bd, ed, em, ey%1000)
                }
            } else {
                return String(format: "%02d.%02d-%02d.%02d.%02d", bd, bm, ed, em, ey%1000)
            }
        } else {
            return String(format: "%02d.%02d.%02d-%02d.%02d.%02d", bd, bm, by%1000, ed, em, ey%1000)
        }
    }
}
