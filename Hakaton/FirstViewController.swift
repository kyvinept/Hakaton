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

    @IBOutlet weak var firstButton: OBShapedButton!
    @IBOutlet weak var zeroButton: OBShapedButton!


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func firstAction(_ sender: Any) {
        print("1")

    }

    @IBAction func zeroAction(_ sender: Any) {
         print("0")
    }

    @IBAction func iphoneAction(_ sender: Any) {
        let index = Int.random(in: 0..<array.count)
        print(array[index])

        let alert = UIAlertController(title: "Alert", message: array[index], preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))

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
