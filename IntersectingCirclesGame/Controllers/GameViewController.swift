//
//  GameViewController.swift
//  IntersectingCirclesGame
//
//  Created by Milana Antonova on 8.01.23.
//

import UIKit

class GameViewController: UIViewController {

    //MARK: - let/var
    let size: CGFloat = 150
    var circleArray: [UIView] = []
    
    //MARK: - lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureRecognizer()
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapDetected(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: sender.view)
        let newCircle = createCircle(tapLocation)
        removeIntersectedCircles(with: newCircle)
        circleArray.append(newCircle)
        self.view.addSubview(newCircle)
    }
    
    //MARK: - flow funcs
    private func addTapGestureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    private func createCircle(_ tapLocation: CGPoint) -> UIView {
        let circle = UIView()
        circle.frame = CGRect(x: tapLocation.x - size/2, y: tapLocation.y - size/2, width: size, height: size)
        circle.backgroundColor = .randonColor
        circle.layer.cornerRadius = size/2
        return circle
    }
    
    private func removeIntersectedCircles(with newCircle: UIView) {
        for circle in circleArray {
            if newCircle.frame.intersects(circle.frame) {
                circle.removeFromSuperview()
                circleArray = circleArray.filter({ $0 != circle })
            }
        }
    }
    
}
