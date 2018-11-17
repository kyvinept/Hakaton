//
//  FirstViewController.swift
//  Hakaton
//
//  Created by Sergey Pogrebnyak on 17.11.2018.
//  Copyright © 2018 Silchenko. All rights reserved.
//

import UIKit
import OBShapedButton

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var firstButton: OBShapedButton!
    @IBOutlet weak var zeroButton: OBShapedButton!
    let stars = [UIImage(named: "star"), UIImage(named: "star-1"), UIImage(named: "star-2"), UIImage(named: "star-3"), UIImage(named: "star-4")]
    var isShowed: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        //createStars(
        label.animate(newText: "if dayOfYear== 24.11.2018{", characterDelay: 0.25, compleation: {
            self.createStars()
            self.isShowed = true
        })
        label2.animate(newText: "print(Поздравляем!!!)", characterDelay: 0.25)
        label3.animate(newText: "drinkBeer()}", characterDelay: 0.25)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isShowed {
            self.createStars()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        for view in self.view.subviews {
            if let imageView = view as? UIImageView, imageView.image != UIImage(named: "backgroundFirst") {
                imageView.removeFromSuperview()
            }
        }
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
    

    @IBAction func firstAction(_ sender: Any) {
        pushBaloons()

    }

    @IBAction func zeroAction(_ sender: Any) {
         pushBaloons()
    }

    func pushBaloons() {
        let VControl = UIStoryboard.init(name: "Baloons",
                                         bundle: nil ).instantiateViewController(
                                            withIdentifier: "BaloonViewController")
        self.navigationController?.pushViewController(VControl, animated: true)
    }

    @IBAction func iphoneAction(_ sender: Any) {
        let index = Int.random(in: 0..<array.count)
        print(array[index])

        let alert = UIAlertController(title: array[index], message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        var imageView = UIImageView(frame: CGRect(x: 220, y: 10, width: 40, height: 40))
        imageView.image = UIImage(named: "nixLogo")

        alert.view.addSubview(imageView)


        self.present(alert, animated: true, completion: nil)
    }
    let array = ["Ты совершенство во всём.",
                 "Лучше тебя не бывает.",
                 "Будь на волне успеха.",
                 "Действуй. Решай. Побеждай.",
                 "Там где ты − всегда праздник!",
                 "Возьми СЧАСТЬЕ за правило!",
                 "Верь в мечты! Они сбываются.",
                 "Успех – для лучших... Таких, как ты!",
                 "Мечтай. Верь в себя. Побеждай!",
                 "Ярких достижений и успехов во всём!",
                 "Успехов",
                 "Добра",
                 "Удачи"]
}
extension UILabel {
    func animate(newText: String, characterDelay: TimeInterval, compleation: @escaping () -> Void) {
        DispatchQueue.main.async {
            self.text = ""
            for (index, character) in newText.characters.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    self.text?.append(character)
                    self.fadeTransition(characterDelay)
                    if index == newText.count-1 {
                        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                            compleation()
                        })

                    }
                }
            }
        }
    }
    func animate(newText: String, characterDelay: TimeInterval) {
        DispatchQueue.main.async {
            self.text = ""
            for (index, character) in newText.characters.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    self.text?.append(character)
                    self.fadeTransition(characterDelay)
                }
            }
        }
    }
}
extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}
