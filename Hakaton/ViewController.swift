//
//  ViewController.swift
//  Hakaton
//
//  Created by Silchenko on 17.11.2018.
//  Copyright © 2018 Silchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        createStars()
    }
    let stars = [UIImage(named: "star"), UIImage(named: "star-1"), UIImage(named: "star-2"), UIImage(named: "star-3"), UIImage(named: "star-4")]
    @IBAction func buttonAction(_ sender: Any) {

        let VControl = UIStoryboard.init(name: "First",
                                          bundle: nil ).instantiateViewController(
                                            withIdentifier: "FirstViewController")


        self.navigationController?.pushViewController(VControl, animated: false)
    }
    private func createStars() {
        let countStars = 50
        for i in 0...countStars {
            let imageView = UIImageView(image: stars[Int.random(in: 0...stars.count-1)])
            self.view.addSubview(imageView)
            imageView.center = self.view.center

            let anim = CABasicAnimation(keyPath: "position")
            anim.fromValue = imageView.center
            anim.toValue = CGPoint(x: 1000.0 * sin(Double(i)*360/Double(countStars)), y: 1000.0 * cos(Double(i)*360.0/Double(countStars)))
            anim.beginTime = Double.random(in: 0...3)
            anim.duration = 3
            anim.repeatCount = .infinity
            imageView.layer.add(anim, forKey: "position")
        }
    }

}

