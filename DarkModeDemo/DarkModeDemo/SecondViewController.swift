//
//  SecondViewController.swift
//  DarkModeDemo
//
//  Created by SHUBHAM AGARWAL on 03/07/21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var viewSecond: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSecond.backgroundColor = UIColor.setColor(lightColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), darkColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
    }
}

extension UIColor {
    
   static func setColor(lightColor: UIColor, darkColor: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor{ (traitCollection) -> UIColor in
                return traitCollection.userInterfaceStyle == .light ? lightColor : darkColor
            }
        } else {
            return lightColor
        }
    }
    
}
