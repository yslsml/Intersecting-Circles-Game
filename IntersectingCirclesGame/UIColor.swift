//
//  UIColor.swift
//  IntersectingCirclesGame
//
//  Created by Milana Antonova on 10.01.23.
//

import UIKit

extension UIColor {
    static var randonColor: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
