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

    var greetingLabel = UILabel()
    var isLabelAdded: Bool = false

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let ratio = centerBaloon.frame.height / centerBaloon.frame.height
        let addheight = 40 * ratio
        centerBaloonWidth = centerBaloon.frame.width + 40
        centerBaloonHeight = centerBaloon.frame.height + addheight

        setDownImagePosition()

        view.addSubview(centerBaloon)

        view.addSubview(redBaloon)
        view.sendSubviewToBack(redBaloon)

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

        greetingLabel.text = "IPhone X – стал самым ожидаемый телефоном 2017 года. Его утонченный дизайн, многофункциональность, а также возможности – покорили сердца многих. Нашему отделу уже 10 лет, мы надеемся, что будет еще больше интересных проектов, количество разработчиков будет только увеличиваться, а качество продукции станет лучшим на рынке."
        greetingLabel.numberOfLines = 0
        greetingLabel.textAlignment = .center
        greetingLabel.font = greetingLabel.font.withSize(20)
        greetingLabel.frame.size = CGSize(width: 300, height: 500)
        greetingLabel.frame.origin.x = (view.frame.width - 300) / 2
        greetingLabel.frame.origin.y = view.frame.height
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(greetingLabel)
        imagesAnimation()
    }

    func setDownImagePosition() {
        centerBaloon.frame.origin.x = (view.frame.width - centerBaloon.frame.width) / 2
        centerBaloon.frame.origin.y = view.frame.height - centerBaloon.frame.height + 50
        redBaloon.frame.origin.x = centerBaloon.frame.origin.x - redBaloon.frame.width  +  150
        redBaloon.frame.origin.y = view.frame.height - redBaloon.frame.height + 50
        greenBaloon.frame = CGRect(x: centerBaloon.frame.origin.x + centerBaloon.frame.width  - 150, y: view.frame.height - redBaloon.frame.height + 50, width: redBaloon.frame.width, height: redBaloon.frame.height)
    }

    func changeSparklesAlpha() {
        for sparkle in self.sparkles {
            sparkle.alpha = CGFloat.random(in: 0...1)
        }
    }

    func imagesAnimation() {
        UIView.animate(withDuration: 5, animations: {
            while (self.centerBaloon.frame.origin.y > -150 || self.greenBaloon.frame.origin.y > -150 || self.redBaloon.frame.origin.y > -150) {
                self.centerBaloon.frame.origin.y -= 6
                self.greenBaloon.frame.origin.y -= 6
                self.greenBaloon.frame.origin.x += 1
                self.redBaloon.frame.origin.y -= 6
                self.redBaloon.frame.origin.x -= 1
                self.changeSparklesAlpha()
                self.greetingLabel.frame.origin.y = self.centerBaloon.frame.origin.y + self.centerBaloon.frame.height
                if (!self.isLabelAdded) {
                    self.view.addSubview(self.greetingLabel)
                    self.isLabelAdded = true
                }
            }
        }) { (result) in
            self.centerBaloon.removeFromSuperview()
            self.greenBaloon.removeFromSuperview()
            self.redBaloon.removeFromSuperview()

            UIView.animate(withDuration: 2, animations: {
                self.greetingLabel.center = self.view.center
            })
            UIView.animate(withDuration: 1, delay: 0, options: [.repeat,.autoreverse], animations: {
                self.changeSparklesAlpha()
            }, completion: nil)
        }
    }
}
