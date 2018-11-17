//
//  BaloonViewController.swift
//  Hakaton
//
//  Created by Vlada Radchenko on 11/17/18.
//  Copyright © 2018 Silchenko. All rights reserved.
//

import UIKit

class BaloonViewController: UIViewController {

    let centerBaloon = UIImageView(image: UIImage(named:"center_baloon.png"))
    var centerBaloonHeight: CGFloat = 0
    var centerBaloonWidth: CGFloat = 0

    let greenBaloon = UIImageView(image: UIImage(named:"green_baloon.png"))
    let redBaloon = UIImageView(image: UIImage(named:"red_baloon.png"))

    var sparkles: [UIImageView] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let ratio = centerBaloon.frame.height / centerBaloon.frame.height
        let addheight = 40 * ratio
        centerBaloonWidth = centerBaloon.frame.width + 40
        centerBaloonHeight = centerBaloon.frame.height + addheight

        setCenterBaloonImageSize()
        view.addSubview(centerBaloon)

        setRedBaloonImageSize()
        view.addSubview(redBaloon)
        view.sendSubviewToBack(redBaloon)

        setGreenBaloonImageSize()
        view.addSubview(greenBaloon)
        view.sendSubviewToBack(greenBaloon)

        let sparkle = UIImageView(image: UIImage(named:"sparkles.png"))
        let imageHeight = sparkle.frame.height
        let imageWidth = sparkle.frame.width

        for xCount in 0...Int(view.frame.width/(imageWidth + 60)) {
            for yCount in 0...Int(view.frame.height/(imageHeight + 60)) {
                let sparkle = UIImageView(image: UIImage(named:"sparkles.png"))
                sparkle.frame = CGRect(x: CGFloat(xCount * Int(imageWidth + 60)), y: CGFloat(yCount * Int(imageHeight + 60)), width: imageWidth, height: imageHeight)
                sparkles.append(sparkle)
                view.addSubview(sparkle)
                view.sendSubviewToBack(sparkle)
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imagesAnimation()
    }

    func setCenterBaloonImageSize() {
        centerBaloon.frame.size = CGSize(width: centerBaloonWidth, height: centerBaloonHeight)
        centerBaloon.frame.origin.x = (view.frame.width - centerBaloon.frame.width) / 2
        centerBaloon.frame.origin.y = (view.frame.height - centerBaloon.frame.height) / 2
    }

    func setRedBaloonImageSize() {
        redBaloon.frame.origin.x = centerBaloon.frame.origin.x - redBaloon.frame.width  + 150
        redBaloon.frame.origin.y = (view.frame.height - redBaloon.frame.height) / 2
    }

    func setGreenBaloonImageSize() {
        greenBaloon.frame = CGRect(x: centerBaloon.frame.origin.x + centerBaloon.frame.width  - 150, y: (view.frame.height - redBaloon.frame.height) / 2, width: redBaloon.frame.width, height: redBaloon.frame.height)
    }

    func setDownImagePosition() {
        centerBaloon.frame.origin.x = (view.frame.width - centerBaloon.frame.width) / 2
        centerBaloon.frame.origin.y = view.frame.height - centerBaloon.frame.height + 50
        redBaloon.frame.origin.x = centerBaloon.frame.origin.x - redBaloon.frame.width  +  150
        redBaloon.frame.origin.y = view.frame.height - redBaloon.frame.height + 50
        greenBaloon.frame = CGRect(x: centerBaloon.frame.origin.x + centerBaloon.frame.width  - 150, y: view.frame.height - redBaloon.frame.height + 50, width: redBaloon.frame.width, height: redBaloon.frame.height)
    }

    func imagesAnimation() {
        UIView.animate(withDuration: 5, animations: {
            while (self.centerBaloon.frame.origin.y > -150 || self.greenBaloon.frame.origin.y > -150 || self.redBaloon.frame.origin.y > -150) {
                self.centerBaloon.frame.origin.y -= 6
                self.greenBaloon.frame.origin.y -= 6
                self.greenBaloon.frame.origin.x += 1
                self.redBaloon.frame.origin.y -= 6
                self.redBaloon.frame.origin.x -= 1
                for sparkle in self.sparkles {
                    sparkle.alpha = CGFloat.random(in: 0...1)
                }
            }
        }) { (result) in
            self.setDownImagePosition()
            self.imagesAnimation()
        }
    }
}
