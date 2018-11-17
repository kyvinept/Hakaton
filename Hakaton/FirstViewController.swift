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

}
