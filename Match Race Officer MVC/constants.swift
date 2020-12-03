//
//  constants.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 29.11.2020.
//

import UIKit

extension UIColor {
    static let m_grey           = UIColor(hue: 0.000, saturation: 0.000, brightness: 0.200, alpha: 0.100)
    static let m_blue           = UIColor(hue: 0.600, saturation: 0.400, brightness: 1.000, alpha: 1.000)
    static let m_yellow         = UIColor(hue: 0.130, saturation: 0.600, brightness: 1.000, alpha: 1.000)
    static let m_grey4dark      = UIColor(hue: 0.000, saturation: 0.000, brightness: 0.900, alpha: 0.300)
    static let m_blue4dark      = UIColor(hue: 0.600, saturation: 1.000, brightness: 1.000, alpha: 0.700)
    static let m_yellow4dark    = UIColor(hue: 0.130, saturation: 1.000, brightness: 1.000, alpha: 0.700)
}

/*

extension String {
    func htmlAttributedString(size: CGFloat, color: UIColor) -> NSAttributedString? {
//        let c = color.hexString
//        let clr = c != nil ? "color: \(c!);" : ""
        let htmlTemplate = """
        <!doctype html>
        <html>
          <head>
            <style>
              body {
                color: -apple-label;
                font-family: -apple-system;
                font-size: \(size)px;
              }
            </style>
          </head>
          <body>
            \(self)
          </body>
        </html>
        """

        guard let data = htmlTemplate.data(using: .utf8) else {
            return NSAttributedString(string: self)
        }

        guard let attributedString = try? NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        ) else {
            return NSAttributedString(string: self)
        }
        return attributedString
    }
}

extension UIColor {
    var hexString:String? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: nil) {
            return  String(format: "#%02x%02x%02x", (Int)(r * 255), (Int)(g * 255), (Int)(b * 255))
        }
        return nil
    }
}

*/

    /*
    let grey4light     = UIColor(hue: 0.000, saturation: 0.000, brightness: 0.200, alpha: 0.100)
let blue4light     = UIColor(hue: 0.600, saturation: 0.400, brightness: 1.000, alpha: 1.000)
let yellow4light   = UIColor(hue: 0.130, saturation: 0.600, brightness: 1.000, alpha: 1.000)
let grey4dark      = UIColor(hue: 0.000, saturation: 0.000, brightness: 0.900, alpha: 0.300)
let machBlue4dark      = UIColor(hue: 0.600, saturation: 1.000, brightness: 1.000, alpha: 0.700)
let yellow4dark    = UIColor(hue: 0.130, saturation: 1.000, brightness: 1.000, alpha: 0.700)
*/
